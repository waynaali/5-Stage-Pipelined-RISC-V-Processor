# 5-Stage Pipelined RISC-V Processor

[![Top Language](https://img.shields.io/github/languages/top/waynaali/5-Stage-Pipelined-RISC-V-Processor)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor)
[![Last Commit](https://img.shields.io/github/last-commit/waynaali/5-Stage-Pipelined-RISC-V-Processor)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor/commits/main)
[![Stars](https://img.shields.io/github/stars/waynaali/5-Stage-Pipelined-RISC-V-Processor?style=social)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor/stargazers)
[![Forks](https://img.shields.io/github/forks/waynaali/5-Stage-Pipelined-RISC-V-Processor?style=social)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor/network/members)
[![Open Issues](https://img.shields.io/github/issues/waynaali/5-Stage-Pipelined-RISC-V-Processor)](https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor/issues)

A **SystemVerilog implementation of a 5-stage pipelined RISC-V CPU** based on the RV32I instruction set.

This repository demonstrates a classic **5-stage pipeline with hazard handling** and is intended for **educational purposes**.

---

## Features

- 5-stage pipeline: IF → ID → EX → MEM → WB
- Supports RV32I instructions: ADD, SUB, ADDI, AND, OR, LW, SW, BEQ, BNE
- Forwarding and stall units for hazard resolution
- Pipeline registers for concurrent execution

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
       │ EX Stage │  ← execute/ALU ops
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

> In a pipelined design, multiple instructions are **executed concurrently**, one per stage per clock cycle.

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

## Simulation

```bash
# Compile and run the simulation
iverilog -o sim.out src/*.v tb/testbench.v
vvp sim.out
````

Open GTKWave to view waveforms and verify pipeline execution.

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

* Verilog/SystemVerilog simulator (Icarus Verilog, ModelSim, Verilator)
* Optional: FPGA toolchain (Vivado, Quartus)
* RISC-V assembler for testing programs

---

## License

MIT License – see [LICENSE](LICENSE)

---

## Acknowledgements

Inspired by *Digital Design and Computer Architecture, RISC‑V Edition* by Sarah L. Harris and David Harris
Also see [Single-Cycle RISC-V](https://github.com/waynaali/Single-Cycle-RISC-V)

Do you want me to do that next?
```
