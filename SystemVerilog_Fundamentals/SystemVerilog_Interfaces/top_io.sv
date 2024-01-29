module top_io (
    input logic clk, rst,
    input logic address
);

    data_transfer io();
    
    master_io dut_master_io (
        .clk,
        .rst,
        .address,
        .master_transfer (io)
    );

    slave_io dut_slave_io (
        .clk,
        .rst,
        .address,
        .slave_transfer (io)
    );
    
endmodule