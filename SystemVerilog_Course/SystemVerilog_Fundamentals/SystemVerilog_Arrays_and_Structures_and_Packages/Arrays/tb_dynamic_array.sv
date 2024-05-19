module tb_dynamic_array;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk;

    dynamic_array dut (.clk);

    initial begin
        clk = 0;
        #100ns $finish;
    end

    always #10ns clk = ~clk;

endmodule