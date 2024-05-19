module concatenate_operators (
    input logic [3:0] data,
    output logic [3:0] rotate_left, rotate_right, copy_by_2, copy_by_2_and_shift_left, copy_by_2_and_shift_right
);
    
    always_comb begin
        // Rotation
        rotate_left = {data[2:0],data[3]};
        rotate_right = {data[0],data[3:1]};
        // Copy Bits
        copy_by_2 = {2{data[1:0]}};
        // Copy Bits and Shift Left
        copy_by_2_and_shift_left = {<<2{data[1:0]}};
        // Copy Bits and Shift Right
        copy_by_2_and_shift_right = {>>2{data[1:0]}};
    end

endmodule