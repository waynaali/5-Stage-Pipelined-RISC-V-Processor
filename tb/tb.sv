`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2025 04:04:23 PM
// Design Name: Testbench for 5-Stage Pipelined RISC-V Processor
// Module Name: tb_risc
// Project Name: 5-Stage Pipelined RISC-V Processor
// Target Devices: Simulation only
// Tool Versions: Any SystemVerilog compatible simulator
// Description: 
//      This testbench instantiates the top-level RISC-V pipelined processor
//      module and provides clock and reset signals for simulation purposes.
//
// Dependencies: riscv_pipelined.v
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//      - Clock period is 10ns (5ns high, 5ns low)
//      - Reset is asserted for 20ns at the beginning
//////////////////////////////////////////////////////////////////////////////////

module tb_risc;

    // Testbench signals
    logic clk;
    logic reset;

    // Instantiate the RISC-V pipelined processor
    riscv_pipelined RV(
        .clk(clk),
        .reset(reset)
    );

    // Generate clock: 10ns period (5ns high, 5ns low)
    always #5 clk = ~clk;

    // Testbench stimulus
    initial begin
        // Initialize signals
        clk   = 0;
        reset = 1;    // Assert reset
        #20 reset = 0; // Deassert reset after 20ns

        // Run simulation for 200ns then finish
        #200 $finish;
    end

endmodule
