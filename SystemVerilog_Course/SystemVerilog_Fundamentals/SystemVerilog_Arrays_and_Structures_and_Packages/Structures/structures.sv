module structures;
    
    // Unpacked Structure
    struct {
        logic [7:0] opcode;
        int i0, i1;
        real r0, r1;
    } instruction_word;

    always_comb begin
        $display("instruction_word %p", instruction_word);
        instruction_word.opcode = 8'hff;
        $display("instruction_word %p", instruction_word);
        instruction_word = '{8'h01, 5, 7, 1.0, 3.4};
        $display("instruction_word %p", instruction_word);
    end

    // Packed Structure
    struct packed {
        bit valid;
        byte tag;
        bit [31:0] addr;
    } cache_line;

    always_comb begin
        $display("cache_line %p", cache_line);
        cache_line.tag = 8'h0f;
        $display("cache_line %p", cache_line);
        cache_line[40:39] = 2'b11;
        $display("cache_line %p", cache_line);
    end

    // Structures Assigning
    typedef struct {
        bit [15:0] opcode;
        bit [63:0] address;
    } instruction_t;

    instruction_t ir, prefetch;

    typedef struct {
        real r0, r1;
        int i0, i1;
    } data_t;

    data_t packet;

    always_comb begin
        $display("ir %p \n prefetch %p \n packet %p", ir, prefetch, packet);
        ir.opcode = 16'hf01e;
        $display("ir %p \n prefetch %p \n packet %p", ir, prefetch, packet);
        prefetch = '{16'hface, 64'h1};
        $display("ir %p \n prefetch %p \n packet %p", ir, prefetch, packet);
        ir = '{default:0};
        $display("ir %p \n prefetch %p \n packet %p", ir, prefetch, packet);
        packet = '{r0:1.2, r1:3.5, default:0};
        $display("ir %p \n prefetch %p \n packet %p", ir, prefetch, packet);
        packet = '{real:1.0, int:5};
        $display("ir %p \n prefetch %p \n packet %p", ir, prefetch, packet);
    end

endmodule