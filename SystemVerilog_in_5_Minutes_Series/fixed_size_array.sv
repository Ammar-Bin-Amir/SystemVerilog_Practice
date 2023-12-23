module fixed_size_array;
    
    // With Array
    bit b0, b1;

    initial begin
        b0 = 1'b0;
        b1 = 1'b1;
    end

    // Without Array
    bit b[1:0];

    // Method 1
    initial begin
        b[0] = 1'b0;
        b[1] = 1'b1;
    end

    // Method 2
    initial begin
        b = '{1'b1,1'b0};
    end

    // Method 3-1
    initial begin
        for (int i = 0; i < 2 ; i++) begin
            b[i] = i;
        end
    end

    // Method 3-2
    initial begin
        for (int i = 0; i < $size(b) ; i++) begin
            b[i] = i;
        end
    end

    // Method 3-3
    initial begin
        foreach (b[i]) begin
            b[i] = i; 
        end
    end

    // Unpacked Array
    bit b_unpacked[2:0];    // [2] [1] [0]
    bit [2:0] b_packed;     // [2][1][0]

    //// Only single bit vector can be packed i.e. bit, logic, reg, wire

    // Little Endian and Big Endian

    bit b_le[2:0];  // Little Endian Style
    bit b_be[0:2];  // Big Endian Style
    bit b_cs[3];    // C Program Style, same as Big Endian

    initial begin
        b_be[1] = b_le[1];
        bcs = b_be;
        b[1:0] = b_le[2:1];
        b_le = be;
        // b_le[2] = b_be[0]
        // b_le[1] = b_be[1]
        // b_le[0] = b_be[2]
    end

    // Multi-dimensional Array

    bit b_multi_unpacked[1:0][7:0];
    bit [7:0] b_multi_mixed;
    bit [1:0][7:0] b_packed;

endmodule