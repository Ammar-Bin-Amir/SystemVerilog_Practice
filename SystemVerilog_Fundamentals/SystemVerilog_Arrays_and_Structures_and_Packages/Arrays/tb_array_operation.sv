module tb_array_operation;

    timeunit 1ns;
    timeprecision 1ps;

    logic clk;

    array_operation dut (.clk);

    initial begin
        clk = 0;
        #100ns $finish;
    end

    always #10ns clk = ~clk;
    
endmodule