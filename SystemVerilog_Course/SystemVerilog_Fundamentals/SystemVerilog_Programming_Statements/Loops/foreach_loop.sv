module foreach_loop (
    input logic clk
);
    
    int array[15];

    always_ff @(posedge clk) begin
        foreach (array[idx]) begin
            $display("array[%0d] = %0d", idx, array[idx]);
        end
    end

endmodule