$fn=25;


module controller(){

    rotate([180,0,0])
    scale([1,1.1,1.2])
    import("../promicro/promicro-usb-c.stl", center=true);
}



module text3d(string, size){

    font_size = size;
    // https://github.com/hikikomori82/osifont
    fontname = "osifont";

    linear_extrude(1.5)
    text(string, font=fontname, size=font_size,  halign="center", valign="center");

}



module bottom(){

    difference(){

        union(){

            color("aquamarine")
            rotate([180,0,0])
            import("../original/bottom.stl", center=true);


            translate([-16, -38, -2.7227])
            rotate([2,0,0])
            cube([32, 10, 2]);

            translate([-16, -41.45, -2.7227])
            cube([32, 2.7, 6.0225]);

            translate([-16, -38, 1.3])
            cube([32, 10, 2]);
        }

        rotate([183,0,0])
        text3d("Atreus", 12);

        translate([0,14,0.5])
        rotate([183,0,0])
        text3d("build by Stefan Rabmund", 5);

        translate([0,24,0.8])
        rotate([183,0,0])
        text3d("2026", 5);
        screws();

        translate([-21.97,-32.4,-3.61])
        #cylinder(d=6.35, h=6.2, $fn=6);

        translate([21.97,-32.4,-3.61])
        #cylinder(d=6.35, h=6.2, $fn=6);
    }

}


module middle(){

     difference() {
        union(){
            translate([0,0,6.75])
            color("darksalmon")
            rotate([180,0,0])
            import("../original/Middle.stl", center=true);

            translate([-54/2,-40,3.3])
            cube([54,12.5,6.9]);

            translate([-20,-41.42,3.3])
            cube([40,5,6.9]);



        }


        translate([-14,-38.8,3.3])
        cube([28,25,6.9]);


        translate([0,-20.7,6.2])
        #controller();

        translate([0,-43.8,1])
        adapter();

        screws();


     }


     translate([-5,-41.4,3.3])
        cube([10, 2.6, 0.5]);
}



module screw_holes(){
    translate([22.0,-32.4,-10])
    cylinder(d=3.1, h=30);

    translate([100.0,-44.9,-10])
    cylinder(d=3.1, h=30);

    translate([72.0,37.7,-10])
    cylinder(d=3.1, h=30);

    translate([0.0,45.5,-10])
    cylinder(d=3.1, h=30);

}



module screws(){
    screw_holes();

    mirror([1,0,0]){
        screw_holes();
    }

}


module adapter(){

    tolerance= 0.5;

    radius=2;

    w=8.6+tolerance;
    h=3+tolerance;


    minkowski(){
        translate([-w/2,0,2.8])
        cube([w, 5, h]);
        //sphere(d=radius);
    }
}


module plate(){

    difference(){
        translate([0,0,12.7])
        color("yellow")
        import("../stl/new_plate.stl", center=true);

        translate([0,-24,5.4])
        cylinder(d=30, h=6.9);

        screws();
    }

    translate([-5,-39,8.99])
    cube([10, 43, 3.5]);

    translate([-5,-1.7,3.3])
    cube([10,5.7,7.9]);


}



bottom();
//middle();

//difference(){
//
//    plate();
//
//    translate([-10,-40,6.2])
//    #cube([20,5,4]);
//}

//intersection(){
//    union(){
//        middle();
//    plate();
//
//    }
//
//    translate([-12.5,-45,-0])
//    cube([25,55,30]);
//}
