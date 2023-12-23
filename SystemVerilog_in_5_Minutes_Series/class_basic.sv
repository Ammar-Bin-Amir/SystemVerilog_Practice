/*
Encapsulation: Grouping of variables and functions in one "reasonable" bundle, as a class
*/

class cStatisticsCalculator;
    // Encapsulation
    int q[$];
    function int getMean();
        return (q.sum()/q.size());
    endfunction
endclass

class cNumber;
    // Encapsulation
    byte b;
    // b = 1
    function new();
        b = 1;
    endfunction
    // b = argB
    function new(byte argB);
        b = argB;
    endfunction
endclass

class ca;
    byte b = 10;
endclass

class ca;
    byte b = 20;
endclass

module class_basic (
    input bit sel,
    output byte result
);
    
    cStatisticsCalculator sc;   // sc is class variable / handle
    
    //// Handle is null at first (does not exists). It needs to be initialized before it can be used.

    initial begin
        sc = new();             // calling handle
        sc.q.push_back(1);
        sc.q.push_back(3);
        $display("%0d",sc.getMean());
    end

    cNumber cn;

    initial begin
        cn = new();     // cn.b = 0
        cn = new();     // cn.b = 1
        cn = new();     // cn.b = 10
        cn.b = 20;
    end

    // Without Dynamic Initialization
    // a and b consumes 2 bytes of memory no matter which one is used

    byte a = 10;
    byte b = 10;

    initial begin
        if (sel == 1'b0) begin
            result = a;
        end
        else begin
            result = b;
        end
    end

    // With Dynamic Initialization
    // either a and b is used only 1 byte of memory is consumed

    ca a;
    cb b;

    initial begin
        if (sel == 1'b0) begin
            a = new(); result = a.b;
        end
        else begin
            a = new(); result = b.b;
        end
    end

    initial begin
        // null is used to release memory location
        #10ns a = new(); result = a.b;
        a = null;
        #10ns b = new(); result = b.b;
        b = null;
    end

endmodule