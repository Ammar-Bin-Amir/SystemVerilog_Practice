class cLife;
    int life = 3;
    function void crash();
        life = life - 1;
        if (life == 0) $display("over");
    endfunction

    // Abstraction
    // local members are not accessible by caller
    local int life = 3;
    function int getLife();
        return life;
    endfunction
endclass

class cFibonacciNumber;
    // Abstraction
    local int last1 = 1, last2 = 2, result;
    function int getNumber(int id);
        if (id == 0) result = last2;
        else if (id == 1) result = last1;
        else begin
            for (int = 2; i <= id; i++) begin
                result = last2 + last1;
                last2 = last1;
                last1 = result;
            end
        end
        return result;
    endfunction
endclass

class cNumber;
    int i;
    // Dynamic Member
    int count = 0;
    // Static Member
    static int count = 0;
    function new();
        count++;
    endfunction
endclass

class cNum;
    int id;
    // Static Member
    static bit debug = 0;
    function new(int arg);
        id = arg;
        if (debug) $display("%0d",id);
    endfunction
endclass

class cN;
    int i;
    static bit count;
endclass

class cString;
    string s;
    static bit count;
endclass

class cthis;
    int id;
    function new(int id);
        // this refers to class member
        this.id = id;        
    endfunction
endclass

module class_members_attributes;
    
    cLife cl;

    // the variable life can be called and changed
    initial begin
        cl = new();
        cl.life = 999;
        cl.crash();
        cl.crash();
        $display("%0d",cl.life);
    end

    // the variable life cannot be called and changed but can be known
    initial begin
        cl = new();
        cl.life = 999;
        cl.crash();
        cl.crash();
        $display("%0d",cl.getLife);
    end

    cFibonacciNumber cfn;

    initial begin
        cfg = new();
        $display("%0d",cfn.getNumber(0));   // 1
        $display("%0d",cfn.getNumber(1));   // 1
        $display("%0d",cfn.getNumber(10));  // 89
    end
    
    cNumber cn0;
    cNumber cn1;
    cNumber cn2;

    // dynamic, each handle gets separate value of counter
    initial begin
        cn0 = new();    // cn0.count = 1
        cn1 = new();    // cn1.count = 1
        cn2 = new();    // cn2.count = 1
    end

    // static, each handle gets collective value of counter
    initial begin
        cn0 = new();    // cn0.count = 1
        cn1 = new();    // cn0.count = 2 cn1.count = 2 
        cn2 = new();    // cn0.count = 3 cn1.count = 3 cn2.count = 3
    end

    cNum cnum0, cnum1, cnum2;

    initial begin
        // Handle can be class without initialization
        cNumber::debug = 1;
        cnum0 = new(0);
        cnum1 = new(1);
        cnum2 = new(2);
    end

    cN c0, c1;
    cString cs0, cs1, cs2;

    initial begin
        c0 = new(); c1 = new();
        cs0 = new(); cs1 = new(); cs2 = new();
        cN::count = 2;      // c0 and c1
        cString::count = 3; // cs0, cs1 and cs2
    end

    cthis ct;

    initial begin
        ct = new(0);
    end

endmodule