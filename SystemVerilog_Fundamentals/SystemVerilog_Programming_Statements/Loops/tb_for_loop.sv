module tb_for_loop;

    timeunit 1ns;
    timeprecision 1ps;
    
    logic clk;

    for_loop dut (.clk);

    initial clk = 0;
    always #5ns clk = ~clk;

    initial #500 $finish;
    
endmodule