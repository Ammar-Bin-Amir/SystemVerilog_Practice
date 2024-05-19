module strings;
    
    string test_name_s, file_name_s;

    always_comb begin
        file_name_s = "strings";
        test_name_s = {file_name_s,".sv"};
        $display("The file name is %s", test_name_s);
        $display("The number of characters are %0d", test_name_s.len());
        $display("The 6th character is %s", test_name_s.getc(6));
        test_name_s.putc(6,"x");
        $display("The 6th character s is replaced by x %s", test_name_s);
        $display("The sub string is %s", test_name_s.substr(2,5));
        $display("Upper Case: %s", test_name_s.toupper());
        $display("Lower Case: %s", test_name_s.tolower());
    end

endmodule