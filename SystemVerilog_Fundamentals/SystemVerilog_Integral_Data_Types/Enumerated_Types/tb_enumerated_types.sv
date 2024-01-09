module tb_enumerated_types;
    
    timeunit 1ns;
    timeprecision 1ps;

    bit clk;
    wire [1:0] out;

    enumerated_types dut (
        .clk (clk),
        .out (out)
    );

    initial clk = 0;
    always #10ns clk = ~clk;

    initial #100ns $finish;

endmodule