package chip_pkg;
    import base_pkg::*;
    export base_pkg::*;
    typedef struct {
        data_32_t data;
        addr_16_t address;
    } packet_t;
endpackage