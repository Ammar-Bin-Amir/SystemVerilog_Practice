module slave_io (
    input logic clk, rst,
    input logic address,
    data_transfer slave_transfer
);

    reg [7:0] slave_data;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            slave_transfer.sdata <= 0;
        end
        else begin
            slave_data <= slave_transfer.mdata;
            if (address == 1'b0) begin
                slave_transfer.sdata <= 8'he1;
            end
            else if (address == 1'b1) begin
                slave_transfer.sdata <= 8'hf0;
            end
            else begin
                slave_transfer.sdata <= 8'hff;
            end
        end
    end
    
endmodule