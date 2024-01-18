module tb_case_statement;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [1:0] state;
    logic [2:0] count;

    case_statement dut (
        .state,
        .count
    );

    initial begin
        #10 state = 2'b00;
        #10 state = 2'b01;
        #10 state = 2'b10;
        #10 state = 2'b11;
        #10 state = 2'bzz;
        #10 $finish;
    end

endmodule