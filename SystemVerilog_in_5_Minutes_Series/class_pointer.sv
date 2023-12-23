class cNumber;
    int i;
endclass

class cParent;
    int x;
    cNumber cn;
    function new();
        cn = new();
    endfunction
endclass

module class_pointer;
    
    int a, b;
    cNumber ca, cb;

    // ca and cb are pointers
    // i is object

    initial begin
        a = 1;      // a = 1
        b = a;      // b = 1
        ca = new(); cb = new();     // ca = 0   cb = 0
        ca.i = 1;       // ca ---> i = 1
        cb.i = ca.i;    // cb ---> i = 1
        cb = ca;        // cb ---> is equal to ca --->
        // unused memory (cb.i) would be released known as Automatic Garbage Collection
        //// cb = ca means cb copies whatever ca is pointing
    end

    cNumber a;
    cNumber q[$];

    initial begin
        a = new();              // a ---> i = 0
        for (int i = 0; i < 3 ; i++) begin
            a.i = i;            // a ---> i = 0             a ---> i = 1            a ---> i = 2
            q.push_back(a);     // q[0] ---> a ---> i = 0   q[1] ---> a ---> i = 1  q[2] ---> a ---> i = 2
        end
        // array of 3 pointers but only one object
        //// WRONG way of using array with pointers
    end

    initial begin
        //// WRONG way of using array with pointers
        for (int i = 0; i < 3 ; i++) begin
            a = new();          // a ---> i = 0             a ---> i = 0            a ---> i = 0
            a.i = i;            // a ---> i = 0             a ---> i = 1            a ---> i = 2
            q.push_back(a);     // q[0] ---> a ---> i = 0   q[1] ---> a ---> i = 1  q[2] ---> a ---> i = 2
        end
        // array of 3 pointers and 3 objects
    end

    // Input Class Argument

    task automatic myTask (input cNumber arg);
        arg.i = 2;
        arg = new();
        arg.i = 3;
    endtask

    cNumber cn;

    initial begin
        cn = new();     // cn ---> i = 0
        cn.i = 1;       // cn ---> i = 1             cn ---> i = 2       cn ---> i = 2
        myTask(cn);     // arg ---> i cn ---> = 2    arg ---> i = 0      arg ---> i = 3
        //// NOT a good practice passing handle as argument and creating argument a new object
    end

    // Output Class Argument

    task automatic myTask (output cNumber arg);
        arg.i = 2;      // INVALID
        arg = new();
        arg.i = 3;
    endtask

    cNumber cn;

    initial begin
        cn = new();     // cn ---> i = 0
        cn.i = 1;       // cn ---> i = 1       cn ---> i = 0 (released from memory)
        myTask(cn);     // arg ---> i = 0      arg ---> cn ---> i = 3
        //// NOT a good practice passing handle as argument and creating argument a new object
    end

    // Reference Class Argument

    task automatic myTask (output cNumber arg);
        arg.i = 2;      // INVALID
        arg = new();
        arg.i = 3;
    endtask

    cNumber cn;

    initial begin
        cn = new();     // cn ---> i = 0
        cn.i = 1;       // cn ---> i = 1            cn ---> i = 2       cn ---> i = 0 (released from memory)
        myTask(cn);     // arg ---> i cn ---> = 2   arg ---> i = 0      arg ---> cn ---> i = 3
        //// NOT a good practice passing handle as argument and creating argument a new object
    end

    cParent ca, cb;

    initial begin
        ca = new();         // ca ---> cn ---> i = 0    ca ---> x = 0
        cb = new();         // cb ---> cn ---> i = 0    cb ---> x = 0
        cb.x = ca.x         // ca ---> x = cb ---> x
        // Shallow Copy
        cb.cn = ca.cn       // cb ---> cn ---> ca ---> cn ---> i
        // Deep Copy
        cb.cn.i = ca.cn.i   // cb ---> cn ---> i = ca ---> cn ---> i
    end

endmodule