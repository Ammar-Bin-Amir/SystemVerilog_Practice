module tb_unary_reduction_operators;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [3:0] a;
    logic and_a, or_a, xor_a;

    unary_reduction_operators dut (
        .a,
        .and_a, .or_a, .xor_a
    );

    initial begin
        #5ns a = 4'b0000;
        #5ns a = 4'b1111;
        #5ns a = 4'bxxxx;
        #5ns a = 4'bzzzz;
        #5ns a = 4'b01xz;
        #5ns a = 4'bzx10;
        #10ns $finish;
    end

endmodule