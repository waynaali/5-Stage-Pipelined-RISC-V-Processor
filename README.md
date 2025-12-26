# 5‑Stage Pipelined RISC‑V Processor

![GitHub repo size](https://img.shields.io/github/repo-size/waynaali/5-Stage-Pipelined-RISC-V-Processor)
![GitHub](https://img.shields.io/github/license/waynaali/5-Stage-Pipelined-RISC-V-Processor)
![GitHub top language](https://img.shields.io/github/languages/top/waynaali/5-Stage-Pipelined-RISC-V-Processor)
![GitHub last commit](https://img.shields.io/github/last-commit/waynaali/5-Stage-Pipelined-RISC-V-Processor)

A **Verilog/SystemVerilog implementation of a 5‑stage pipelined RISC‑V CPU** based on the RV32I instruction set.  
This design demonstrates the classic pipeline stages and includes hazard handling.

---

## 📌 Overview

This repository contains the RTL design of a 5‑stage pipelined RISC‑V processor with the following modules:

- Instruction Fetch (IF)  
- Instruction Decode (ID)  
- Execute (EX)  
- Memory Access (MEM)  
- Write Back (WB)

It is modular, easy to understand, and suitable for **educational purposes**.

---

## 🚀 Features

- Implements a **classic 5‑stage pipeline** (IF, ID, EX, MEM, WB)  
- Supports a subset of **RV32I instructions** (add, sub, load, store, branch)  
- **Pipeline registers** between stages for concurrent instruction execution  
- Basic **forwarding and stall units** for hazard resolution

---

## 🛠️ Architecture

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
> *(Replace this link with your own uploaded pipeline diagram)*

---

## 📁 Repository Structure

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

## 🧪 Simulation & Testing

```bash
# Example using iverilog + vvp
iverilog -o sim.out src/*.v tb/testbench.v
vvp sim.out
````

Observe waveforms to verify instruction execution.

---

## 📘 Supported Instructions

| Category   | Example Instructions |
| ---------- | -------------------- |
| Arithmetic | ADD, SUB, ADDI       |
| Logic      | AND, OR, XOR, ANDI   |
| Memory     | LW, SW               |
| Shift      | SLL, SRL, SRA        |
| Branch     | BEQ, BNE             |

---

## 📦 Requirements

* Verilog/SystemVerilog simulator (ModelSim, Icarus Verilog, Verilator)
* Optional: FPGA toolchain for synthesis (Vivado, Quartus)
* RISC‑V assembler (for test programs)

---

## 📄 License

Released under the **MIT License**.

---

## 📌 Acknowledgements

Inspired by 📘 Digital Design and Computer Architecture, RISC‑V Edition

Authors: Sarah L. Harris and David Harris
