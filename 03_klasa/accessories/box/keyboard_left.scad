use <../case.scad>;
use <../switches.scad>;


module box_bottom(){
    color("blue")
    import("box_bottom.stl", center=true);

}

module left(){
    minkowski(){
        union(){
            rotate([0,0,90])
            top();
            rotate([0,0,90])
            bottom();
            
            translate([0,0,6])
            keyarea();
        }
        sphere(d=0.6);
     }
}


module right(){
    mirror([1,0,0])
    left();
}


module keyarea(){
    minkowski(){
        linear_extrude(9)
        rotate([0,0,90])
        switches();
        
        cube(6);
    }

}


//box_bottom();

//translate([-80,0,0])
left();

//translate([80,0,0])
//right();