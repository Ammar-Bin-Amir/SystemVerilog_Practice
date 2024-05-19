module initial_procedure;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic a;
    logic b;
    wire sum_v, sum_sv;
    logic x;
    logic en;
    wire y_v, y_sv;
    logic clk;
    logic d;
    wire q_v, q_sv;

    always_procedure dut (
        .a,
        .b,
        .sum_v, .sum_sv,
        .x,
        .en,
        .y_v, .y_sv,
        .clk,
        .d,
        .q_v, .q_sv
    );

    initial clk = 0;
    always #3ns clk = ~clk;

    initial begin
        #10 a = 0;
        #10 b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 x = 0;
        #10 en = 0;
        #10 x = 1; en = 0;
        #10 x = 1; en = 1;
        #10 x = 0; en = 1;
        #10 d = 0;
        #10 d = 1;
        #10 $finish;
    end

endmodule