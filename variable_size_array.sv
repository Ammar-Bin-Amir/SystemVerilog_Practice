module variable_size_array;
    
    byte b[99:0];
    // Non-synthesizable
    byte dynamicArray[];
    byte queue[$];
    byte associativeArray[*];

    // Dynamic Array; used for data operation
    int Array[];

    initial begin
        Array = new[2];             // Array[0] Array[1]
        Array[0] = 12;              // 12       []
        Array[1] = 34;              // 12       34
        Array = new[5];             // Array[0] Array[1] Array[2] Array[3] Array[4]
        Array = new[5] (Array);     // 12       34       []       []       []
        Array.delete();
    end

    // Queue; used for data sequencing management
    int Array_q[$];

    initial begin
        Array_q.push_back(12);    // 12
        Array_q.push_back(34);    // 12   34
        Array_q.push_back(56);    // 12   34   56
        Array_q.push_front(78);   // 78   12   34   56
        Array_q.pop_front();      // 12   34   56
        Array_q.pop_back();       // 12   34
        Array_q.insert(1, 90);    // 12   90   34
        Array_q.delete(1);        // 12   34
    end

    // Associative Array; used for modelling memory
    int a_Array[*];

    initial begin
        a_Array[10] = 12;       // 12[10]
        a_Array[10] = 34;       // 12[10]   34[100]
        a_Array[10] = 56;       // 12[10]   34[100]     56[1000]
        a_Array.delete(100);    // 12[10]   56[1000]
    end

endmodule