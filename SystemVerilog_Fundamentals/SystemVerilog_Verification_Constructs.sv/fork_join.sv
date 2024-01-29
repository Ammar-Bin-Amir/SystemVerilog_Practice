module fork_join (
    input logic clk,
    input logic [2:0] d_o, d_e,
    output logic [2:0] q
);
    
    logic [2:0] d;
    
    always_comb begin
        d = d_o + d_e;
    end
    
    always_ff @( posedge clk ) begin
        q <= d;
    end

endmodule