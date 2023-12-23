module events (
    input logic clk
);
    
    // Signal as event using alias @

    initial begin
        @(clk);                             // either edge is triggered
        @(posedge clk);                     // positive edge is triggered
        @(negedge clk);                     // negative edge is triggered
        @(posedge clk or negedge clk);      // depends on logic defined on which edge is triggered
        @(posedge clk , negedge clk);       // depends on logic defined on which edge is triggered
    end

    // Signal as event using wait

    initial begin
        wait (clk);                 // clk is 1
        wait (clk == 1'b1);         // clk is 1
        wait (clk == 1'b0);         // clk is 0
    end

    // Signal as event using event

    event ev;

    initial begin
        ->(ev);     // trigger an event
        @(ev);      // wait for an event
        wait (ev.triggered);
    end

    initial begin
        fork
            #10ns ->(ev);   // trigger first
            #20ns @(ev);    // wait later
        join
        $display("Done");   // display will not happen
    end

    initial begin
        fork
            #10ns ->(ev);                // trigger first
            #20ns wait(ev.triggered);    // wait later
        join
        $display("Done");   // display will not happen
    end

    initial begin
        fork
            #20ns ->(ev);   // trigger later
            #10ns @(ev);    // wait first
        join
        $display("Done");   // display will happen
    end

    initial begin
        fork
            #20ns ->(ev);                // trigger later
            #10ns wait(ev.triggered);    // wait first
        join
        $display("Done");   // display will happen
    end

     initial begin
        fork
            #10ns ->(ev);
            #10ns @(ev);
        join
        $display("Done");   // display may be printed
    end

    initial begin
        fork
            #20ns ->(ev);
            #10ns wait(ev.triggered);
        join
        $display("Done");   // display will be printed
    end

endmodule