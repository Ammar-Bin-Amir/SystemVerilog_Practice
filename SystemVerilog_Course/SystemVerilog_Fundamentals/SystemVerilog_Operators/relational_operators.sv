module relational_operators (
    input logic [2:0] a, b,
    output logic less_than, equal_or_less_than, greater_than, equal_or_greater_than
);
    
    always_comb begin
        // Less Than
        less_than = a < b;
        // Equal OR Less Than
        equal_or_less_than = a <= b;
        // Greater Than
        greater_than = a > b;
        // Equal OR Greater Than
        equal_or_greater_than = a >= b;
    end

endmodule