# Z19_NFC_4Channel

**4-Channel NAND Flash Controller (NFC) FPGA IP Core**

> 四通道NAND Flash控制器（NFC）FPGA IP，支持多通道交替访问与高速数据传输，包含完整的物理层（FCC PHY）与控制逻辑设计，已完成时序收敛与差分信号验证。基于 Claude Code + DeepSeek 的 AI 辅助开发流程实现。

---

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Directory Structure](#directory-structure)
- [Dependencies](#dependencies)
- [Usage](#usage)
  - [Simulation](#simulation)
  - [Synthesis & Implementation](#synthesis--implementation)
  - [Timing Constraints](#timing-constraints)
- [Interface Description](#interface-description)
- [Development Workflow](#development-workflow)
- [License](#license)

---

## Project Overview

Z19_NFC_4Channel is an FPGA IP core implementing a **4-channel NAND Flash Controller (NFC)**.  
It provides a high-performance, scalable interface between a host system and up to four independent NAND Flash chips (or chip-enables), enabling interleaved / pipelined access to maximize throughput.

Key design goals:
- **High throughput** through 4-channel interleaved access
- **Full physical layer (PHY)** support including differential signalling (DQS/DQ)
- **Timing closure** verified for mainstream FPGA families
- **Ease of integration** via a clean AXI / native bus interface

---

## Features

| Feature | Description |
|---|---|
| Channel count | 4 independent NAND channels |
| NAND interface | Toggle-DDR / ONFI-compatible physical layer (FCC PHY) |
| Data width | 8-bit per channel (x8 devices) |
| Interleaving | Multi-channel interleaved / pipelined command scheduling |
| ECC | Pluggable ECC engine interface (BCH/LDPC hooks) |
| Differential signals | DQS differential pair support, verified |
| Timing convergence | Static timing analysis (STA) closed for target FPGA |
| Bus interface | AXI4-Lite control + AXI4-Stream / native data path |
| Clock domains | Separate controller clock and PHY I/O clock with CDC handling |
| FIFO buffering | Read / write data FIFOs per channel |
| AI-assisted design | Developed with Claude Code + DeepSeek AI workflow |

---

## Directory Structure

```
Z19_NFC_4Channel/
├── rtl/                        # Synthesisable RTL source files
│   ├── nfc_top.v               # Top-level NFC controller
│   ├── nfc_ctrl.v              # Command / address / data sequencer
│   ├── nfc_channel.v           # Per-channel arbitration and scheduling
│   ├── fcc_phy.v               # FCC physical layer (DDR I/O, DQS handling)
│   ├── nfc_fifo.v              # Read / write data FIFO
│   └── nfc_ecc_if.v            # ECC engine plug-in interface
├── tb/                         # Verification testbenches
│   ├── tb_nfc_top.v            # Top-level system testbench
│   ├── tb_fcc_phy.v            # PHY-level testbench
│   ├── nand_model/             # Behavioural NAND Flash model
│   └── scripts/                # Simulation run scripts
├── constraints/                # FPGA timing and pin constraints
│   ├── nfc_timing.xdc          # Vivado XDC timing constraints
│   └── nfc_pins.xdc            # Pin assignment constraints
├── docs/                       # Design documentation
│   ├── architecture.md         # Architecture overview
│   ├── register_map.md         # Register / CSR map
│   └── waveforms/              # Reference waveform screenshots
├── scripts/                    # Build and utility scripts
│   ├── sim_run.sh              # Simulation launch script
│   └── synth_run.tcl           # Vivado synthesis TCL script
└── README.md                   # This file
```

> **Note:** The directory structure above reflects the intended project layout. Some directories may be populated in subsequent commits as the design matures.

---

## Dependencies

| Tool | Version | Purpose |
|---|---|---|
| Xilinx Vivado | 2024.1 or later | Synthesis, implementation, STA |
| ModelSim / QuestaSim | 10.7 or later | RTL simulation |
| Icarus Verilog + GTKWave | 11+ / 3.3+ | Open-source simulation option |
| Python | 3.8+ | Utility and automation scripts |

NAND Flash device models (for simulation) should be obtained from the device vendor or a suitable open-source ONFI model.

---

## Usage

### Simulation

1. **Clone the repository**

   ```bash
   git clone https://github.com/ZhaoDePu/Z19_NFC_4Channel.git
   cd Z19_NFC_4Channel
   ```

2. **Run the top-level testbench with Icarus Verilog**

   ```bash
   cd tb/scripts
   bash sim_run.sh
   ```

   Or compile manually:

   ```bash
   iverilog -g2012 -o sim_nfc \
     ../nand_model/*.v \
     ../../rtl/*.v \
     ../tb_nfc_top.v
   vvp sim_nfc
   gtkwave dump.vcd
   ```

3. **Run with ModelSim / QuestaSim**

   ```bash
   vsim -do tb/scripts/sim_run.do
   ```

### Synthesis & Implementation

1. Open Vivado and source the synthesis script:

   ```tcl
   source scripts/synth_run.tcl
   ```

2. Or launch from the command line:

   ```bash
   vivado -mode batch -source scripts/synth_run.tcl
   ```

3. After synthesis, run implementation and generate the bitstream through the standard Vivado flow.

### Timing Constraints

Apply the provided XDC files in Vivado:

```
constraints/nfc_timing.xdc   – Clock definitions, input/output delays
constraints/nfc_pins.xdc     – Package pin assignments (update for your board)
```

Verify timing closure in the Vivado Timing Report; all setup and hold slack values should be non-negative.

---

## Interface Description

### Top-Level Ports (`nfc_top.v`)

| Port | Direction | Width | Description |
|---|---|---|---|
| `clk` | Input | 1 | System / controller clock |
| `rst_n` | Input | 1 | Active-low synchronous reset |
| `s_axi_*` | Input/Output | — | AXI4-Lite configuration slave |
| `nand_ce_n[3:0]` | Output | 4 | Chip-enable (active-low), one per channel |
| `nand_cle[3:0]` | Output | 4 | Command Latch Enable |
| `nand_ale[3:0]` | Output | 4 | Address Latch Enable |
| `nand_we_n[3:0]` | Output | 4 | Write Enable (active-low) |
| `nand_re_n[3:0]` | Output | 4 | Read Enable (active-low) |
| `nand_dqs[3:0]` | Inout | 4 | Data Strobe (differential pair P) |
| `nand_dqs_n[3:0]` | Inout | 4 | Data Strobe (differential pair N) |
| `nand_dq[31:0]` | Inout | 32 | Data bus (8-bit × 4 channels) |
| `nand_rb_n[3:0]` | Input | 4 | Ready / Busy (active-low) |

---

## Development Workflow

This project was developed using an **AI-assisted hardware design workflow**:

- **Claude Code** – used for RTL scaffolding, code review, and documentation generation
- **DeepSeek** – used for architectural exploration and constraint optimisation

The workflow demonstrates how large-language-model (LLM) tools can accelerate FPGA IP development while maintaining rigorous functional and timing verification.

---

## License

This project is released under the [MIT License](LICENSE).  
Copyright © 2024 ZhaoDePu

