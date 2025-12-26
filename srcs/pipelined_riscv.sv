`timescale 1ns / 1ps

// Top-level module for 5-stage pipelined RISC-V processor (RV32I)
module riscv_pipelined(
    input logic clk,      // Clock signal
    input logic reset     // Reset signal
);

// =====================
// Internal Signals
// =====================

// Control signals
logic ZeroE;               // Zero flag from ALU (for branch decision)
logic PCSrcE;              // PC source select (branch/jump)
logic RegWriteM, RegWriteE, RegWriteD, RegWriteW;  // Register write enables
logic MemWriteM, MemWriteE, MemWriteD;             // Memory write enables
logic [1:0] ResultSrcM, ResultSrcD, ResultSrcE, ResultSrcW; // Result mux selects
logic JumpD, BranchD, JumpE, BranchE;             // Branch and jump control
logic ALUSrcE, ALUSrcD;                           // ALU source select
logic [1:0] ImmSrcD;                              // Immediate source selection
logic [2:0] ALUControlD, ALUControlE;            // ALU control signals

// Data signals
logic [31:0] SrcBE;            // Second ALU operand after mux
logic [31:0] ALUResultE, ALUResultM, ALUResultW; // ALU results at different stages
logic [31:0] ReadDataM, ReadDataW;               // Data memory read outputs
logic [31:0] PCTargetE;         // Target address for branch/jump
logic [31:0] PCNext;            // Next PC value
logic [31:0] ResultW;           // Final result to write back
logic [31:0] RD1D, RD2D, RD1E, RD2E, RD2M;      // Register data at various stages
logic [31:0] InstrD, InstrF;    // Instructions at Decode and Fetch stages
logic [31:0] PCD, PCE, PCF;     // PC values at different stages
logic [31:0] PCPlus4D, PCPlus4E, PCPlus4F, PCPlus4M, PCPlus4W; // PC+4 values
logic [31:0] ImmExtendD, ImmExtendE;             // Extended immediate

// Register addresses
logic [4:0] rs1E, rs2E, rdE, rdM, rdW;

// =====================
// Program Counter & Adder
// =====================

// Determine PC source (branch or jump)
assign PCSrcE = (BranchE & ZeroE) | JumpE;

// Add 4 to PC for next sequential instruction
Adder PC_Plus_4(.A(PCF), .B(32'd4), .Sum(PCPlus4F));

// Compute branch/jump target address
Adder PC_Target(.A(PCE), .B(ImmExtendE), .Sum(PCTargetE));

// Mux to select between PC+4 and branch/jump target
mux2 PC_Next(.d0(PCPlus4F), .d1(PCTargetE), .s(PCSrcE), .y(PCNext));

// Program counter register
program_counter ProgramCounter(
    .clk(clk),
    .reset(reset),
    .PCNext(PCNext),
    .PC(PCF)
);

// =====================
// Instruction Fetch
// =====================

// Instruction memory
instr_mem instruction_memory(
    .A(PCF),
    .RD(InstrF)
);

// IF/ID pipeline register
IF_ID IF_ID(
    .clk(clk),
    .reset(reset),
    .InstrF(InstrF),
    .PCF(PCF),
    .PCPlus4F(PCPlus4F),
    .InstrD(InstrD),
    .PCD(PCD),
    .PCPlus4D(PCPlus4D)
);

// =====================
// Register File & Decode Stage
// =====================

// Register file read/write
register_file register_file(
    .clk(clk),
    .A1(InstrD[19:15]),   // rs1
    .A2(InstrD[24:20]),   // rs2
    .A3(rdW),             // destination register write address
    .wd3(ResultW),        // data to write
    .we(RegWriteW),       // write enable
    .rd1(RD1D),
    .rd2(RD2D)
);

// Immediate extension unit
ExtendUnit Extend(
    .Instr(InstrD),
    .ImmSrc(ImmSrcD),
    .ImmExtend(ImmExtendD)
);

// Control unit
control_unit control_unit(
    .op(InstrD[6:0]),
    .Zero(ZeroE),
    .funct3(InstrD[14:12]),
    .funct7b5(InstrD[30]),
    .Branch(BranchD),
    .Jump(JumpD),
    .ResultSrc(ResultSrcD),
    .MemWrite(MemWriteD),
    .ImmSrc(ImmSrcD),
    .RegWrite(RegWriteD),
    .ALUSrc(ALUSrcD),
    .ALUControl(ALUControlD)
);

// ID/IE pipeline register
ID_IE ID_IE(
    .clk(clk),
    .reset(reset),
    .rd1D(RD1D),
    .rd2D(RD2D),
    .PCD(PCD),
    .rs1D(InstrD[19:15]),
    .rs2D(InstrD[24:20]),
    .rdD(InstrD[11:7]),
    .ImmExtendD(ImmExtendD),
    .PCPlus4D(PCPlus4D),
    .RegWriteD(RegWriteD),
    .ResultSrcD(ResultSrcD),
    .MemWriteD(MemWriteD),
    .JumpD(JumpD),
    .BranchD(BranchD),
    .ALUSrcD(ALUSrcD),
    .ALUControlD(ALUControlD),
    .rd1E(RD1E),
    .rd2E(RD2E),
    .PCE(PCE),
    .rs1E(rs1E),
    .rs2E(rs2E),
    .rdE(rdE),
    .ImmExtendE(ImmExtendE),
    .PCPlus4E(PCPlus4E),
    .RegWriteE(RegWriteE),
    .ResultSrcE(ResultSrcE),
    .MemWriteE(MemWriteE),
    .JumpE(JumpE),
    .BranchE(BranchE),
    .ALUSrcE(ALUSrcE),
    .ALUControlE(ALUControlE)
);

// =====================
// Execute Stage
// =====================

// ALU operand mux
mux2 Src_B(
    .d0(RD2E),
    .d1(ImmExtendE),
    .s(ALUSrcE),
    .y(SrcBE)
);

// ALU operation
ALU ALU(
    .SrcA(RD1E),
    .SrcB(SrcBE),
    .ALUControl(ALUControlE),
    .ALUResult(ALUResultE),
    .Zero(ZeroE)
);

// =====================
// Memory Stage
// =====================

// IE/IM pipeline register
IE_IM IE_IM(
    .clk(clk),
    .reset(reset),
    .ALUResultE(ALUResultE),
    .RD2E(RD2E),
    .RegWriteM(RegWriteM),
    .MemWriteM(MemWriteM),
    .ResultSrcM(ResultSrcM),
    .RegWriteE(RegWriteE),
    .MemWriteE(MemWriteE),
    .ResultSrcE(ResultSrcE),
    .rdE(rdE),
    .PCPlus4E(PCPlus4E),
    .ALUResultM(ALUResultM),
    .RD2M(RD2M),
    .rdM(rdM),
    .PCPlus4M(PCPlus4M)
);

// Data memory
data_mem data_memory(
    .clk(clk),
    .we(MemWriteM),
    .A(ALUResultM),
    .WD(RD2M),
    .ReadData(ReadDataM)
);

// =====================
// Write Back Stage
// =====================

// IM/IW pipeline register
IM_IW IM_IW(
    .clk(clk),
    .reset(reset),
    .ALUResultM(ALUResultM),
    .ReadDataM(ReadDataM),
    .PCPlus4M(PCPlus4M),
    .RegWriteM(RegWriteM),
    .ResultSrcM(ResultSrcM),
    .rdM(rdM),
    .ALUResultW(ALUResultW),
    .ReadDataW(ReadDataW),
    .PCPlus4W(PCPlus4W),
    .rdW(rdW),
    .RegWriteW(RegWriteW),
    .ResultSrcW(ResultSrcW)
);

// Result selection mux (ALU / memory / PC+4)
mux3to1 result(
    .d0(ALUResultW),
    .d1(ReadDataW),
    .d2(PCPlus4W),
    .s(ResultSrcW),
    .y(ResultW)
);

endmodule
