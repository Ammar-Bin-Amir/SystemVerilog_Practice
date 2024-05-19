module tb_fork_join;

    timeunit 1ns;
    timeprecision 1ps;

    logic clk;
    logic [2:0] d_o, d_e;
    logic [2:0] q;

    fork_join dut (
        .clk,
        .d_o,
        .d_e,
        .q
    );

    logic [2:0] check;

    initial begin
        clk <= 0; forever #10ns clk = ~clk;
        d_o = 0; d_e = 0; check = 0;
        fork
            #25ns d_o = 1;
            #20ns d_e = 2;
        join
        #15ns check = 3;
        fork
            #10ns d_o = 3;
            #5ns d_e = 4;
        join_any
        #25ns check = 5;
        fork
            #20ns d_o = 5;
            #15ns d_e = 6;
        join_none
        #10ns check = 7;
        #25ns $finish;
    end
    
endmodule