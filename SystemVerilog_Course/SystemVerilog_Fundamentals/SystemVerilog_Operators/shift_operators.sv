module shift_operators (
    input logic [3:0] data_unsigned, 
    input logic signed [3:0] data_signed,
    output logic [3:0] sll, srl, sla, sra
);

    always_comb begin
        // Shift Left Logical
        sll = data_unsigned << 2;
        // Shift Right Airthmetic
        srl = data_unsigned >> 2;
        // Shift Left Logical
        sla = data_signed <<< 2;
        // Shift Right Airhtmetic
        sra = data_signed >>> 2;
    end

endmodule