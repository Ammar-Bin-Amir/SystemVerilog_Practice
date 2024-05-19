module inside_operator (
    input logic [3:0] data,
    output logic equal_to_any, equal_to_range
);
    
    always_comb begin
        // Comparision
        equal_to_any = data inside {-32, 0, 2, 4, 8, 16, 32};
        // Relational
        equal_to_range = data inside {[0:16]};
    end

endmodule