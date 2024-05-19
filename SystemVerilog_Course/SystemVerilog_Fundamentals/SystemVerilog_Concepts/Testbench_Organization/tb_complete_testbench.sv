module tb_complete_testbench;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic a_in, b_in, c_in;
    logic sum_out, c_out;

    complete_testbench dut (
        .a (a_in),
        .b (b_in),
        .ci (c_in),
        .sum (sum_out),
        .co (c_out)
    );

    initial begin
        a_in = 0;
        b_in = 0;
        c_in = 0;
        #10ns a_in = 1;
        #10ns b_in = 1;
        #10ns c_in = 1;
        $stop;
        $finish;
    end

    initial begin
        $monitor("At %d: a=%b b=%b ci=%b sum=%b co=%b", $time, a_in, b_in, c_in, sum_out, c_out);
    end

endmodule