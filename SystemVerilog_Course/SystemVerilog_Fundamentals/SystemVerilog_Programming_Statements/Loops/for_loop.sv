module for_loop (
    input logic clk
);

    int array[16];
    int reverse_array[16];
    
    always_ff @(posedge clk) begin
        // Single Step Assignements
        for (int i = 0; i < 16 ; i++) begin
            array[i] <= i;
        end
        // Multiple Step Assignements
        for (int j = 0, k = 15; j < 16; j++, k--) begin
            reverse_array[k] <= array[j];
        end
    end
    
endmodule