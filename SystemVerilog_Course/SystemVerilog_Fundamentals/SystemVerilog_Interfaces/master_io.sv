module master_io (
    input logic clk, rst,
    input logic address,
    data_transfer master_transfer
);
    
     reg [7:0] master_data;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            master_transfer.mdata <= 0;
        end
        else begin
            master_data <= master_transfer.sdata;
            if (address == 1'b0) begin
                master_transfer.mdata <= 8'ha5;
            end
            else if (address == 1'b1) begin
                master_transfer.mdata <= 8'hc3;
            end
            else begin
                master_transfer.mdata <= 8'hff;
            end
        end
    end

endmodule