module tb_relational_operators;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [2:0] a, b;
    logic less_than, equal_or_less_than, greater_than, equal_or_greater_than;

    relational_operators dut (
        .a, .b,
        .less_than, .equal_or_less_than,
        .greater_than, .equal_or_greater_than
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