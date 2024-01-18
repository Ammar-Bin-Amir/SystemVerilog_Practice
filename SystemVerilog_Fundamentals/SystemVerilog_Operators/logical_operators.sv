module logical_operators (
    input logic [2:0] a, b,
    output logic not_a, not_b, and_ab, or_ab
);
    
    always_comb begin
        // Logical NOT
        not_a = !a;
        not_b = !b;
        // Logical AND
        and_ab = a && b;
        // Logical OR
        or_ab = a || b;
    end

endmodule