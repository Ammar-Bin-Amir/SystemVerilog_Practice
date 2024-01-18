module tb_concatenate_operators;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [3:0] data;
    logic [3:0] rotate_left, rotate_right, copy_by_2, copy_by_2_and_shift_left, copy_by_2_and_shift_right;

    concatenate_operators dut (
        .data,
        .rotate_left,
        .rotate_right,
        .copy_by_2,
        .copy_by_2_and_shift_left,
        .copy_by_2_and_shift_right
    );

    initial begin
        #5ns data = 4'b0100;
        #5ns data = 4'b1011;
        #5ns data = 4'bx01z;
        #5ns data = 4'bz10x;
        #5ns $finish;
    end

endmodule