module recursive_functions (
    input int n
);
    
    function int factorial_static (input int n);
        if (n < 2) return 1;
        else return n * factorial_static(n-1);
    endfunction

    initial $display("factorial_static(3) = %0d",factorial_static(3));

    function automatic int factorial_automatic (input int n);
        if (n < 2) return 1;
        else return n * factorial_automatic(n-1);
    endfunction

    initial $display("factorial_automatic(3) = %0d",factorial_automatic(3));

endmodule