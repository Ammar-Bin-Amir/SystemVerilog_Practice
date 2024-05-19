module tb_queues;
    
    timeunit 1ns;
    timeprecision 1ps;

    queues dut ();

    initial begin
        #100ns $finish;
    end

endmodule