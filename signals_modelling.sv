module signals_modelling (
    input wire clk
);
    
    logic l0, l1, l2;

    // Procedural Statement
    initial l0 = 1'b1;

    // Sequential Statement
    always @(posedge clk) begin
        l1 = l0;
    end

    // Continuous Assignment
    assign l2 = l1;

    wire w0, w1, w2;

    // Legal Multiple Drivers
    assign w0 = w1;
    assign w0 = w2;

    // Illegal Multiple Drivers
    assign l0 = l1;
    assign l0 = l2;

    // Legal Multiple Drivers
    // Race Condition
    initial l0 = 1'b0;
    initial l0 = 1'b1;

    always @(posedge clk) begin
        l0 = 1'b0;
    end
    always @(posedge clk) begin
        l0 = 1'b1;
    end

    // Illegal Multiple Drivers
    // No Race Condition
    assign l0 = 1'b0;

    always @(posedge clk) begin
        l0 = 1'b1;
    end

endmodule