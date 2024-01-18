module tb_comparision_operators;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [2:0] a, b;
    logic equal_2_state, not_equal_2_state, equal_4_state, not_equal_4_state, equal_wild_card, not_equal_wild_card;

    comparision_operators dut (
        .a, .b,
        .equal_2_state, .not_equal_2_state,
        .equal_4_state, .not_equal_4_state,
        .equal_wild_card, .not_equal_wild_card
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
        #5ns a = 3'b1x0; b = 3'b1?0;
        #5ns a = 3'b1x0; b = 3'b1?1;
        #5ns a = 3'b1x0; b = 3'b1?x;
        #5ns a = 3'b1x0; b = 3'b1?z;
        #10ns $finish;
    end

endmodule