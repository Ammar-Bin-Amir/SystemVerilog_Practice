module array_operation (
    input logic clk
);
    
    logic a_f [3];
    logic [7:0] down_f [0:3];
    logic [7:0] up_f [3:0];

    always_ff @( posedge clk ) begin
        // Array Loop
        foreach (down_f[j]) begin
            down_f[j] <= 0;
        end
        foreach (up_f[k]) begin
            up_f[k] <= 0;
        end
        // Array Comparision
        if (down_f === up_f) begin
            foreach (a_f[i]) begin
                a_f[i] <= 0;
            end
        end
        // Copy Array
        down_f[1] <= 8'ha;
        down_f[2] <= 8'h5;
        up_f[2:1] <= down_f[1:2];
    end

endmodule