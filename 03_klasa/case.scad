use <switches.scad>;
use <screwinsert.scad>;
use <controller.scad>;

$fn=100;

height=6.75+1.5+1.5-4;

module casetop(){

        difference(){
            minkowski(){
                translate([0,0,-1])
                linear_extrude(height)
                switch_plate();
                sphere(d=4);
            }
            translate([0,0,3])
            linear_extrude(6)
            #switches();


            translate([0,0,-1.5])
            linear_extrude(height+4-1.2-1.5)
            switch_plate();

        }

        screws(solid=true);

        // some guidedance for the controller
        translate([63.8,-7,1])
        cube([5,5,4]);

        translate([43.25,-7,1])
        cube([2,5,4]);

        translate([52.25,-11.5,1])
        cube([6,4,4]);

        // and usb breakout
        translate([50,-35,1])
        rotate([0,0,-35])
        cube([4,6,4]);

        translate([68,-49,1])
        rotate([0,0,-35])
        cube([4,6,4]);

        translate([52.25,-41.5,1])
        rotate([0,0,-35])
        cube([14,2,4]);


}


module case(){

    difference(){
        casetop();
        screws(solid=false);

        color("darkgreen")
        rotate([0,180,0])
        translate([-54.5,13,-3.7])
        #promicro(spacing=true);

        color("darkgreen")
        rotate([0,180,-35])
        translate([-74.5,10,-3.7])
        #usb_c_breakout(spacing=true);



    }
}


module screws(solid=false){
    zoffset=1.75;

    translate([-49,-34.5,zoffset])
    screw(solid);

    translate([-49,20.5,zoffset])
    screw(solid);

    translate([-15,-37.5,zoffset])
    screw(solid);

    translate([18,-50.5,zoffset])
    screw(solid);

    translate([60,-66,zoffset])
    screw(solid);

    // at usb-c breakout board position
    translate([81.2,-35.6,zoffset])
    screw(solid);

    // at usb-c breakout board position
    translate([60.5,-19,zoffset])
    screw(solid);

    translate([66.5,-9,zoffset])
    screw(solid);

    translate([66.5,28.5,zoffset])
    screw(solid);

    translate([42.5,28.5,zoffset])
    screw(solid);

    translate([22.5,28,zoffset])
    screw(solid);

    translate([-12,28,zoffset])
    screw(solid);

    translate([8,-30,zoffset])
    screw(solid);

    translate([40,-32.5,zoffset])
    screw(solid);

}



// top

module top(){
    intersection(){
        case();
        translate([-100, -100, 0.25])
        cube([200, 200, 15]);
    }
}


module text3d(string, size, thickness=0.20001){

    font_size = size;
    fontname = "Hack Nerd Font Mono:style=Bold";

    rotate([0,180.0])
    linear_extrude(thickness)
    text(string, font=fontname, size=font_size);

}


// bottom
module bottom(){
    difference(){
        intersection(){
            case();
            translate([-125, -125, 0.25-4])
            cube([250, 250, 4]);

        }
        
    }
    
}

top();
bottom();
