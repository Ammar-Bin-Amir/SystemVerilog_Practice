module top (
    input logic clk, rst,
    input logic address
);

    logic [7:0] mdata, sdata;
    
    master dut_master (
        .clk,
        .rst,
        .address,
        .mdata,
        .sdata
    );

    slave dut_slave (
        .clk,
        .rst,
        .address,
        .mdata,
        .sdata
    );
    
endmodule