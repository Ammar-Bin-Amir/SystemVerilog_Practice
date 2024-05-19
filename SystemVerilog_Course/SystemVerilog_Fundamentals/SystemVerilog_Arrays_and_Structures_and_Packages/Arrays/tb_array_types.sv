module tb_array_types;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk;
    logic en;

    array_types dut (.clk, .en);

    initial begin
        clk = 0;
        #10ns en = 1;
        #100ns $finish;
    end

    always #5 clk = ~clk;

endmodule