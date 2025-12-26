`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 11:56:56 AM
// Design Name: ID/IE Pipeline Register
// Module Name: ID_IE
// Project Name: 5-Stage Pipelined RISC-V Processor
// Target Devices: FPGA / ASIC
// Tool Versions: Any SystemVerilog compatible
// Description: 
//      This module implements the ID/IE pipeline register used in the 5-stage
//      RISC-V processor pipeline. It transfers decoded instruction signals from 
//      the Decode (ID) stage to the Execute (IE) stage.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//      - Synchronous reset initializes all outputs to 0.
//      - Updates occur on the rising edge of the clock.
//////////////////////////////////////////////////////////////////////////////////

module ID_IE(
    input  logic        clk,        // Clock signal
    input  logic        reset,      // Synchronous reset
    input  logic [31:0] rd1D, rd2D, // Source register values from ID stage
    input  logic [31:0] PCD,        // Program Counter from ID stage
    input  logic [4:0]  rs1D, rs2D, rdD, // Register addresses from ID stage
    input  logic [31:0] ImmExtendD, PCPlus4D, // Immediate and PC+4 from ID stage
    input  logic        RegWriteD,  // Control signals from ID stage
    input  logic [1:0]  ResultSrcD,
    input  logic        MemWriteD, JumpD, BranchD, ALUSrcD,
    input  logic [2:0]  ALUControlD,
    output logic [31:0] rd1E, rd2E, // Outputs to IE stage
    output logic [31:0] PCE,
    output logic [4:0]  rs1E, rs2E, rdE,
    output logic [31:0] ImmExtendE, PCPlus4E,
    output logic        RegWriteE,
    output logic [1:0]  ResultSrcE,
    output logic        MemWriteE, JumpE, BranchE, ALUSrcE,
    output logic [2:0]  ALUControlE
);

    // Sequential logic for ID/IE pipeline register
    always_ff @(posedge clk) begin
        if (reset) begin
            // Reset all outputs to 0
            rd1E        <= 32'b0;
            rd2E        <= 32'b0;
            PCE         <= 32'b0;
            rs1E        <= 5'b0;
            rs2E        <= 5'b0;
            rdE         <= 5'b0;
            ImmExtendE  <= 32'b0;
            PCPlus4E    <= 32'b0;
            RegWriteE   <= 1'b0;
            ResultSrcE  <= 2'b0;
            MemWriteE   <= 1'b0;
            JumpE       <= 1'b0;
            BranchE     <= 1'b0;
            ALUSrcE     <= 1'b0;
            ALUControlE <= 3'b0;
        end
        else begin
            // Transfer signals from ID stage to IE stage
            rd1E        <= rd1D;
            rd2E        <= rd2D;
            PCE         <= PCD;
            rs1E        <= rs1D;
            rs2E        <= rs2D;
            rdE         <= rdD;
            ImmExtendE  <= ImmExtendD;
            PCPlus4E    <= PCPlus4D;
            RegWriteE   <= RegWriteD;
            ResultSrcE  <= ResultSrcD;
            MemWriteE   <= MemWriteD;
            JumpE       <= JumpD;
            BranchE     <= BranchD;
            ALUSrcE     <= ALUSrcD;
            ALUControlE <= ALUControlD;
        end
    end

endmodule

