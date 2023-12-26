`timescale 1ns/1ns

module tb_gate_level_modelling;
    
    logic a, b, ci, sum, co;

    gate_level_modelling dut (
        .a (a),
        .b (b),
        .ci (ci),
        .sum (sum),
        .co (co)
    );

    initial begin
        for (integer i = 1; i <= 25; i++) begin
            #10 a = $random; b = $random; ci = $random;
        end
        #25 $finish;
    end

endmodule