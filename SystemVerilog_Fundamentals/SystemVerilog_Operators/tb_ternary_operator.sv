module tb_ternay_operator;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic in;
    logic out;

    ternary_operator dut (
        .in,
        .out
    );

    initial begin
        #5ns in = 1'b0;
        #5ns in = 1'b1;
        #5ns in = 1'bz;
        #5ns $finish;
    end

endmodule