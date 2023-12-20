module function_and_task_argument;
    
    // Simple Task + Argument
    task myTask (input logic a);    // By default it's input
        $display("a=%0d",a);
    endtask

    initial begin
        myTask(1);
    end

    // Argument's Types
    int b;

    initial begin
        b = 1;
        myTask(b);
    end

    // Input Argument
    task automatic myTask (input logic a);
        #1 a++;
        #1 a++;
    endtask

    /*
        b   a   ACTION
        --------------
        0       b declaration
        1       b = 1
        1   0   calling task, a is created   1   1   calling task, argument (a) take input value (b)
        1   2   inside myTask #1
        1   3   inside myTask #2
        1       exit myTask
    */

    // Output Argument
    task automatic myTask (output logic a);
        #1 a++;
        #1 a++;
    endtask

    /*
        b   a   ACTION
        --------------
        0       b declaration
        1       b = 1
        1   0   calling task, a is created
        1   1   inside myTask #1
        1   2   inside myTask #2
        2       exit myTask, argument (a) output value to back to caller variable (b)
    */

    //Inout Argument
    task automatic myTask (inout logic a);
        #1 a++;
        #1 a++;
    endtask

    /*
        b   a   ACTION
        --------------
        0       b declaration
        1       b = 1
        1   0   calling task, a is created   1   1   calling task, argument (a) take input value (b)
        1   2   inside myTask #1
        1   3   inside myTask #2
        3       exit myTask, argument (a) output value to back to caller variable (b)
    */

    //Reference Argument
    task automatic myTask (ref logic a);
        #1 a++;
        #1 a++;
    endtask

    /*
        b   a   ACTION
        --------------
        0       b declaration
        1       b = 1
        1<->1   calling task, variable (b) is passed as reference argument
        2<->2   inside myTask #1
        3<->3   inside myTask #2
        3       exit myTask, argument (a) and caller variable (b) are same
    */

endmodule