module tb_packages;
    
    timeunit 1ns;
    timeprecision 1ps;

    packages dut ();

    initial begin
        #100ns $finish;
    end

endmodule