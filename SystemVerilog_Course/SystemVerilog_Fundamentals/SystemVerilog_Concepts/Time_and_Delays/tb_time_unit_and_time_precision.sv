// 1st Way
// `timescale 1ns/1ps

module tb_time_unit_and_time_precision;
    
    // 2nd Way
    // timeunit 1ns/1ps;

    // 3rd Way
    timeunit 1ns;
    timeprecision 1ps;
    
    logic a, b, ci, sum, co;

    time_unit_and_time_precision dut (
        .a (a),
        .b (b),
        .ci (ci),
        .sum (sum),
        .co (co)
    );

    initial begin
        #10 a = 1;          // if unit not specified, considered as timeunit
        #15ns b = 1;        // recommended to use timeunit while declaring time delays
        #10.5ns ci = 0;     // time delays in decimal points are allowed
        #25ns $finish;
    end

endmodule

// 4th Way
// Calling -timescale while simulation
//// Depending on the tool used