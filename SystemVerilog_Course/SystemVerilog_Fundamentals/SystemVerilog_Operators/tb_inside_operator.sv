module tb_inside_operator;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [3:0] data;
    logic equal_to_any, equal_to_range;

    inside_operator dut (
        .data,
        .equal_to_any, .equal_to_range
    );

    initial begin
        #5ns data = 0;
        #5ns data = 8;
        #5ns data = -32;
        #5ns data = 32;
        #10ns $finish;
    end

endmodule