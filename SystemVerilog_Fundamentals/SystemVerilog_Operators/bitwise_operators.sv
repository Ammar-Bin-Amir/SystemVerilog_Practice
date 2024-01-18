module bitwise_operators (
    input logic a, b,
    input logic sel_not,
    output logic not_ab, and_ab, or_ab, xor_ab
);

    always_comb begin
        // NOT
        case (sel_not)
            0: not_ab = ~a;
            1: not_ab = ~b;
        endcase
        // AND
        and_ab = a & b;
        // OR
        or_ab = a | b;
        // XOR
        xor_ab = a ^ b;
    end
    
endmodule