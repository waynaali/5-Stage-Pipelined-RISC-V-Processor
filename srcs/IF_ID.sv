`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 11:30:01 AM
// Design Name: IF/ID Pipeline Register
// Module Name: IF_ID
// Project Name: 5-Stage Pipelined RISC-V Processor
// Target Devices: FPGA / ASIC
// Tool Versions: Any SystemVerilog compatible
// Description: 
//      This module implements the IF/ID pipeline register used in the 5-stage
//      RISC-V processor pipeline. It stores the instruction and PC values
//      fetched in the IF stage and passes them to the ID stage.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//      - Synchronous reset initializes all outputs to 0.
//      - Updates occur on the rising edge of the clock.
//////////////////////////////////////////////////////////////////////////////////

module IF_ID(
    input  logic        clk,       // Clock signal
    input  logic        reset,     // Synchronous reset
    input  logic [31:0] InstrF,    // Instruction fetched from instruction memory
    input  logic [31:0] PCF,       // Program Counter at IF stage
    input  logic [31:0] PCPlus4F,  // PC + 4 at IF stage
    output logic [31:0] InstrD,    // Instruction passed to Decode stage
    output logic [31:0] PCD,       // PC value passed to Decode stage
    output logic [31:0] PCPlus4D   // PC+4 value passed to Decode stage
);

    // Sequential logic for IF/ID pipeline register
    always_ff @(posedge clk) begin
        if (reset) begin
            InstrD    <= 32'b0;
            PCD       <= 32'b0;
            PCPlus4D  <= 32'b0;
        end
        else begin
            InstrD    <= InstrF;
            PCD       <= PCF;
            PCPlus4D  <= PCPlus4F; 
        end
    end

endmodule
