module tasks;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk;
    int a;
    int b;
    int c;
    int r;

    functions dut (
        .clk,
        .a,
        .b,
        .c,
        .r
    );

    initial clk <= 0;
    always #5 clk = ~clk;

    task SendInput(input int a, b, c);
        for (int i = 0; i <= 32; i++) begin
            #10ns a = i; b = $random; c = 0;
        end
    endtask

    initial begin
        SendInput(a, b, c);
        #100ns $finish;
    end

endmodule