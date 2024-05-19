module behavioural_modelling (
    input logic a, b, ci,
    output logic sum, co
);
    
    always @(a, b, ci) begin
        {co, sum} = a + b + ci;
    end

endmodule