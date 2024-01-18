module tb_case_inside_statement;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [7:0] data;

    case_inside_statement dut (.data);

    initial begin
        #10 data = 8'bxxxx_xxxx;
        #10 data = 8'b0000_0000;
        #10 data = 8'b1111_1111;
        #10 data = 8'bzzzz_zzzz;
        #10 $finish;
    end

endmodule