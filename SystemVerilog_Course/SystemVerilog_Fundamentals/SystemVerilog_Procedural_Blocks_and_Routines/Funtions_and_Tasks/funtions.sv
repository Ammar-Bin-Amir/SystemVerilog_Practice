module functions (
    input logic clk,
    input int a,
    input int b,
    input int c,
    output int r
);
    
    function int mult_acc (input int x, y, z);
        
        mult_acc = x * y  + z;
        
    endfunction

    function void print();
        
        $display("@%t %m: a=%0d, b=%0d, c=%0d, r=%0d", $realtime, a, b, c, r);
        
    endfunction

    always @(posedge clk ) r <= mult_acc(a, b, c);
    always @(posedge clk ) print();

endmodule