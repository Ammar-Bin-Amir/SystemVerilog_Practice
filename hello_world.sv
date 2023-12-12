module hello_world;
    
    // Print both in parallel at time 0
    initial $display("Hello World!");
    initial $display("Hello Again!");

    // Print both in sequence at time 0
    initial begin
        $display("Hello First");
        $display("Hello Second");
    end

    // Print both in sequence at respective time
    initial begin
        $display("Hello at 0ns");
        #1ns;
        $display("Hello at 1ns");
    end

    // Print at every 1ns
    always #1ns begin
        $display("Hello Repeated");
    end

    // Print at every clk edge either 0 to 1 or 1 to 0
    always @(clk) begin
        $display("Hello Edge");
    end

    // Print at every posedge of clk i.e. 0 to 1  (Rising Edge)
    always @(posedge clk) begin
        $display("Hello Rising");
    end

    // Print at every negedge of clk i.e. 1 to 0  (Falling Edge)
    always @(negedge clk) begin
        $display("Hello Falling");
    end

endmodule