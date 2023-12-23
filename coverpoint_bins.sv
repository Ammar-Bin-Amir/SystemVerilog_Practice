module coverpoint_bins;
    
    bit [2:0] b;

    covergroup cg;
        // Bins Declaration
        cp_b: coverpoint b {
            bins b_0to1 = {0,1};
            // Displaying all values separately
            bins b_2to5[] = {[2:5]};
            // Spliting values into number of groups
            bins b_2to5[2] = {[2:5]};
            bins b_6to7 = {6,7};
            // Default bins, that are not to be covered, not be used by coverage pecentage in the report
            bins b_others = default;
            // Ignore bins, not displayed in the report even tough it is exercised
            ignore_bins b_ignore = {6,7};
            // Illegal bins, if exercised the simulation stopped, even though its halfway it can display 100% coverage in the report
            illegal_bins b_illegal = {6,7};
            // Transition Coverage
            bins b_0then1 = (0 => 1);
            bins b_2then3or4 = (2 => 3,4);
            bins b_5then6then7 = (5 => 6 => 7);
            // Wildcard Coverage
            wildcard bins b_odd = {3'b??1};
        }
        // Cross Coverage
        cp_a: coverpoint a {
            bins a_0to3 = {[0:3]};
            bins a_4to7 = {[4:7]};
        }
        cp_c: coverpoint c {
            bins c_0to3 = {[0:3]};
            bins c_4to7 = {[4:7]};
        }
        cx_ac: cross a,c;           // 64 combinations, 8 values each
        cx_ac: cross cp_a, cp_c;    // 4 combination, 2 values each, using coverpoint variables
        // User defined bins for cross coverage
        cx_ac: cross a,c {
            bins a0c0 = '{'{0,0}};
            bins a67c67 = '{'{6,6},'{6,7},'{7,6},'{7,7}};
            bins a67c67_too = binsof(a) intersects{[6:7]} && binsof(c) intersects{[6:7]};
        }
        //// A coverpoint user defined bins will replace the auto-generated bins
        //// A cross coverage user defined bins will not. Auto generated bins and user defined bins both exist
    endgroup

    cg cg0;

    initial begin
        cg0 = new();
        repeat (8) begin
            b = $random();
            cg0.sample();
        end
    end

endmodule