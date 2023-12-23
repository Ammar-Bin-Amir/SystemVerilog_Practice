module a;
    b mb();

    int aa;

    initial begin
        $display("aa=%0d",aa);
    end
endmodule

module b;
    c mc();

    int cc;

    initial begin
        $display("bb=%0d",bb);
    end
endmodule

module c;
    d md();

    int cc;

    initial begin
        $display("cc=%0d",cc);
        // Relative Path
        // module c can access module d
        $display("%0d",md.dd);
        // module c can access module e that is within module d
        $display("%0d",md.me.ee);
        // Absolute Path
        // module c can access module e that is within module d
        $display("%0d",cross_module_reference.ma.mb.mc.md.me.ee);
        // module c can access module cross_module_reference
        $display("%0d",cross_module_reference.tt);
        // module c can access module mx
        $display("%0d",cross_module_reference.mx.xx);
    end
endmodule

module d;
    e me();

    int dd;

    initial begin
        $display("dd=%0d",dd);
    end
endmodule

module e;
    int ee;

    initial begin
        $display("ee=%0d",ee);
    end
endmodule

module x;
    y my();

    int xx;

    initial begin
        $display("xx=%0d",xx);
    end
endmodule

module y;
    int yy;

    initial begin
        $display("yy=%0d",yy);
    end
endmodule

/*

me   md   mc   mb   ma   <---   cross_module_reference   --->   mx   my

*/

module cross_module_reference;

    a ma();
    x mx();

    // Binding
    // It puts mx as a child module under module c
    bind ma.mb.mc x mx();
    
    int tt;

    initial begin
        $display("tt=%0d",tt);
    end
    
endmodule

//// The module can be accessed by name if it is within the module
//// It is best not to use absolute path, it makes module c less resuable