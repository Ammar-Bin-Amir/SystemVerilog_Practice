module string;
    
    initial begin
        $display("Hello World!");
    end

    // String
    
    string sHello = "Hello World";

    initial begin
        $display(sHello);
    end

    // Formatter

    logic [7:0] i = 4'd12;

    initial begin
        $display("i=%d", i);                // i= 12, with spaces
        $display("i=%0d", i);               // i=12, without spaces
        $display("i=%0b", i);               // i=1100
        $display("i=%0h", i);               // i=c
        $display("i=%0d,%0b,%0h", i,i,i);   // i=12,1100,c
    end

    // String Concatenation

    string name = "John";
    string name2 = {name,name};     // "JohnJohn"

    initial begin
        $display("Hello %s",name);                  // Hello John
        $display("Hello %s",name);                  // Hello JohnJohn
        $display("Hello %s",{name," ",name2});      // Hello John JohnJohn
    end

    // String Comparison

    string myName = "Leo";
    string yourName = "John";

    initial begin
        if (myName == yourName) begin
            $display("%s is equal to %s",myName,yourName);
        end
    end

    // String Built-In Functions

    initial begin
        $display("Hello %s,"name);                  // John
        $display("Hello %s,"name.toupper());        // JOHN
        $display("Hello %s,"name.tolower());        // john
        $display("Hello %s,"name.getc(0));          // J, index of character
        $display("Hello %s,"name.substr(1,2));      // oh, starting position and ending position
    end

    // String and Number Conversion

    string str = "1234";
    int i;

    initial begin
        i = str.len();      // str="1234" , i=4
        i = str.atoi();     // str="1234" , i=1234
        i = 5678;           // str="1234" , i=5678
        str.itoa(i);        // str="5678" , i=5678
    end

endmodule