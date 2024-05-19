module master (
    input logic clk, rst,
    input logic address,
    output logic [7:0] mdata,
    input logic [7:0] sdata
);
    
    reg [7:0] master_data;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            mdata <= 0;
        end
        else begin
            master_data <= sdata;
            if (address == 1'b0) begin
                mdata <= 8'ha5;
            end
            else if (address == 1'b1) begin
                mdata <= 8'hc3;
            end
            else begin
                mdata <= 8'hff;
            end
        end
    end

endmodule