module tb_top_io;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk, rst;
    logic address;

    top_io dut (
        .clk,
        .rst,
        .address
    );

    always #10ns clk = ~clk;

    initial begin
        clk = 0;
        #10ns rst = 1; #10ns rst = 0;
        for (int i = 1; i <= 10; i++) begin
            #25ns address = $random;
        end
        #25ns $finish;
    end

endmodule