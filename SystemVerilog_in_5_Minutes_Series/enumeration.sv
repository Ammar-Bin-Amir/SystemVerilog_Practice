module enumeration;
    
    // Indexing by default 0
    // If RED = 1 and GREEN and BLUE are not assigned then they would be 2 and 3 respectively
    typedef enum int { RED, GREEN, BLUE } color;

    color c0;
    color c1;

    c0 = RED;   // True
    c0 = 0;     // False

    $cast(c0, 0);   // True
    $cast(c0, 3);   // False, Does not exist

    typedef enum bit { DAY, NIGHT } mode;

    mode m1, m2;

    m1 = RED;   // False

    m2 = mode.first();  // Gets DAY the first one
    m2 = mode.next();   // Gets NIGHT after DAY
    m2 = mode.next();   // Gets DAY after NIGHT, if does not exist then move to first
    m2 = mode.last();   // Gets NIGHT the last one

    $display("m2 = %0d, %0s", m2, m2.name());   // 1, NIGHT

endmodule