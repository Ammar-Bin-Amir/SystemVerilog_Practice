// Covergroup in class
class test;

    bit [1:0] a, b;

    covergroup cg;
        coverpoint a;
        coverpoint b;
    endgroup

    function new();
        cg = new();
    endfunction    

endclass

module covergroup_and_coverpoint (
    input logic clk
);
    
    // Without CLK
    bit [1:0] a, b;

    covergroup cg;
        coverpoint a;
        coverpoint b;
    endgroup

    cg cg0;

    initial begin
        cg0 = new();
        repeat (4) begin
            a = $random();
            b = $random();
            cg0.sample();   // record values can enable to generate a report at the end of simulation
        end
    end

    // With CLK
    bit [1:0] a, b;

    covergroup cg @(posedge clk);   // values are recorded at positive edge of clock
        coverpoint a;
        coverpoint b;
    endgroup

    cg cg0;

    initial begin
        cg0 = new();
        repeat (4) begin
            a = $random();
            b = $random();
            @(posedge clk);     // because of random values needed to be toggle
        end
    end

endmodule