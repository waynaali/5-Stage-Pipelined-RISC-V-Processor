`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2025 01:47:18 PM
// Design Name: 32-bit Program Counter
// Module Name: program_counter
// Project Name: 5-Stage Pipelined RISC-V Processor
// Target Devices: FPGA / ASIC
// Tool Versions: Any SystemVerilog compatible
// Description: 
//      This module implements the program counter (PC) used in the RISC-V processor.
//      It holds the current instruction address and updates to the next address (PCNext) 
//      on the rising edge of the clock. The PC can be reset asynchronously.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//      - Asynchronous reset initializes PC to 0.
//      - Updates occur on rising edge of clk.
//      - Used in the IF stage of the pipeline to fetch instructions.
//////////////////////////////////////////////////////////////////////////////////

module program_counter(
    input  logic        clk,     // Clock signal
    input  logic        reset,   // Asynchronous reset
    input  logic [31:0] PCNext,  // Next PC value (from ALU / branch logic)
    output logic [31:0] PC       // Current PC value
);

    // Sequential logic: Update PC on clock edge or reset
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            PC <= 32'h00000000;  // Reset PC to 0
        else
            PC <= PCNext;        // Update PC to next value
    end

endmodule
