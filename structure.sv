module structure;
    
    typedef struct packed {
        bit b;
        byte byt;
        int i;
    } myStruct;

    myStruct s0, s1;

    initial begin
        // Structure's Elements Accessing
        s0.b = 1'b1;
        s0.byt = 8'd7;
        s0.i = 32'habcd        

        // Structure's Variable Assignment
        s1 = s0;
    end

    // Without Structure
    bit [7:0] red0, green0, blue0;
    bit [7:0] red1, green1, blue1;
    bit [7:0] red2, green2, blue2;

    initial begin
        red0 = 8'h00;
        green0 = 8'h0f;
        blue0 = 8'ff;

        red1 = red0;
        green1 = green0;
        blue1 = blue0;

        red2 = red0;
        green2 = green0;
        blue2 = blue0;
    end

    // With Structure
    struct {
        bit [7:0] red, green, blue;
    } pixel0, pixel1, pixel2;

    initial begin
        pixel0.red = 8'h00;
        pixel0.green = 8'h0f;
        pixel0.blue = 8'hff;

        pixel1 = pixel0;
        pixel2 = pixel0;
    end

    // Unpacked Structure
    typedef struct {
        bit b0;
        int i0;
    } s0;

    /*
                s0
    b
    i   i   i   i   ...     i
    0   1   2   3   ...     31
    */

    initial begin
        $display("%0b",s0.b0);  // 0
        $display("%0b",s0.i0);  // 0
        $display("%0p",s0);     // {b=0,i=0}
        $display("%0b",s0);     // ERROR
    end

    // Packed Structure
    typedef struct packed {
        bit b1;
        int i1;
    } s1;

    /*
                    s1
    b   i   i   i   ...     i       i
    0   1   2   3   ...     31      32
    */

    initial begin
        $display("%0b",s1.b1);  // 0
        $display("%0b",s1.i1);  // 0
        $display("%0p",s1);     // {b=0,i=0}
        $display("%0b",s1);     // 0
    end

    //// Packed and Unpacked Structures cannot be assigned with each other

endmodule