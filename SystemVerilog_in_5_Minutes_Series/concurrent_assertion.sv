module concurrent_assertion;
    
    // Check if a is 1 (at all clocks)
    logic a;

    property p();
        @(posedge clk)
        disable iff (dis)
        a == 1;
    endproperty

    ap: assert property(p);

    //// Property is overkilled to check a constant signal
    //// Signals must be synchronous to clock

    // Check if a and b is 1 (at all clocks)
    logic a, b;

    property p();
        @(posedge clk)
        disable iff (dis)
        (a == 1) && (b == 1);
    endproperty

    ap: assert property(p);

    // Check if a is 1, and only then, b is 1
    logic a, b;

    property p();
        @(posedge clk)
        disable iff (dis)
        // Overlapped Implication, check b at the same clock
        // a=0 b=0 (Vacous; neither pass not fail)
        // a=1 b=0 or a=0 b=1 (Failed)
        // a=1 b=1 (Passed)
        (a == 1) |-> (b == 1);
    endproperty

    ap: assert property(p);

    // Check if a is 1, and only then, b is 1 after 1 clock
    logic a, b;

    property p();
        @(posedge clk)
        disable iff (dis)
        // Non-overlapped Implication, check b at the next clock
        // a=0 b=0 (Vacous; neither pass not fail)
        // a=1 next posdge b=1 (Passed)
        // a=1 next posdge b=0 (Failed)
        (a == 1) |=> (b == 1);
    endproperty

    ap: assert property(p);

    // Check if a is 1, and b is 1 after 1 clock (always)
    logic a, b;

    property p();
        @(posedge clk)
        disable iff (dis)
        // ## indicates number of clocks, check b one clock later
        // a=0 b=x (Failed)
        // a=1 b=1 at all time (Passed)
        (a == 1) ##1 (b == 1);
    endproperty

    ap: assert property(p);

    // Check if a is 1, and only then, b is 1 after 1 clock using ##
    logic a, b;

    property p();
        @(posedge clk)
        disable iff (dis)
        // a=0 b=x (Failed)
        // a=1 b=1 3 posedge later (Passed)
        (a == 1) |->##3 (b == 1);
    endproperty

    ap: assert property(p);

    // Check if a is 1, and only then, b is 1 after n clocks using ##
    logic a, b;

    property p();
        @(posedge clk)
        disable iff (dis)
        // a=0 b=x (Failed)
        // a=0 --> a=1 b=1 3 posedge later (Passed)
        (a == 0) ##1 (a == 1) |->##3 (b == 1);
        // another way
        $rose(a) |->##3 (b == 1);
        // also if b=0 --> b=1
        $rose(a) |->##3 $rose(b);
        // range of posedges
        $rose(a) |->##[3:5] $rose(b);
    endproperty

    ap: assert property(p);

endmodule