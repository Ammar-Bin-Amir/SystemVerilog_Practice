class cNumber;
    rand int i;
    function void print();
        $display("i = %0d",i);
    endfunction
endclass

class cNumberOdd extends cNumber;
    constraint cst {i % 2 == 1;}
endclass

class cNumberEven extends cNumber;
    constraint cst {i % 2 == 1;}
endclass

class ecNumberHex extends cNumber;
    function void print();
        $display("i = %0h",i);
    endfunction
endclass

class cNumber;
    rand int i;
    virtual function void print();
        $display("i = %0d",i);
    endfunction
endclass

class ecNumberHex extends cNumber;
    virtual function void print();
        $display("i = %0h",i);
    endfunction
endclass

class cNumber;
    rand int i;
endclass

class ecNumber extends cNumber;
    constraint cst {i % 2 == 1;}
    virtual function void print();
        $display("i = %0h",i);
    endfunction
endclass

module class_polymorphism;
    
    cNumber cn;
    cNumberOdd cno;
    cNumberEven cne;

    task run (cNumber arg);
        arg.randomized(); arg.print();
    endtask

    initial begin
        cn = new(); cno = new(); cne = new();
        // Without Task
        cn.randomized(); cn.print();
        cno.randomized(); cno.print();
        cne.randomized(); cne.print();
        // With Task
        run(cn);
        run(cno);
        run(cne);
    end

    ecNumberHex cnh;

    // Without Virtual
    initial begin
        cn = new(); cnh = new();
        // Without Task
        cn.randomized(); cn.print();        // i = 12
        cnh.randomized(); cno.print();      // i = c
        // With Task
        run(cn);        // i = 12
        run(cno);       // i = 12
    end

    // With Virtual
    initial begin
        cn = new(); cnh = new();
        // Without Task
        cn.randomized(); cn.print();        // i = 12
        cnh.randomized(); cno.print();      // i = c
        // With Task
        run(cn);        // i = 12
        run(cno);       // i = c
    end

    // Restrictions

    cNumber cn;
    ecNumber ecn;
    cNumber p;
    ecNumber ep;

    initial begin
        cn = new(); ecn = new();
        p = cn;
        p = ecn;    // Pointer cannot access extended class members
        ep = cn;    // Pointer cannot access base class members
        ep = ecn;
        p = ecn;
        ep = p;
        // same as ep = ecn;
        //// INCOMPATIBLE use $cast(ep,p); to perform assignment
    end

endmodule