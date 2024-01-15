module tb_recursive_functions;

    timeunit 1ns;
    timeprecision 1ps;

    int n;

    recursive_functions dut (.n);

    initial begin
        #10 n = 3;
        #50 n = 6;
        #100 $finish;
    end
    
endmodule