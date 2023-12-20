module threads;

    int a, b, c;
    int b1, b2;

    // Initial Blocks
    initial #10ns a = 1;
    initial #20ns b = 1;
    initial #20ns c = 1;

    /*
    10ns a = 1
    20ns b = 1
    20ns c = 1
    */

    // Fork Join
    initial begin
        fork
            #10ns a = 1;
            #10ns b = 1;
        join
        c = 1;
    end

    /*
    10ns a = 1
    10ns b = 1
    10ns c = 1
    */

    // Fork Join 3 Threads
    initial begin
        fork
            #10ns a = 1;
            #20ns b1 = 1;
            #10ns b2 = 1; 
        join
        c = 1;
    end

    /*
    10ns a = 1
    20ns b1 = 1
    10ns b2 = 1
    20ns c = 1
    */

    // Fork Join + Begin End
    initial begin
        #10ns a = 1;
        fork
            #20ns b1 = 1;
            #10ns b2 = 1; 
        join
        c = 1;
    end

    /*
    10ns a = 1
    30ns b1 = 1
    20ns b2 = 1
    30ns c = 1
    */

    // Fork Join_Any
    initial begin
        fork
            #10ns a = 1;
            #20ns b = 1;
        join_any
        c = 1;
    end

    /*
    10ns a = 1
    20ns b = 1
    10ns c = 1
    */

    // Fork Join_None
    initial begin
        fork
            #10ns a = 1;
            #20ns b = 1;
        join_none
        c = 1;
    end

    /*
    10ns a = 1
    20ns b = 1
    0ns c = 1
    */

    // Fork Join_None with Wait Fork, same as Fork Join
    initial begin
        fork
            #10ns a = 1;
            #20ns b = 1;
        join_none
        wait fork;
        c = 1;
    end

    /*
    10ns a = 1
    20ns b = 1
    20ns c = 1
    */
    
endmodule