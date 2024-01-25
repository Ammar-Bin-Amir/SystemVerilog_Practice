module array_types (
    input wire clk,
    input wire en
);
    
    // Vector
    logic [3:0] v;

    /*
    
    || v[3] || v[2] || v[1] || v[0] ||
    
    */

    // Array
    logic a [0:3];

    /*
    
    || a[0] ||
    || a[1] ||
    || a[2] ||
    || a[3] ||
    
    */

    // Multi-dimensional Array (Packed)
    logic [3:0][3:0] mp;

    /*

    || m[3][3] || m[3][2] || m[3][1] || m[3][0] || m[2][3] || m[2][2] || m[2][1] || m[2][0] || m[1][3] || m[1][2] || m[1][1] || m[1][0] || m[0][3] || m[0][2] || m[0][1] || m[0][0] ||

    */

    // Multi-dimensional Array (Unpacked)
    logic mu [4][4];

    /*
    
    || m[0][0] ||
    || m[0][1] ||
    || m[0][2] ||
    || m[0][3] ||
    || m[1][0] ||
    || m[1][1] ||
    || m[1][2] ||
    || m[1][3] ||
    || m[2][0] ||
    || m[2][1] ||
    || m[2][2] ||
    || m[2][3] ||
    || m[3][0] ||
    || m[3][1] ||
    || m[3][2] ||
    || m[3][3] ||
    
    */

    // Mixed Array
    logic [1:0] mix_a [2];

    /*

    || mix_a[0][1] || mix_a[0][0] ||
    || mix_a[1][1] || mix_a[1][0] ||

    */

    // Multi-dimensional Mixed Array
    logic [1:0][2:0] mix_ma [3][4];

    /*

    || mix_ma[0][0][1][2] || mix_ma[0][0][1][1] || mix_ma[0][0][1][0] || mix_ma[0][0][0][2] || mix_ma[0][0][0][1] || mix_ma[0][0][0][0] ||
    || mix_ma[0][1][1][2] || mix_ma[0][1][1][1] || mix_ma[0][1][1][0] || mix_ma[0][1][0][2] || mix_ma[0][1][0][1] || mix_ma[0][1][0][0] ||
    || mix_ma[0][2][1][2] || mix_ma[0][2][1][1] || mix_ma[0][2][1][0] || mix_ma[0][2][0][2] || mix_ma[0][2][0][1] || mix_ma[0][2][0][0] ||
    || mix_ma[0][3][1][2] || mix_ma[0][3][1][1] || mix_ma[0][3][1][0] || mix_ma[0][3][0][2] || mix_ma[0][3][0][1] || mix_ma[0][3][0][0] ||
    || mix_ma[1][0][1][2] || mix_ma[1][0][1][1] || mix_ma[1][0][1][0] || mix_ma[1][0][0][2] || mix_ma[1][0][0][1] || mix_ma[1][0][0][0] ||
    || mix_ma[1][1][1][2] || mix_ma[1][1][1][1] || mix_ma[1][1][1][0] || mix_ma[1][1][0][2] || mix_ma[1][1][0][1] || mix_ma[1][1][0][0] ||
    || mix_ma[1][2][1][2] || mix_ma[1][2][1][1] || mix_ma[1][2][1][0] || mix_ma[1][2][0][2] || mix_ma[1][2][0][1] || mix_ma[1][2][0][0] ||
    || mix_ma[1][3][1][2] || mix_ma[1][3][1][1] || mix_ma[1][3][1][0] || mix_ma[1][3][0][2] || mix_ma[1][3][0][1] || mix_ma[1][3][0][0] ||
    || mix_ma[2][0][1][2] || mix_ma[2][0][1][1] || mix_ma[2][0][1][0] || mix_ma[2][0][0][2] || mix_ma[2][0][0][1] || mix_ma[2][0][0][0] ||
    || mix_ma[2][1][1][2] || mix_ma[2][1][1][1] || mix_ma[2][1][1][0] || mix_ma[2][1][0][2] || mix_ma[2][1][0][1] || mix_ma[2][1][0][0] ||
    || mix_ma[2][2][1][2] || mix_ma[2][2][1][1] || mix_ma[2][2][1][0] || mix_ma[2][2][0][2] || mix_ma[2][2][0][1] || mix_ma[2][2][0][0] ||
    || mix_ma[2][3][1][2] || mix_ma[2][3][1][1] || mix_ma[2][3][1][0] || mix_ma[2][3][0][2] || mix_ma[2][3][0][1] || mix_ma[2][3][0][0] ||

    */
    
    always_ff @(posedge clk) begin
        v <= 0;
        for (integer i = 0; i < 4; i++) begin
            a[i] <= 0;
        end
        mp <= 0;
        for (integer i = 0; i < 4; i++) begin
            for (integer j = 0; j < 4 ; j++) begin
                mu[i][j] <= 0;
            end
        end
        for (integer i = 0; i < 4; i++) begin
            mix_a[i] <= 0;
        end
        for (integer i = 0; i < 3; i++) begin
            for (integer j = 0; j < 4 ; j++) begin
                mix_ma[i][j] <= 0;
            end
        end
        if (en) begin
            v <= v + 1;
            a[1] <= a[1] + 1;
            mp <= mp + 1;
            mu[2][3] <= mu[2][3] + 1;
            mix_a[0] <= mix_a[0] + 1;
            mix_ma[3][4] <= mix_ma[3][4] + 1;
        end
    end

    /*
    
    Multi-dimensional Array as defined in lecture;
    logic m[4][4];

    || m[0][0] || m[0][1] || m[0][2] || m[0][3] ||
    || m[1][0] || m[1][1] || m[1][2] || m[1][3] ||
    || m[2][0] || m[2][1] || m[2][2] || m[2][3] ||
    || m[3][0] || m[3][1] || m[3][2] || m[3][3] ||
    
    */

endmodule