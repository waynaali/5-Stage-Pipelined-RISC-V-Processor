# 5‑Stage Pipelined RISC‑V Processor

![GitHub license](https://img.shields.io/github/license/waynaali/5-Stage-Pipelined-RISC-V-Processor)
![GitHub top language](https://img.shields.io/github/languages/top/waynaali/5-Stage-Pipelined-RISC-V-Processor)
![GitHub last commit](https://img.shields.io/github/last-commit/waynaali/5-Stage-Pipelined-RISC-V-Processor)

A **SystemVerilog implementation of a 5‑stage pipelined RISC‑V CPU** based on the RV32I instruction set.  
This design demonstrates the classic pipeline stages and includes basic hazard handling.

---

## Overview

This repository contains the RTL design of a 5‑stage pipelined RISC‑V processor with the following modules:

- Instruction Fetch (IF)  
- Instruction Decode (ID)  
- Execute (EX)  
- Memory Access (MEM)  
- Write Back (WB)

It is modular, easy to understand, and suitable for **educational purposes**.

---

## Features

- Implements a **classic 5‑stage pipeline** (IF, ID, EX, MEM, WB)  
- Supports a subset of **RV32I instructions** (ADD, SUB, ADDI, AND, OR, LW, SW, BEQ, BNE, etc.)  
- **Pipeline registers** between stages for concurrent instruction execution  
- Basic **forwarding and stall units** for hazard resolution

---

## Architecture

```

```
                   ┌──────────┐
                   │ IF Stage │  ← fetch instruction
                   └─────┬────┘
                         ↓
                   ┌──────────┐
                   │ ID Stage │  ← decode instruction
                   └─────┬────┘
                         ↓
                   ┌──────────┐
                   │ EX Stage │  ← execute/ALU ops
                   └─────┬────┘
                         ↓
                   ┌──────────┐
                   │ MEM Stage│  ← load/store
                   └─────┬────┘
                         ↓
                   ┌──────────┐
                   │ WB Stage │  ← write results
                   └──────────┘
```

```

> ![Pipeline Diagram](https://user-images.githubusercontent.com/your-username/pipeline-diagram.png)  
> *(Replace this with your actual pipeline diagram)*

---

## Repository Structure

```

├── src
│   ├── if_stage.v
│   ├── id_stage.v
│   ├── ex_stage.v
│   ├── mem_stage.v
│   ├── wb_stage.v
│   ├── register_file.v
│   ├── control_unit.v
│   └── ...
├── tb
│   └── testbench.v
├── docs
│   └── design_overview.pdf
└── README.md

````

---

## Simulation & Testing

```bash
# Using Icarus Verilog
iverilog -o sim.out src/*.v tb/testbench.v
vvp sim.out
````

Open the waveform (e.g., GTKWave) to verify instruction execution and pipeline behavior.

---

## Supported Instructions

| Category   | Example Instructions |
| ---------- | -------------------- |
| Arithmetic | ADD, SUB, ADDI       |
| Logic      | AND, OR, XOR, ANDI   |
| Memory     | LW, SW               |
| Shift      | SLL, SRL, SRA        |
| Branch     | BEQ, BNE             |

---

## Requirements

* Verilog/SystemVerilog simulator (Icarus Verilog, ModelSim, Verilator)
* Optional: FPGA toolchain for synthesis (Vivado, Quartus)
* RISC‑V assembler (for writing and testing programs)

---

## License

Released under the **MIT License**. See [LICENSE](LICENSE) for details.

---

## Acknowledgements

Inspired by 📘 *Digital Design and Computer Architecture, RISC‑V Edition*
Authors: Sarah L. Harris and David Harris

