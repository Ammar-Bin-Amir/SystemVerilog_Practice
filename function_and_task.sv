module function_and_task;
    
    // Without Function
    int a, b, result;

    initial begin
        a = 1; b = 2; result = a + b;
        a = 3; b = 4; result = a + b;
        a = 5; b = 6; result = a + b;
    end

    // With Function
    int a, b, result;

    function void calculate();
        result = a + b;
        $display("%d",result);
    endfunction

    initial begin
        a = 1; b = 2; calculate();
        a = 3; b = 4; calculate();
        a = 5; b = 6; calculate();
    end

    // Function and Arguments
    int result;

    function void calculate(int a, b);
        result = a + b;
    endfunction

    initial begin
        calculate(1,2);
        calculate(3,4);
        calculate(5,6);
    end

    // Function and Return Value
    int result, c;

    function int calculate (int a, b);
        return (a + b);
    endfunction

    initial begin
        result = calculate(1,2);
        result = calculate(3,4);
        c = calculate(5,6);
    end

    // No Automatic Syntax; variable as hardware signal, define from start
    function void increment();
        int a;
        a = a + 1;
    endfunction

    initial begin
        increment();    // a = 1
        increment();    // a = 2
        increment();    // a = 3
    end

    // Automatic Syntax; variable as software variable, created when called and destroyed afterwards
    function automatic void increment();
        int a;
        a = a + 1;
    endfunction

    initial begin
        increment();    // a = 1
        increment();    // a = 1
        increment();    // a = 1
    end

    // Task
    int result;

    task calculate(int a, b);
        #1; result = (a + b);
    endtask

    initial begin
        calculate(1,2);
        calculate(3,4);
        calculate(5,6);
    end

    // Calling Task / Function

    function void myFunction();
        $display("Function!");
    endfunction

    task myTask();
        $display("Task!");
    endtask

    function void myFunction2();
        myTask();                   // ERROR
    endfunction

    task myTask2();
        myFunction();
    endtask

    // Other Possibilities

    /*
    function void fSimple (a , b);      // By default logic
    function void fSimple (int a , b);
    function void fSimple (int a , int b);
    function void fSimple (int a , int b = 1);

    fSimple(0,1);               // a = 0    b = 1
    fSimple(.a(0),.b(1));       // a = 0    b = 1
    fSimple(0);                 // a = 0    b = 1 (default)
    fSimple(.a(0));             // a = 0    b = 1 (default)
    */

endmodule