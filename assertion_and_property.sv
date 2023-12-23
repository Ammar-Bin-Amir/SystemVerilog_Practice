module assertion_and_property (
    input bit clk
);
    
    bit [1:0] b;

    always @(posedge clk) begin
        b = b + 1;
        // Without Assertion
        if (b%2 == 0) $display("Passed b=%0d",b);
        else $error("Failed b is odd number %0d",b);
        // With Assertion
        assert(b%2 == 0);
        // Immediate Assertion
        assert(b%2 == 0)        // without ; assertion is checked after posedge
        else $error("Failed b is odd number %0d",b);
    end

    always @(posedge clk) begin
        b = b + 1;
    end

    // Assertion w.r.t Time
    // Assertion timing is not predictable, checks value before posedge
    always @(posedge clk) begin
        assert (b%2 == 0);
    end
    // Asserts on negedge, checks value before negedge
    always @(negedge clk) begin
        assert (b%2 == 0);
    end
    // Deffered Assertion
    always @(posedge clk) begin
        assert #0 (b%2 == 0);
    end
    // Final Assertion, checks final value not glitches
    always @(posedge clk) begin
        assert final (b%2 == 0);
    end

    // Concurrent Assertion

    property p_check_b_is_even();   // property name
        @(posedge clk)              // when to look at it
        b%2 == 0;                   // expected behavior
    endproperty
    // label is optional, giving name to this instance
    ap_b_even: assert property(p_check_b_is_even);

    logic [1:0] b;

    property p();
        @(posedge clk)
        disable iff (dis)   // optional disable statement
        b%2 == 0;
    endproperty

    ap_b: assert property(p);

    logic [1:0] x,y;

    property p(logic [1:0] b);
        @(posedge clk)
        disable iff (dis)   // use value from observed region, at dis signal nothing is checked
        b%2 == 0;           // use sampled value from preponed region
    endproperty

    ap_x: assert property(p(x));    // fail if condition is not met
    ap_y: cover property(p(y));     // sample if condition has happen

    logic [1:0] x,y;

    property p(logic [1:0] b);
        @(posedge clk)
        disable iff (dis)   // use value from observed region, at dis signal nothing is checked
        dis == 1 || b%2 == 0;           // use sampled value from preponed region
    endproperty

    ap_x: assert property(p(x));    // fail if condition is not met
    ap_y: cover property(p(y));     // sample if condition has happen

    //// If totally confused do not use disable statement

endmodule