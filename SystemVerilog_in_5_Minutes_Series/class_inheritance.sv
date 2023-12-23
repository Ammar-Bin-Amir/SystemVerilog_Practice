class cNumber;
    rand int i;
    constraint cst {
        i > 0;
    }
    function void print();
        $display("i=%0d",i);
    endfunction
    // i    cst     print()
endclass

class ecNumber extends cNumber;
    // i    cst     print()
    // Adding new variable
    rand bit b;
    // i    b       cst     print()
    // Modifying existing variable
    rand byte i;
    // i    b       i       cst     print()
    // Adding constraint
    constraint cstn {
        i < 10;
    }
    // i    b       i       cst     cstn        print()
    // Modifying existing constraint
    constraint cst {
        i < 10;
    }
    // i    b       i       cst     cstn        print()
    // Adding new function
    function void check();
        if (i < 0) $error("i less than 0");
    endfunction
    // i    b       i       cst     cstn        print()     check()
    function void print();
        if (i < 0) $error("i less than 0");
    endfunction
    // i    b       i       cst     cstn        print()     check()     print()
    // Adding functionality
    function void print();
        super.print();  // allowing calling base function inside the new modified function
        if (i < 0) $error("i less than 0");
    endfunction
endclass

module class_inheritance;
    
    cNumber = cn;

    initial begin
        cn = new();
        cn.i = 1;
        cn.cst.constraint_mode(1);
        cn.randomize();
        cn.print();
    end

    ecNumber cn;

    initial begin
        cn = new();
        cn.i = 1;
        cn.cst.constraint_mode(1);
        cn.randomize();
        cn.print();
        // calling new variable
        cn.b = 0;
        // calling modified variable, byte would be accessed, both of them are randomized, constraint would work for int
        cn.i = 1;
        // calling new constraint, both of them would be randomized, 0 < i < 10
        cn.cst.constraint_mode(1);
        // calling modified constraint, older one would be replace, i < 10
        cn.cst.constraint_mode(1);
        // calling new function
        cn.check();
        // calling modified function, base class function would not be accessed
        cn.print();
    end

endmodule