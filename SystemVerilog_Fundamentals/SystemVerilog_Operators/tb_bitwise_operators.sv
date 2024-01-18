module tb_bitwsise_operators;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic a, b;
    logic sel_not;
    logic not_ab, and_ab, or_ab, xor_ab;

    bitwise_operators dut (
        .a, .b,
        .sel_not,
        .not_ab, .and_ab, .or_ab, .xor_ab
    );

    initial begin
        #5ns sel_not = 0;
        #5ns a = 1'b0; b = 1'b0;
        #5ns a = 1'b0; b = 1'b1;
        #5ns a = 1'b0; b = 1'bx;
        #5ns a = 1'b0; b = 1'bz;
        #5ns sel_not = 1;
        #5ns a = 1'b0; b = 1'bz;
        #5ns a = 1'b0; b = 1'bx;
        #5ns a = 1'b0; b = 1'b1;
        #5ns a = 1'b0; b = 1'b0;
        #10ns $finish;
    end

endmodule