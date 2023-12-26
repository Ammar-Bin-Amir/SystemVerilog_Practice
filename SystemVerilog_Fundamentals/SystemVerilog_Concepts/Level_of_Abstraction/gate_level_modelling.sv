module gate_level_modelling (
    input logic a, b, ci,
    output logic sum, co
);
    
    xor g1 (n1, a, b);
    xor g2 (sum, n1, ci);
    and g3 (n2, a, b);
    and g4 (n3, n1, ci);
    or g5 (co, n2, n3);

endmodule