module queues;
    
    int s_q[$] = '{2,7,6};
    int value = 9;
    int index = 2;

    always_comb begin
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
        s_q.push_front(1);
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
        value = s_q.pop_back();
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
        s_q.push_back(5);
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
        s_q.pop_front();
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
        value = s_q[$];
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
        s_q[index] = 8;
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
        value = s_q[index];
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
        value = s_q.size();
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
        s_q.insert(index, 4);
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
        s_q.delete(index);
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
        s_q.delete();
        $display("Queue: %p Value: %0d Index: %0d", s_q, value, index);
    end

endmodule