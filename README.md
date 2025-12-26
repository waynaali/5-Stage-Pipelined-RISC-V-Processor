 # 🖥️ 5-Stage Pipelined RISC-V Processor (RV32I)

![SystemVerilog](https://img.shields.io/badge/SystemVerilog-RTL-blue?logo=verilog)
![RISC-V](https://img.shields.io/badge/RISC--V-RV32I-green?logo=riscv)
![Pipeline](https://img.shields.io/badge/Pipeline-5--Stage-orange)
![Architecture](https://img.shields.io/badge/Architecture-32--bit-lightgrey)
![Simulator](https://img.shields.io/badge/Simulation-ModelSim%20%7C%20QuestaSim-purple)
![Repo Size](https://img.shields.io/github/repo-size/waynaali/5-Stage-Pipelined-RISC-V-Processor)
![Stars](https://img.shields.io/github/stars/waynaali/5-Stage-Pipelined-RISC-V-Processor?style=social)
![Forks](https://img.shields.io/github/forks/waynaali/5-Stage-Pipelined-RISC-V-Processor?style=social)
![Last Commit](https://img.shields.io/github/last-commit/waynaali/5-Stage-Pipelined-RISC-V-Processor)
![Issues](https://img.shields.io/github/issues/waynaali/5-Stage-Pipelined-RISC-V-Processor)
![License](https://img.shields.io/github/license/waynaali/5-Stage-Pipelined-RISC-V-Processor)

---

## 📌 Overview

This repository contains a **5-stage pipelined RISC-V processor** implemented in **SystemVerilog**, supporting the **RV32I base integer instruction set**.

The processor uses a **classic textbook pipeline architecture** (IF, ID, EX, MEM, WB) to demonstrate **instruction-level parallelism** and improve throughput compared to single-cycle processors.

Suitable for:

* Computer architecture courses
* RTL / FPGA / ASIC learning
* Portfolio & interview demonstration
* Research experiments

---

## 🚀 Key Features

* ✅ RV32I Base Integer ISA
* ✅ 5-Stage Pipeline: IF → ID → EX → MEM → WB
* ✅ Pipeline registers: IF/ID, ID/EX, EX/MEM, MEM/WB
* ✅ Modular & readable RTL in SystemVerilog
* ✅ Synthesizable design
* ✅ Testbench included
* ✅ Simulation-ready (ModelSim / QuestaSim)

---

## 🏗️ Processor Architecture

### 🔷 Block Diagram

![Block Diagram](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor/blob/main/doc/block_diagram.png)
![Block Diagram 2](docs/block_diagram\(2\).png)

The processor is organized into modules:

* Program Counter (PC)
* Instruction Memory
* Register File
* ALU
* Data Memory
* Control Unit
* Pipeline Registers

This modular approach simplifies debugging and future extensions.

---

## 🔄 5-Stage Pipeline

![Pipeline Visualization](docs/Verification.png)

| Stage   | Description                                |
| ------- | ------------------------------------------ |
| **IF**  | Instruction Fetch & Program Counter update |
| **ID**  | Instruction Decode & Register File Read    |
| **EX**  | ALU operations & address calculation       |
| **MEM** | Data memory read/write                     |
| **WB**  | Write results back to register file        |

Pipeline registers isolate each stage, allowing **concurrent execution of multiple instructions**.

---

## 🧠 Supported Instruction Set (RV32I)

| Category   | Instructions   |
| ---------- | -------------- |
| Arithmetic | add, sub, addi |
| Logical    | and, or, xor   |
| Shift      | sll, srl, sra  |
| Memory     | lw, sw         |
| Branch     | beq, bne       |
| Control    | jal, jalr      |

> 📌 Future extensions: RV32M (mul/div), branch prediction

---

## 📊 Simulation & Waveforms

![Simulation 1](docs/Waveform.png)
![Simulation 2](docs/Waveform\(2\).png)

Waveforms confirm:

* Correct instruction flow through all pipeline stages
* Proper register write-back
* Correct memory access

Use waveform viewers for detailed timing and pipeline analysis.

---

## 📁 Directory Structure

```
5-Stage-Pipelined-RISC-V-Processor/
│
├── src/                # RTL SystemVerilog source files
├── tb/                 # Testbench files
├── mem/                # Instruction & data memory
├── docs/               # Images, diagrams, documentation
├── .github/
│   └── workflows/      # CI workflow
├── README.md
└── LICENSE
```

---

## 🛠️ Getting Started

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor.git
cd 5-Stage-Pipelined-RISC-V-Processor
```

### 2️⃣ Compile the Design

```bash
vlog src/*.sv tb/*.sv
```

### 3️⃣ Run Simulation

```bash
vsim tb_top
run -all
```

---

## 🧪 Verification & Testing

* Includes a SystemVerilog **testbench**
* Verifies:

  * Instruction execution
  * Register file & memory
  * Branch and hazard behavior
* Extendable for **custom test cases, hazard checking, and forwarding logic**

---

## 🔄 Continuous Integration (CI)

GitHub Actions automatically runs simulations on every push or PR:

* RTL compilation
* Testbench execution
* Build status reflected in the badge above

---

## 🤝 Contributing

1. Fork the repository
2. Create a branch (`git checkout -b feature/your-feature`)
3. Commit your changes
4. Push and open a Pull Request

**Keep code modular, well-commented, and consistent.**

---

## 📄 License

MIT License — see `LICENSE` file.

---

## 📫 Contact

**Wayna Ali**
GitHub: [https://github.com/waynaali](https://github.com/waynaali)

---

## 🔮 Future Work

* Hazard Detection Unit
* Forwarding / Bypassing Logic
* Branch Prediction
* RV32M Extension
* CPI & Performance Analysis
* FPGA Synthesis Support
