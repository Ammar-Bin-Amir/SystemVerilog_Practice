module unary_reduction_operators (
    input logic [3:0] a,
    output logic and_a, or_a, xor_a
);

    always_comb begin
        // AND
        and_a = &a;
        // OR
        or_a = |a;
        // XOR
        xor_a = ^a;
    end
    
endmodule