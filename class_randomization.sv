class cNumber;
    bit b;
    byte by;
    // Randomized Members
    rand bit b;
    rand byte by;
    // Randomized Members without Repitition
    randc bit b;
    randc byte by;
    // Constraints
    rand bit b;
    rand byte by;
    constraint cst {
        by > 0;
        by < 3;
        //// INCORRECT 0 < by < 3;
        by == 1;
        by !=2
        //// INVALID by == 1; by != 1;
        by inside {0,1,2,3};
        by inside {[0:3]};
        // bit and byte both get same values if zero
        if (b == 0) {by == 0};
        else {by inside {1,2,3};}
        // byte gets random value first then bit
        solve by before b;
    }
    // Pre / Post Randomization
    bit en_x;
    function void pre_randomize();
        $display("pre: b=%0d, by=%0d",b,by);
    endfunction
    function void post_randomize();
        if (en_x) by = 8'bx;
        $display("pre: b=%0d, by=%0d",b,by);
    endfunction
endclass

module class_randomization;
    
    byte b;

    initial begin
        // Directed Test
        b = 0;
        b = 1;
        b = 2;
        // Randomized Test
        repeat (3) begin
            b = $random();              // can be any number positive and negative
            b = $random_range(50,1);    // can be any number from 1 to 50
        end
    end

    cNumber cn;

    initial begin
        cn = new();
        repeat (6) begin
            cn.b = $random();
            cn.by = $random();
        end
        //// Troublesome, byte might not get values
    end

    // Randomized Numbers

    initial begin
        cn = new();
        repeat (6) begin
            cn.randomize();
        end
        //// Both bit and byte would get random values
    end

    // Randomized Members without Repitition

    initial begin
        cn = new();
        repeat (6) begin
            cn.randomize();
        end
        //// Both bit and byte would get random values such as the values would not be repeated until all values covered
    end

    // Constraints

    initial begin
        cn = new();
        repeat (6) begin
            cn.randomize();
        end
        //// In this case byte would always be one
    end

    // Pre / Post Randomization

    initial begin
        cn = new();
        repeat (6) begin
            cn.randomize();
            // cn.b = 1 [0 or 1]
            // cn.b = 8 [-128:127]
            cn.en_x = 1'b1;
            cn.randomize();
            // cn.b = 0 [0 or 1]
            // cn.b = x [-128:127]
        end
        
    end

endmodule