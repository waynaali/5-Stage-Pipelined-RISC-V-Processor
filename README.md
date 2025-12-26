# 🧠 5-Stage Pipelined RISC-V Processor (RV32I)

[![GitHub stars](https://img.shields.io/github/stars/waynaali/5-Stage-Pipelined-RISC-V-Processor)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/waynaali/5-Stage-Pipelined-RISC-V-Processor)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor/issues)
[![License](https://img.shields.io/github/license/waynaali/5-Stage-Pipelined-RISC-V-Processor)](LICENSE)

This repository implements a **5-stage pipelined RISC-V processor** in **SystemVerilog**, based on the classic computer architecture pipeline architecture (IF → ID → EX → MEM → WB).

---

## 🚀 Project Summary

This project demonstrates an RTL design of a **pipelined RISC-V processor** that processes multiple instructions in parallel by dividing execution into five stages. It includes:

🟢 Instruction Fetch (IF)  
🟡 Instruction Decode (ID)  
🔵 Execute (EX)  
🔴 Memory Access (MEM)  
🟣 Write Back (WB)

> 💡 Compared to a single-cycle implementation, pipelining improves throughput by overlapping instruction execution without requiring additional hardware for every instruction cycle.

---

## 🧱 Pipeline Stages Explained

| Stage | Purpose |
|-------|---------|
| **IF** | Fetch instruction from instruction memory |
| **ID** | Decode instruction & read registers |
| **EX** | Execute ALU operations |
| **MEM** | Access data memory |
| **WB** | Write back result into register file |

---

## 📁 Directory Structure

```

5-Stage-Pipelined-RISC-V-Processor/
├── doc/                  # Block diagrams, waveforms, verification images
├── srcs/                 # All SystemVerilog source files
├── tb/                   # Testbench files
├── README.md             # This documentation
└── .gitignore

````

---

## ⚙️ Features

✔ Implements RV32I ISA base subset  
✔ 5 pipeline stages (IF, ID, EX, MEM, WB)  
✔ Forwarding & hazard handling  
✔ Modular RTL design  
✔ Testbench for simulation

---

## 🛠 How to Use (Simulation)

1. Clone the repository:

```bash
git clone https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor.git
cd 5-Stage-Pipelined-RISC-V-Processor
````

2. Compile using your simulator (ModelSim/Questa):

```bash
vlog srcs/*.sv tb/*.sv
vsim tb
run -all
```

---

## 📸 Waveforms & Docs

Check `doc/` for:

📌 Pipeline diagrams
📌 Simulation waveforms
📌 Verification screenshots

These help visualize hazards, forwarding, and register updates.

---

## 📜 License

This project is licensed under the **MIT License** — see **LICENSE** for details.
Feel free to reuse and build upon this work! ([GitHub][1])

---

## 🙌 Acknowledgments

✔ Inspired by RISC-V pipeline design concepts
✔ Based on open documentation and computer architecture texts
✔ Thank you for exploring this implementation!
