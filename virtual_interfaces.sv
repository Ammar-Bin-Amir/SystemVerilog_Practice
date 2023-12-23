interface intf;
    
    wire [2:0] w;

endinterface

module dut (
    intf i
);

    always @(i.w) begin
        $display("%0b",i.w);
    end
    
endmodule

class test;

    virtual intf i;

    rand logic [2:0] data;

    constraint cst {data < 5};

    virtual task run();
        this.randomize();
        i.w = data;
    endtask

endclass

module virtual_interfaces;

    intf i();

    dut dut0(i);
    
    test test0;

    initial begin
        test0 = new();
        test0.i = i;
        test0.run();
    end
    
endmodule