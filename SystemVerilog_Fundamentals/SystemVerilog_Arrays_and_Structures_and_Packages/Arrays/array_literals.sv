module array_literals (
    input logic clk
);
    
    logic [3:0] down_odd_f [0:3];
    logic [3:0] up_even_f [3:0];
    logic [3:0] two_f[8];
    logic ones_f[7];
    logic [3:0] mix_f[7];

    always_ff @ (posedge clk) begin
        down_odd_f = '{1,3,5,7};
        up_even_f = '{2,4,6,8};
        foreach (down_odd_f[i]) $display("down_odd_f = %p", down_odd_f);
        foreach (up_even_f[i]) $display("up_even_f = %p", up_even_f);
        two_f = '{2{1,2,3,4}};          // the set '{1,2,3,4} is replicated 2 times
        ones_f = '{default:1};          // all elements are assigned to 1
        mix_f = '{0:3, 6:5, default:2}; // assign 3 to element 0, 5 to element 6, 2 to all others
    end

endmodule