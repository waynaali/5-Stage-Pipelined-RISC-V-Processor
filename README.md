# 5-Stage Pipelined RISC-V Processor (RV32I)

## Short Description
Efficient 5-stage pipelined RV32I processor with dedicated pipeline registers (IF/ID, ID/IE, IE/IM, IM/IW) implemented in SystemVerilog.

---

## Description
This repository implements a **5-stage pipelined RISC-V processor** using **SystemVerilog**, based on the **RV32I base integer instruction set**.  
Pipelining allows multiple instructions to be processed simultaneously by dividing instruction execution into discrete stages, improving overall throughput compared to a single-cycle design.

### Pipeline Stages and Functionality

1. **IF (Instruction Fetch)**  
   - Fetches instruction from memory using the program counter (PC).  
   - Updates PC for the next instruction.

2. **ID (Instruction Decode)**  
   - Decodes the fetched instruction.  
   - Reads source registers from the register file.  
   - Prepares control signals for the execute stage.

3. **IE (Execute)**  
   - Performs arithmetic and logic operations in the ALU.  
   - Calculates memory addresses for load/store instructions.

4. **IM (Memory Access)**  
   - Accesses data memory for load/store instructions.  
   - Passes ALU results and memory data to the next stage.

5. **IW (Write Back)**  
   - Writes results back to the register file.  
   - Completes instruction execution.

### Pipeline Registers
To maintain instruction flow between stages, the processor uses these pipeline registers:  
- `IF/ID` – between Instruction Fetch and Decode  
- `ID/IE` – between Decode and Execute  
- `IE/IM` – between Execute and Memory  
- `IM/IW` – between Memory and Write Back  

This design helps in **reducing instruction execution time**, handling **data hazards**, and achieving **higher throughput**.

---

## Features
- RV32I Base Integer Instruction Set  
- 5-stage pipeline with dedicated pipeline registers  
- Testbench included for simulation and verification  
- Compatible with ModelSim, QuestaSim, or other SystemVerilog simulators  

---

## Directory Structure
```

5-Stage-Pipelined-RISC-V-Processor/
│
├── src/              # RTL source code files
├── tb/               # Testbench files
├── mem/              # Memory initialization files
├── docs/             # Optional documentation
├── README.md         # Project description (this file)
└── LICENSE           # License information

````

---

## Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/waynaali/5-Stage-Pipelined-RISC-V-Processor.git
cd 5-Stage-Pipelined-RISC-V-Processor
````

### 2. Compile and simulate

Example with ModelSim / QuestaSim:

```bash
vlog src/*.sv tb/*.sv
vsim tb_top         # replace tb_top with your top-level testbench module
run -all
```

---

## Author

**Wayna Ali**
GitHub: [https://github.com/waynaali](https://github.com/waynaali)

