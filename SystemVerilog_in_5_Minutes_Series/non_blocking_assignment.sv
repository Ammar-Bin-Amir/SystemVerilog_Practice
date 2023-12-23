module non_blocking_assignment;
    
    int a = 1, b = 2, c = 3, d;

    // Blocking assignment before execution:
    //                                 a = 1    b = 2    c = 3    d = ?
    always @(posedge clk) begin
        b = a;                      // a = 1    b = 1    c = 3    d = ?
        c = b;                      // a = 1    b = 1    c = 1    d = ?
        d = c;                      // a = 1    b = 1    c = 1    d = 1
    end

    // Non-Blocking assignment before execution:
    //                                 a = 1    b = 2    c = 3    d = ?
    always @(posedge clk) begin
        b <= a;                      // a = 1    b = 1    c = 3    d = ?
        c <= b;                      // a = 1    b = 1    c = 2    d = ?
        d <= c;                      // a = 1    b = 1    c = 1    d = 3
    end

    // Do not mix blocking and non-blocking assignment
    always @(posedge clk) begin
        b = a;
        c <= b;
        d = c;
        e <= d;
    end

    /*
    In module, execution order is:                      In program, execution order is:
    1) b = a;                                           1) c <= b;
                                                           e <= d;
    2) d = c;                                           2) b = a;
    3) c <= b;                                          3) d = c;
       e <= d;
    */

endmodule