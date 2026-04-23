# aclk {FREQ_HZ 50000000 CLK_DOMAIN NFC_4Channel_bd_clk_wiz_0_0_nand_clk_fast PHASE 0.0} aclk1 {FREQ_HZ 50000000 CLK_DOMAIN NFC_4Channel_bd_clk_wiz_0_0_nand_clk_fast PHASE 0.0}
# Clock Domain: NFC_4Channel_bd_clk_wiz_0_0_nand_clk_fast
create_clock -name aclk -period 20.000 [get_ports aclk]
# Generated clocks
create_generated_clock -name aclk1 -source [get_ports aclk] -divide_by 1 [get_ports aclk1]
