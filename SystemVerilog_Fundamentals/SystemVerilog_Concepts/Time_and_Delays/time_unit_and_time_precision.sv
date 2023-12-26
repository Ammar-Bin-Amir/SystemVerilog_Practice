module time_unit_and_time_precision (
    input logic a, b, ci,
    output logic sum, co
);

    always @(a, b, ci) begin
        {co, sum} = a + b + ci;
    end
    
endmodule