/*

PREPONED
ACTIVE                              // module's statements of =
NON-BLOCKING ASSIGNMENT             // module's statements of <=
OBSERVED
REACTIVE                            // program's statements of =
REACTIVE-NON-BLOCKING ASSIGNMENT    // program's statements of <=
POSTPONED

*/

module dut (
    input bit clk,
    input bit [2:0] a,
    output bit [2:0] b
);
    
    always @(posedge clk) begin
        b = a;
    end

endmodule

module program_and_scheduling_semantics;
    
    bit clk;

    always #5ns clk = ~clk;

    bit [2:0] a;
    bit [2:0] b;

    dut dut0 (clk, a, b);
    test test0 (clk, a, b);

endmodule

program test (
    input bit clk,
    input bit [2:0] a,
    output bit [2:0] b
);

    bit [2:0] r;

    initial begin
        @(posedge clk);
        a = 1;
    end

    initial begin
        @(posedge clk);
        r = b;
        $display("result=%0d",r);
    end

endprogram