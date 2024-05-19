module slave (
    input logic clk, rst,
    input logic address,
    input logic [7:0] mdata,
    output logic [7:0] sdata
);

    reg [7:0] slave_data;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            sdata <= 0;
        end
        else begin
            slave_data <= mdata;
            if (address == 1'b0) begin
                sdata <= 8'he1;
            end
            else if (address == 1'b1) begin
                sdata <= 8'hf0;
            end
            else begin
                sdata <= 8'hff;
            end
        end
    end
    
endmodule