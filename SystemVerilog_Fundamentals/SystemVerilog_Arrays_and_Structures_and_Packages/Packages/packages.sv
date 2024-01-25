module packages;
    
    import chip_pkg::*;

    packet_t packet;
    data_32_t new_data;

    always_comb begin
        packet = '{'1,'0};
        new_data = 32'h1234_abcd;
        $display(packet);
        $display(new_data);
    end

endmodule