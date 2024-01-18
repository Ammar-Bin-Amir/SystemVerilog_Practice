module tb_shift_operators;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [3:0] data_unsigned;
    logic signed [3:0] data_signed;
    logic [3:0] sll, srl, sla, sra;

    shift_operators dut (
        .data_unsigned,
        .data_signed,
        .sll, .srl, .sla, .sra
    );

    initial begin
        #5ns data_unsigned = 4'b0101; data_signed = 4'b0101;
        #5ns data_unsigned = 4'b1010; data_signed = 4'b1010;
        #5ns data_unsigned = 4'bx01z; data_signed = 4'bx01z;
        #5ns data_unsigned = 4'bz10x; data_signed = 4'bz10x;
        #5ns $finish;
    end

endmodule