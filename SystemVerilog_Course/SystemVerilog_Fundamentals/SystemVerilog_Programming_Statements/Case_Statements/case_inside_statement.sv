module case_inside_statement (
    input logic [7:0] data
);

    always_comb begin
        case (data) inside
            8'b1???_????: $display("MSB Set");
            8'b????_1111: $display("Lower 4 bits, ignored upper bits");
            8'b0000_0000: $display("All zeros");
            default: $error("Unrecognized data %b", data);
        endcase
    end

endmodule