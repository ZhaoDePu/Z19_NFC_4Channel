#include "xil_printf.h"
#include "xil_io.h"
#include "xaxidma.h"
#include "xparameters.h"
#include "sleep.h"
#include "xil_cache.h"

// --- 硬件地址 ---
#define NFC_BASE        0x90000000UL
#define NFC_CH_NUM      4U
#define NFC_CH_STRIDE   0x40U
#define BRAM_CH_RD_OFF  0x1000U

// --- 测试数据大小：4KB（安全，远小于 16KB 页，DMA Simple 模式无问题）---
#define TEST_LEN    1024U

// --- NFC 寄存器 ---
#define NFC_CMD_OPC     0x00
#define NFC_CMD_VALID   0x04
#define NFC_STATUS      0x08
#define NFC_LBA_L       0x10
#define NFC_LBA_H       0x14
#define NFC_LEN         0x18
#define NFC_RES_DATA_L  0x20
#define NFC_RES_DATA_H  0x24
#define NFC_RES_CID     0x28
#define NFC_RES_ACK     0x2C

#define POLL_TO     5000000

static XAxiDma g_dmas[NFC_CH_NUM];

static const u16 g_dma_dev_ids[NFC_CH_NUM] = {
    XPAR_AXIDMA_0_DEVICE_ID,
    XPAR_AXIDMA_1_DEVICE_ID,
    XPAR_AXIDMA_2_DEVICE_ID,
    XPAR_AXIDMA_3_DEVICE_ID
};

static const u32 g_bram_base[NFC_CH_NUM] = {
    XPAR_BRAM_0_BASEADDR,
    XPAR_BRAM_1_BASEADDR,
    XPAR_BRAM_2_BASEADDR,
    XPAR_BRAM_3_BASEADDR
};

static u32 nfc_base_of(u32 ch)      { return NFC_BASE + ch * NFC_CH_STRIDE; }
static u32 bram_wr_base_of(u32 ch)  { return g_bram_base[ch]; }
static u32 bram_rd_base_of(u32 ch)  { return g_bram_base[ch] + BRAM_CH_RD_OFF; }

static void nfc_wr(u32 ch, u32 off, u32 v) { Xil_Out32(nfc_base_of(ch) + off, v); }
static u32  nfc_rd(u32 ch, u32 off)        { return Xil_In32(nfc_base_of(ch) + off); }

static int nfc_fire(u32 ch, u16 opc, u32 lba_l, u32 len)
{
    xil_printf("DBG CH%u: nfc_fire enter OPC=0x%04X\r\n", ch, opc);

    nfc_wr(ch, NFC_CMD_OPC, opc);
    nfc_wr(ch, NFC_LBA_L,   lba_l);
    nfc_wr(ch, NFC_LBA_H,   0);
    nfc_wr(ch, NFC_LEN,     len);

    int i;
    for (i = 0; i < POLL_TO; i++) {
        if (nfc_rd(ch, NFC_STATUS) & 0x01)
            break;
    }
    if (i == POLL_TO) {
            xil_printf("ERR: CH%u cmd ready timeout! STATUS=0x%08X OPC=0x%04X\r\n",
                    ch, nfc_rd(ch, NFC_STATUS), opc);
            return -1;
        }
    xil_printf("DBG CH%u: cmd ready ok\r\n", ch);

    nfc_wr(ch, NFC_CMD_VALID, 1);
    xil_printf("CH%u CMD OPC=0x%04X addr=0x%08X len=%d\r\n", ch, opc, lba_l, len);
    return 0;
}

static int nfc_wait_resp(u32 ch)
{
    xil_printf("DBG CH%u: wait response...\r\n", ch);
    int i;
    for (i = 0; i < POLL_TO; i++)
        if (nfc_rd(ch, NFC_STATUS) & 0x02) break;
    if (i == POLL_TO) {
        xil_printf("ERR: CH%u response timeout! STATUS=0x%08X\r\n", ch, nfc_rd(ch, NFC_STATUS));
        return -1;
    }
    u32 res_l   = nfc_rd(ch, NFC_RES_DATA_L);
    u32 res_h   = nfc_rd(ch, NFC_RES_DATA_H);
    u16 res_cid = (u16)nfc_rd(ch, NFC_RES_CID);
    xil_printf("CH%u RSP CID=0x%04X DATA=%08X_%08X STATUS=0x%02X\r\n",
               ch, res_cid, res_h, res_l, nfc_rd(ch, NFC_STATUS));
    nfc_wr(ch, NFC_RES_ACK, 1);
    return 0;
}

