module tb_slave;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk, rst;
    logic address;
    logic [7:0] mdata;
    logic [7:0] sdata;

    slave dut (
        .clk,
        .rst,
        .address,
        .mdata,
        .sdata
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        #10 rst = 1; #10 rst = 0;
        for (int i = 1; i <= 10; i++) begin
            #10 address = $random; mdata = $random;
        end
        #10 $finish;
    end

endmodule