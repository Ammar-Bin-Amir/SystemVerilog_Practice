module tb_strings;
    
    timeunit 1ns;
    timeprecision 1ps;

    strings dut ();

    initial begin
        #100ns $finish;
    end

endmodule