// S2MM: NFC → BRAM（先启动 DMA，再发 NFC 命令）
static int dma_recv(u32 ch, u32 byte_len)
{
    u32 bram_rd = bram_rd_base_of(ch);
    XAxiDma *dma = &g_dmas[ch];

    xil_printf("DBG CH%u: dma_recv start len=%u addr=0x%08X\r\n", ch, byte_len, bram_rd);
    Xil_DCacheInvalidateRange((UINTPTR)bram_rd, byte_len);
    int st = XAxiDma_SimpleTransfer(dma, (UINTPTR)bram_rd,
                                    byte_len, XAXIDMA_DEVICE_TO_DMA);
    if (st != XST_SUCCESS) {
        xil_printf("ERR: CH%u XAxiDma_SimpleTransfer(S2MM) failed %d\r\n", ch, st);
        return -1;
    }
    int to = 0;
    while (XAxiDma_Busy(dma, XAXIDMA_DEVICE_TO_DMA)) {
        if (++to > POLL_TO) {
            xil_printf("ERR: CH%u DMA S2MM timeout\r\n", ch);
            return -1;
        }
    }
    xil_printf("DBG CH%u: dma_recv done\r\n", ch);
    Xil_DCacheInvalidateRange((UINTPTR)bram_rd, byte_len);
    return 0;
}

// MM2S: BRAM → NFC（先启动 DMA，再发 NFC 命令）
static int dma_send(u32 ch, u32 byte_len)
{
    u32 bram_wr = bram_wr_base_of(ch);
    XAxiDma *dma = &g_dmas[ch];

    xil_printf("DBG CH%u: dma_send start len=%u addr=0x%08X\r\n", ch, byte_len, bram_wr);
    Xil_DCacheFlushRange((UINTPTR)bram_wr, byte_len);
    int st = XAxiDma_SimpleTransfer(dma, (UINTPTR)bram_wr,
                                    byte_len, XAXIDMA_DMA_TO_DEVICE);
    if (st != XST_SUCCESS) {
        xil_printf("ERR: CH%u XAxiDma_SimpleTransfer(MM2S) failed %d\r\n", ch, st);
        return -1;
    }
    int to = 0;
    while (XAxiDma_Busy(dma, XAXIDMA_DMA_TO_DEVICE)) {
        if (++to > POLL_TO) {
            xil_printf("ERR: CH%u DMA MM2S timeout\r\n", ch);
            return -1;
        }
    }
    xil_printf("DBG CH%u: dma_send done\r\n", ch);
    return 0;
}

static void print_hex(u32 base, u32 len)
{
    u32 rows = (len + 15) / 16;
    for (u32 i = 0; i < rows; i++) {
        xil_printf("%04X:", i * 16);
        for (u32 j = 0; j < 16; j++) {
            if (i * 16 + j < len)
                xil_printf(" %02X", Xil_In8(base + i*16 + j));
        }
        xil_printf("\r\n");
    }
}

