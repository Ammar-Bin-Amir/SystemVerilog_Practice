module numerical_variables;
    
    byte byte0;         // 2 states variable initialize as 8'b0000_0000
    logic [7:0] l8;     // 4 states variable initialize as 8'bxxxx_xxxx

    initial begin
        byte0 = l8;

        // 2 states comparison; 0, 1
        if (byte0 == l8) $display("byte0 is equal to l8");      // True

        // 4 states comparison; 0, 1, x, z
        if (byte0 === l8) $display("byte0 is equal to l8");     // False

        // Value not assigned
        if ($isunknown(l8)) $display("l8 is unknown");  // True
        l8 = 8'b0000_0000;
        if ($isunknown(l8)) $display("l8 is unknown");  // False

        l8 = 255;
        byte0 = -1;

        // Signed (byte) and Unsigned (logic)
        if (l8 == byte0) $display("same");              // 255 = -1
        $display("byte0 = %0d, %0b", byte0, byte0);     // -1, 1111_1111
        $display("l8 = %0d, %0b", l8, l8);              // 255, 1111_1111

        // Signed range (-128 to 127)
        // counter will count till 127 then start from -128
        for (byte0 = 0; 0 < 200; byte0++) begin
            $display("byte0 = %0d", byte0);
        end
        $display("count finished");
    end

    // Unsigned range (0 to 255)
    byte unsigned byte1;

    // Type define
    typedef byte unsigned ubyte_t;

    byte unsigned ubyte0;
    byte unsigned ubyte1;

    ubyte_t ubyte00;
    ubyte_t ubyte11;

endmodule