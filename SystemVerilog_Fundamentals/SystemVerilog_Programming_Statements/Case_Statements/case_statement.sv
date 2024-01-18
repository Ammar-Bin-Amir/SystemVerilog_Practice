module case_statement (
    input logic [1:0] state,
    output logic [2:0] count
);

    always @(state) begin
        case (state)
            0: begin
                $display("Starting Count");
                count = 0;
            end
            1, 2: count = 6;
            3: ;
            default: $error("Illegal state value %b", state);
        endcase
    end

endmodule