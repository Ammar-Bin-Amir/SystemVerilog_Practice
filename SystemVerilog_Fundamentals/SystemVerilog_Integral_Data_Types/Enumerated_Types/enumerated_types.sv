module enumerated_types (
    input wire clk,
    output wire [1:0] out
);
    
    enum logic [1:0] {RED = 2'b01, YELLOW = 2'b10, GREEN = 2'b11} state, next_state;

    always @(posedge clk) begin
        if (next_state == RED) begin
            next_state = YELLOW;
        end
        else if (next_state == YELLOW) begin
            next_state = GREEN;
        end
        else if (next_state == GREEN) begin
            next_state = RED;
        end
        else begin
            next_state = RED;
        end
    end

    assign out = next_state;

endmodule