module tb_structures;
    
    timeunit 1ns;
    timeprecision 1ps;

    structures dut ();

    initial begin
        #100ns $finish;
    end

endmodule