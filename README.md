# 🚀 5-Stage Pipelined RISC-V Processor (RV32I)

![Language](https://img.shields.io/badge/Language-SystemVerilog-yellow)
![Architecture](https://img.shields.io/badge/Architecture-RISC--V-red)
![Pipeline](https://img.shields.io/badge/Pipeline-5--Stage-orange)
![Status](https://img.shields.io/badge/Status-Verified-success)
![License](https://img.shields.io/badge/License-MIT-blue)

---

## 📌 Project Overview

This repository contains a **5-Stage Pipelined RISC-V Processor** implemented in **SystemVerilog**, based on the **RV32I base integer instruction set**.

The design demonstrates a **classic pipelined CPU architecture** with separate pipeline stages, pipeline registers, and verification through simulation waveforms.

This project is suitable for:
- Computer Architecture learning
- RTL / IC Design portfolios
- Final Year Projects (FYP)
- MS / IC design job applications

---

## 🧠 Pipeline Stages

The processor consists of the following **five pipeline stages**:

| Stage | Description |
|-----|------------|
| **IF** | Instruction Fetch |
| **ID** | Instruction Decode & Register Fetch |
| **EX** | Execute / ALU Operations |
| **MEM** | Data Memory Access |
| **WB** | Write Back to Register File |

---

## 🔁 Pipeline Registers

Pipeline registers ensure correct data flow between stages:

- **IF/ID**
- **ID/EX**
- **EX/MEM**
- **MEM/WB**

These registers allow **parallel instruction execution**, improving throughput over single-cycle designs.

---

## ⚙️ Key Features

✔ RV32I instruction support  
✔ 5-stage pipelined datapath  
✔ Modular RTL design  
✔ Pipeline registers implemented  
✔ ALU, Register File, Control Unit included  
✔ Verified using simulation waveforms  
✔ Clean and readable SystemVerilog code  

---

## 📂 Directory Structure



5-Stage-Pipelined-RISC-V-Processor/
│
├── doc/ # Block diagrams, waveforms, verification screenshots
├── srcs/ # SystemVerilog RTL source files
├── tb/ # Testbench files
├── README.md
└── LICENSE


---

## 🛠 Simulation & Verification

Example using **ModelSim / QuestaSim**:

```bash
vlog srcs/*.sv tb/*.sv
vsim tb
run -all


Waveform results and verification screenshots are available in the doc/ folder.

📈 Verification Evidence

✔ Instruction execution verified
✔ Pipeline behavior observed in waveforms
✔ Correct register write-back
✔ Correct data flow across pipeline stages

🧑‍💻 Author

Wayna Ali
Electronics / Computer Architecture
GitHub: https://github.com/waynaali

📜 License

This project is licensed under the MIT License — free to use, modify, and distribute.
