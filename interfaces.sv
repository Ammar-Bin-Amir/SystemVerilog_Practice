// Without Interface

module dut_tx (
    input bit clk,
    output bit [2:0] a
);

    always @(posedge clk) begin
        a <= $random;
    end
    
endmodule

module dut_rx (
    input bit clk,
    input bit [2:0] a
);

    always @(posedge clk) begin
        $display("%0b",a);
    end
    
endmodule

module interfaces;
    
    bit clk;

    always #5ns clk = ~clk;

    bit [2:0] a;

    dut_tx tx(clk, a);
    dut_rx rx(clk, a);

endmodule

// With Interface

interface intf (
    input bit clk
);

    bit [2:0] a;

endinterface

module dut_tx (
    input bit clk,
    output bit [2:0] a
);

    always @(posedge clk) begin
        a <= $random;
    end
    
endmodule

module dut_rx (
    input bit clk,
    input bit [2:0] a
);

    always @(posedge clk) begin
        $display("%0b",a);
    end
    
endmodule

module interfaces;
    
    bit clk;

    always #5ns clk = ~clk;

    // Interface Instant
    intf i(clk);
    // Modules Instants by Interface
    dut_tx tx(i.clk, i.a);
    dut_rx rx(i.clk, i.a);

endmodule

// With Interface Module Ports

interface intf (
    input bit clk
);

    bit [2:0] a;

endinterface

module dut_tx (
    // Replacing module ports
    intf i;
);

    // Calling replaced module ports
    always @(posedge i.clk) begin
        i.a <= $random;
    end
    
endmodule

module dut_rx (
    // Replacing module ports
    intf i;
);

    // Calling replaced module ports
    always @(posedge i.clk) begin
        $display("%0b",i.a);
    end
    
endmodule

module interfaces;
    
    bit clk;

    always #5ns clk = ~clk;

    intf i(clk);
    // Simplified Modules Instants by Interface
    dut_tx tx(i);
    dut_rx rx(i);

endmodule

// With Interface Module Ports as Modports

interface intf (
    input bit clk
);

    bit [2:0] a;

    modport tx (
    input clk,
    output a
    );

    modport rx (
    input clk,
    input a
    );

endinterface

module dut_tx (
    // Replacing module ports with modports
    intf.tx i;
);

    // Calling replaced module ports with modports
    always @(posedge i.clk) begin
        i.a <= $random;
    end
    
endmodule

module dut_rx (
    // Replacing module ports with modports
    intf.rx i;
);

    // Calling replaced module ports with modports
    always @(posedge i.clk) begin
        $display("%0b",i.a);
    end
    
endmodule

module interfaces;
    
    bit clk;

    always #5ns clk = ~clk;

    intf i(clk);
    // Simplified Modules Instants by Interface Modports
    dut_tx tx(i.tx);
    dut_rx rx(i.rx);

endmodule

// With Interface Extra Control Connection

interface intf (
    input bit clk
);

    bit [2:0] a;

    // Introducing Clocking
    clocking txc @(posedge clk);
        default input #1ns output #1ns;
        output a;
    endclocking

    // Modifying w.r.t. Clocking
    modport tx (
    clocking txc
    );

    modport rx (
    input clk,
    input a
    );

endinterface

module dut_tx (
    intf.tx i;
);

    // Modifying w.r.t. Clocking
    always @(i.txc) begin
        i.txa <= $random;
    end
    
endmodule

module dut_rx (
    intf.rx i;
);

    always @(posedge i.clk) begin
        $display("%0b",i.a);
    end
    
endmodule

module interfaces;
    
    bit clk;

    always #5ns clk = ~clk;

    intf i(clk);

    dut_tx tx(i.tx);
    dut_rx rx(i.rx);

endmodule