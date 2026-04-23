# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Directory Is

`NANDIP/` is a **read-only static snapshot** of the NFC RTL, packaged as a Vivado IP-XACT component. **Do not edit RTL files here directly.** All RTL changes must be made in `../NFC/NFC.srcs/sources_1/` and then manually copied here.

## Directory Structure

- `component.xml` — IP-XACT 1685-2009 descriptor. Defines bus interfaces (AXI-Lite slave, AXI-Stream master/slave), exposed parameters (CHAN_NUM, DATA_WIDTH), ports, and file set membership.
- `src/` — Static copy of all `.v`/`.vh` sources from NFC, plus XCI stubs for the 4 FIFO generator IPs (`asyn_req_fifo`, `asyn_res_fifo`, `asyn_fifo_wr`, `asyn_fifo_rd`).
- `xgui/nfc_top_v1_0.tcl` — Vivado IP Customization GUI layout. Currently exposes CHAN_NUM and DATA_WIDTH parameters.

## Sync Procedure (NFC → NANDIP)

After editing any file under `../NFC/NFC.srcs/sources_1/new/` or `../NFC/NFC.srcs/sources_1/FCC/`:

1. Copy changed `.v`/`.vh` files to `src/` (flat — no subdirectory hierarchy).
2. Do **not** copy `tb_nfc_top_channel.v` from sim_1 unless intentionally updating the testbench stub here.
3. Re-package IP in Vivado: NFC project → Tools → Create and Package IP → re-use existing NANDIP path.
4. Verify TopModule is `nfc_top` (not `nfc_test_top`) in the packaging wizard.
5. In `Z19_NFC/`, open BD → right-click IP → Upgrade IP → re-generate products.

## component.xml Key Facts

- IP identity: `xilinx.com:user:nfc_top:1.0`
- Bus interfaces: `s_axil` (AXI4-Lite slave), `s_axis` (AXI-Stream slave, write data in), `m_axis` (AXI-Stream master, read data out)
- Clock/reset ports are associated to their bus interfaces via `spirit:busInterface` entries — if ports are added to `nfc_top`, add matching entries here or re-run packaging.
- The FIFO XCI files (`src/asyn_*/`) are Xilinx-generated; their `.xml` sidecar files record the IP customization. Do not hand-edit these.

## Common Mistakes

- Editing `.v` files in `src/` directly — changes will be silently overwritten on next NFC sync.
- Forgetting to update `component.xml` version string after interface changes (causes Z19_NFC to not detect an upgrade).
- Copying the NFC testbench (`tb_nfc_top_channel.v`) into production file sets — it is present here as a reference stub only and should not be in the synthesis file set.
