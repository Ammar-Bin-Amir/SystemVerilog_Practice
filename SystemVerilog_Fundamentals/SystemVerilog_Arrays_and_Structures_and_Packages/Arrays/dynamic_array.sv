module dynamic_array (
    input wire clk
);
    
    logic array_d[];
    logic data_d[];
    logic x_d[], y_d[] = '{0,1,2}, s_f[10];

    always_comb begin
        array_d = new[8];
        // Out Of Bound (OOB) Write
        array_d[50] = 1;
        // Out Of Bound (OOB) Read
        $display("array_d[50] = %b, array_d[100] = %b", array_d[50], array_d[100]);
        // Construction
        $display("size of data = %0d", data_d.size());
        data_d = new[2];
        $display("size of data = %0d", data_d.size());
        data_d = new[4];
        foreach (data_d[i]) data_d[i] = i;
        $display("size of data = %0d", data_d.size());
        foreach (data_d[i]) $display("data_d = %p", data_d);
        data_d = new[8](data_d);
        $display("size of data = %0d", data_d.size());
        foreach (data_d[i]) $display("data_d = %p", data_d);
        // Assignment
        $display("x_d size %0d", x_d.size());   // 0
        x_d = y_d;
        $display("x_d size %0d", x_d.size());   // 3
        x_d = s_f;
        $display("x_d size %0d", x_d.size());   // 100
        x_d = y_d;
        $display("x_d size %0d", x_d.size());   // 3
        x_d.delete();
        $display("x_d size %0d", x_d.size());   // 0
    end

endmodule