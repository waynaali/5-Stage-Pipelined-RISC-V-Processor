# 5-Stage Pipelined RISC-V Processor

[![Top Language](https://img.shields.io/github/languages/top/waynaali/5-Stage-Pipelined-RISC-V-Processor)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor)
[![Last Commit](https://img.shields.io/github/last-commit/waynaali/5-Stage-Pipelined-RISC-V-Processor)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor/commits/main)
[![Stars](https://img.shields.io/github/stars/waynaali/5-Stage-Pipelined-RISC-V-Processor?style=social)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor/stargazers)
[![Forks](https://img.shields.io/github/forks/waynaali/5-Stage-Pipelined-RISC-V-Processor?style=social)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor/network/members)
[![Open Issues](https://img.shields.io/github/issues/waynaali/5-Stage-Pipelined-RISC-V-Processor)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor/issues)

A **SystemVerilog implementation of a 5-stage pipelined RISC-V CPU** (RV32I) with **hazard handling**, intended for **educational purposes**. This design is fully compatible with **Xilinx Vivado**.

---

## Features

- 5-stage pipeline: IF → ID → EX → MEM → WB
- Supports RV32I instructions: ADD, SUB, ADDI, AND, OR, LW, SW, BEQ, BNE
- Forwarding and stall units for hazard resolution
- Pipeline registers for concurrent instruction execution
- Designed in **SystemVerilog** for Vivado FPGA simulation/synthesis

---

## Architecture

```

```
       ┌──────────┐
       │ IF Stage │  ← fetch instruction
       └─────┬────┘
             ↓
       ┌──────────┐
       │ ID Stage │  ← decode & read registers
       └─────┬────┘
             ↓
       ┌──────────┐
       │ EX Stage │  ← execute/ALU operations
       └─────┬────┘
             ↓
       ┌──────────┐
       │ MEM Stage│  ← memory access
       └─────┬────┘
             ↓
       ┌──────────┐
       │ WB Stage │  ← write back
       └──────────┘
```

```

> Multiple instructions are executed **concurrently**, one per pipeline stage per clock cycle.

---

## Repository Structure

```

├── src
│   ├── IF_ID.sv
│   ├── ID_IE.sv
│   ├── IE_IM.sv
│   ├── IM_IW.sv
│   ├── register_file.sv
│   ├── control_unit.sv
│   └── ...
├── tb
│   └tb.sv
├── docs
│   └── design_overview.pdf
└── README.md

````

> All design files are in **SystemVerilog (.sv)** format compatible with Vivado.

---

## Simulation / Running in Vivado

1. **Create a new project** in Vivado.  
2. **Add all `.sv` files** from `src/` and `tb/` to the project.  
3. **Set the top module** as `testbench.sv` for simulation.  
4. **Run simulation** and observe waveform in Vivado.  

```bash
# Optional: Using Icarus Verilog for SV simulation
iverilog -g2012 -o sim.out src/*.sv tb/testbench.sv
vvp sim.out
````

---

## Supported Instructions

| Type       | Instructions       |
| ---------- | ------------------ |
| Arithmetic | ADD, SUB, ADDI     |
| Logic      | AND, OR, XOR, ANDI |
| Memory     | LW, SW             |
| Shift      | SLL, SRL, SRA      |
| Branch     | BEQ, BNE           |

---

## Requirements

* **Vivado** for simulation/synthesis
* SystemVerilog simulator (Icarus Verilog, ModelSim) optional
* RISC-V assembler for testing programs

---

## License

MIT License – see [LICENSE](LICENSE)

---

## Acknowledgements

Inspired by *Digital Design and Computer Architecture, RISC‑V Edition* by Sarah L. Harris and David Harris
Also see [Single-Cycle RISC-V](https://github.com/waynaali/Single-Cycle-RISC-V)
