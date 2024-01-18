module comparision_operators (
    input logic [2:0] a, b,
    output logic equal_2_state, not_equal_2_state, equal_4_state, not_equal_4_state, equal_wild_card, not_equal_wild_card
);
    
    always_comb begin
        // 2-State
        equal_2_state = a == b;
        not_equal_2_state = a != b;
        // 4-State
        equal_4_state = a === b;
        not_equal_4_state = a !== b;
        // Wild Card
        equal_wild_card = a ==? b;
        not_equal_wild_card = a !=? b;
    end

endmodule