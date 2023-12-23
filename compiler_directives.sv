`ifndef A_SV    // if not defined
`define A_SV
module a;
    $display("I'm module a");    
endmodule
`endif

`include "a.sv"
module test1;
    a ma();
endmodule

`include "a.sv"
module test2;
    a ma();
endmodule
`endif

module compiler_directives;
    
    logic a,b,o;

    //// More components and data path is longer
    // It contains AND gate, OR gate and MUX 2x1
    logic sel;
    always @(*) begin
        if (sel) begin
            o = a & b;
        end
        else begin
            o = a | b;
        end
    end

    // It contains AND gate and OR gate
    logic sel;
    always @(*) begin
        `ifdef SEL
            o = a & b;
        `else
            o = a | b;
        `endif
    end

    logic [1:0] a;

    // Without macros
    initial begin
        a = $random;
        $display("%0d",a);
        a = $random;
        $display("%0d",a);
    end

    // With macros
    `define random_a a = $random;

    initial begin
        `random_a
        $display("%0d",a);
        `random_a
        $display("%0d",a);
    end

    // With larger macros
    `define random_a a = $random; $display("%0d",a);    // one line
    `define random_a a = $random; \                     // multiple lines
            $display("%0d",a);

    initial begin
        `random_a
        `random_a
    end

endmodule