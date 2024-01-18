module tb_logical_operators;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [2:0] a, b;
    logic not_a, not_b, and_ab, or_ab;

    logical_operators dut (
        .a, .b,
        .not_a, .not_b, .and_ab, .or_ab
    );

    initial begin
        #5ns a = 3'b000; b = 3'b000;
        #5ns a = 3'b000; b = 3'b111;
        #5ns a = 3'b000; b = 3'bxxx;
        #5ns a = 3'b000; b = 3'bzzz;
        #5ns a = 3'b111; b = 3'b111;
        #5ns a = 3'b111; b = 3'bxxx;
        #5ns a = 3'b111; b = 3'bzzz;
        #5ns a = 3'bxxx; b = 3'bxxx;
        #5ns a = 3'bxxx; b = 3'bxxx;
        #5ns a = 3'bzzz; b = 3'bzzz;
        #10ns $finish;
    end

endmodule