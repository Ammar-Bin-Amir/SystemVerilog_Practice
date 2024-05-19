module tb_foreach_loop;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk;

    foreach_loop dut (.clk);

    initial clk = 0;
    always #5 clk = ~clk;

    initial #100 $finish;

endmodule