int main(void)
{
    u32 cur_ch = 0;

    Xil_DCacheDisable();

    for (u32 ch = 0; ch < NFC_CH_NUM; ch++) {
        XAxiDma_Config *cfg = XAxiDma_LookupConfig(g_dma_dev_ids[ch]);
        if (cfg == NULL) {
            xil_printf("ERR: CH%u XAxiDma_LookupConfig failed\r\n", ch);
            return -1;
        }

        int st = XAxiDma_CfgInitialize(&g_dmas[ch], cfg);
        if (st != XST_SUCCESS) {
            xil_printf("ERR: CH%u XAxiDma_CfgInitialize failed %d\r\n", ch, st);
            return -1;
        }

        XAxiDma_Reset(&g_dmas[ch]);
        while (!XAxiDma_ResetIsDone(&g_dmas[ch])) {}
        XAxiDma_IntrDisable(&g_dmas[ch], XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
        XAxiDma_IntrDisable(&g_dmas[ch], XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
    }

    xil_printf("\r\n=== NAND Test ===\r\n");
    xil_printf("a/s/d/f=Select CH0/1/2/3\r\n");
    xil_printf("1=Reset  2=SetCfg  3=SetTiming  4=ReadID\r\n");
    xil_printf("5=Erase  6=Read    7=Program     8=GetParam  9=GetFeature\r\n");
    xil_printf("e=Erase  w=Write   b=ReadBack    v=Verify\r\n");

    for (;;) {
        xil_printf("\r\n[CH%u] > ", cur_ch);
        char c = (char)inbyte();
        outbyte(c);
        xil_printf("\r\n");

        switch (c) {

        case 'a':
            cur_ch = 0;
            xil_printf("Switched to CH0\r\n");
            break;

        case 's':
            cur_ch = 1;
            xil_printf("Switched to CH1\r\n");
            break;

        case 'd':
            cur_ch = 2;
            xil_printf("Switched to CH2\r\n");
            break;

        case 'f':
            cur_ch = 3;
            xil_printf("Switched to CH3\r\n");
            break;

        case '1':   // Reset
            if (nfc_fire(cur_ch, 0x00FF, 0, 0) != 0) break;
            usleep(1000);
            nfc_wait_resp(cur_ch);
            break;

        case '2':   // Set Configuration (NV-DDR2)
            if (nfc_fire(cur_ch, 0x02EF, 0, 0) != 0) break;
            nfc_wait_resp(cur_ch);
            break;

        case '3':   // Set Timing
            if (nfc_fire(cur_ch, 0x01EF, 0, 0) != 0) break;
            nfc_wait_resp(cur_ch);
            break;

        case '4':   // Read ID
            if (nfc_fire(cur_ch, 0x2090, 0, 0) != 0) break;
            nfc_wait_resp(cur_ch);
            break;

        case '5':   // Erase Block (LBA=0)
            xil_printf("CH%u Erasing block at LBA=0...\r\n", cur_ch);
            if (nfc_fire(cur_ch, 0xD060, 0, 0) != 0) break;
            nfc_wait_resp(cur_ch);
            break;

        case '6':   // Read Page (S2MM) — 先启动 DMA，再发命令
        {
            u32 bram_rd = bram_rd_base_of(cur_ch);
            XAxiDma *dma = &g_dmas[cur_ch];

            xil_printf("CH%u Reading %d bytes from LBA=0...\r\n", cur_ch, TEST_LEN);
            Xil_DCacheInvalidateRange((UINTPTR)bram_rd, TEST_LEN);
            if (XAxiDma_SimpleTransfer(dma, (UINTPTR)bram_rd,
                                       TEST_LEN, XAXIDMA_DEVICE_TO_DMA) != XST_SUCCESS) {
                xil_printf("ERR: CH%u DMA S2MM start failed\r\n", cur_ch);
                break;
            }

            if (nfc_fire(cur_ch, 0x3000, 0, TEST_LEN) != 0) break;
            nfc_wait_resp(cur_ch);

            int to = 0;
            while (XAxiDma_Busy(dma, XAXIDMA_DEVICE_TO_DMA)) {
                if (++to > POLL_TO) { xil_printf("ERR: CH%u DMA S2MM timeout\r\n", cur_ch); break; }
            }
            Xil_DCacheInvalidateRange((UINTPTR)bram_rd, TEST_LEN);
            xil_printf("--- CH%u Read Data (%d bytes) ---\r\n", cur_ch, TEST_LEN);
            print_hex(bram_rd, TEST_LEN);
            break;
        }

        case '7':   // Program Page (MM2S) — 先填数据+启动 DMA，再发命令
        {
            u32 bram_wr = bram_wr_base_of(cur_ch);

            xil_printf("CH%u Programming %d bytes to LBA=0 (pattern=0xA5)...\r\n", cur_ch, TEST_LEN);
            for (u32 i = 0; i < TEST_LEN; i++)
                Xil_Out8(bram_wr + i, 0xA5);
            xil_printf("DBG CH%u: step1 fill done\r\n", cur_ch);

            if (dma_send(cur_ch, TEST_LEN) != 0)
                break;
            xil_printf("DBG CH%u: step2 dma_send done\r\n", cur_ch);

            if (nfc_fire(cur_ch, 0x1080, 0, TEST_LEN) != 0) break;
            xil_printf("DBG CH%u: step3 nfc_fire done\r\n", cur_ch);
            nfc_wait_resp(cur_ch);
            xil_printf("DBG CH%u: step4 nfc_wait_resp done\r\n", cur_ch);
            break;
        }

        case '8':   // Get Parameter (0x00EC) 256 bytes
        {
            u32 bram_rd = bram_rd_base_of(cur_ch);
            XAxiDma *dma = &g_dmas[cur_ch];

            xil_printf("CH%u Getting ONFI parameter page...\r\n", cur_ch);
            Xil_DCacheInvalidateRange((UINTPTR)bram_rd, 256);
            if (XAxiDma_SimpleTransfer(dma, (UINTPTR)bram_rd,
                                       256, XAXIDMA_DEVICE_TO_DMA) != XST_SUCCESS) {
                xil_printf("ERR: CH%u DMA S2MM start failed\r\n", cur_ch);
                break;
            }
            if (nfc_fire(cur_ch, 0x00EC, 0, 0) != 0) break;
            nfc_wait_resp(cur_ch);
            int to = 0;
            while (XAxiDma_Busy(dma, XAXIDMA_DEVICE_TO_DMA)) {
                if (++to > POLL_TO) { xil_printf("ERR: CH%u DMA S2MM timeout\r\n", cur_ch); break; }
            }
            Xil_DCacheInvalidateRange((UINTPTR)bram_rd, 256);
            xil_printf("--- CH%u ONFI Parameter Page (256 bytes) ---\r\n", cur_ch);
            print_hex(bram_rd, 256);
            break;
        }

        case '9':   // Get Feature
            if (nfc_fire(cur_ch, 0xFAEE, 0, 0) != 0) break;
            nfc_wait_resp(cur_ch);
            break;

        case 'e':   // Erase Block (LBA=0)
            xil_printf("CH%u Erasing block at LBA=0...\r\n", cur_ch);
            if (nfc_fire(cur_ch, 0xD060, 0, 0) != 0) break;
            nfc_wait_resp(cur_ch);
            break;

        case 'w':   // Program Page (MM2S) — fill 0xA5, DMA then NFC
        {
            u32 bram_wr = bram_wr_base_of(cur_ch);

            xil_printf("CH%u Programming %d bytes (0xA5) to LBA=0...\r\n", cur_ch, TEST_LEN);
            for (u32 i = 0; i < TEST_LEN; i++)
                Xil_Out8(bram_wr + i, 0xA5);
            xil_printf("DBG CH%u: step1 fill done\r\n", cur_ch);

            if (dma_send(cur_ch, TEST_LEN) != 0)
                break;
            xil_printf("DBG CH%u: step2 dma_send done\r\n", cur_ch);

            if (nfc_fire(cur_ch, 0x1080, 0, TEST_LEN) != 0) break;
            xil_printf("DBG CH%u: step3 nfc_fire done\r\n", cur_ch);
            nfc_wait_resp(cur_ch);
            xil_printf("DBG CH%u: step4 nfc_wait_resp done\r\n", cur_ch);
            break;
        }

        case 'b':   // Read back Page (S2MM) — DMA then NFC
        {
            u32 bram_rd = bram_rd_base_of(cur_ch);
            XAxiDma *dma = &g_dmas[cur_ch];

            xil_printf("CH%u Reading back %d bytes from LBA=0...\r\n", cur_ch, TEST_LEN);
            for (u32 i = 0; i < TEST_LEN; i++)
                Xil_Out8(bram_rd + i, 0x00);
            Xil_DCacheInvalidateRange((UINTPTR)bram_rd, TEST_LEN);
            if (XAxiDma_SimpleTransfer(dma, (UINTPTR)bram_rd,
                                       TEST_LEN, XAXIDMA_DEVICE_TO_DMA) != XST_SUCCESS) {
                xil_printf("ERR: CH%u DMA S2MM start failed\r\n", cur_ch); break;
            }
            if (nfc_fire(cur_ch, 0x3000, 0, TEST_LEN) != 0) break;
            nfc_wait_resp(cur_ch);
            int to_b = 0;
            while (XAxiDma_Busy(dma, XAXIDMA_DEVICE_TO_DMA)) {
                if (++to_b > POLL_TO) { xil_printf("ERR: CH%u DMA S2MM timeout\r\n", cur_ch); break; }
            }
            Xil_DCacheInvalidateRange((UINTPTR)bram_rd, TEST_LEN);
            xil_printf("--- CH%u Read Data (%d bytes) ---\r\n", cur_ch, TEST_LEN);
            print_hex(bram_rd, TEST_LEN);
            break;
        }

        case 'v':   // Verify BRAM contents against 0xA5
        {
            u32 bram_rd = bram_rd_base_of(cur_ch);

            xil_printf("CH%u Verifying %d bytes in BRAM against 0xA5...\r\n", cur_ch, TEST_LEN);
            u32 err_cnt = 0;
            for (u32 i = 0; i < TEST_LEN; i++) {
                u8 v = Xil_In8(bram_rd + i);
                if (v != 0xA5) {
                    if (err_cnt < 8)
                        xil_printf("  MISMATCH @ 0x%04X: got 0x%02X expected 0xA5\r\n", i, v);
                    err_cnt++;
                }
            }
            if (err_cnt == 0)
                xil_printf("PASS: All %d bytes match 0xA5\r\n", TEST_LEN);
            else {
                xil_printf("FAIL: %d mismatches\r\n", err_cnt);
                xil_printf("--- BRAM data (first 256 bytes) ---\r\n");
                print_hex(bram_rd, 256);
            }
            break;
        }

        default:
            xil_printf("a/s/d/f=Select CH0/1/2/3\r\n");
            xil_printf("1=Reset  2=SetCfg  3=SetTiming  4=ReadID\r\n");
            xil_printf("5=Erase  6=Read    7=Program     8=GetParam  9=GetFeature\r\n");
            xil_printf("e=Erase  w=Write   b=ReadBack    v=Verify\r\n");
            break;
        }
    }
    return 0;
}
