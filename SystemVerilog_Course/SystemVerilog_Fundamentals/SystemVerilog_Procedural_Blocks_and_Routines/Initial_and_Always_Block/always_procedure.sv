module always_procedure (
    input wire a,
    input wire b,
    output logic sum_v, sum_sv,
    input wire x,
    input wire en,
    output logic y_v, y_sv,
    input wire clk,
    input wire d,
    output logic q_v, q_sv
);
    
    // Verilog Constructs

    always @(*) begin
        sum_v = a + b;
    end

    always @(x, en) begin
        if (en) begin
            y_v = x;
        end
    end

    always @(posedge clk) begin
        q_v <= d;
    end

    // SystemVerilog Constructs

    always_comb begin
        sum_sv = a + b;
    end

    always_latch begin
        if (en) begin
            y_sv = x;
        end
    end

    always_ff @( posedge clk ) begin
        q_sv <= d;
    end

endmodule