use<../../case.scad>;
use <../../screwinsert.scad>;

$fn=50;



// laptop with aprox. 327 mm - rounded up = 330 mm
laptop_width=334;
depth=160;
height=4;

rounding=3;


// the angle of the halfs - its really minimal as the primary use case
// is to put it on a laptops build in keyboard and not on a desk and 
// on a first prototype a larger more ergo angle caused rested wrists
// to be on the edge of the laptop which was uncomfortable
angle_halfs=-2.5;


module screws(){
    zoffset=6.06;

    
    // front row
    translate([-35,-35,zoffset])
    screw();
    
    translate([-15,-35,zoffset])
    screw();
    
    translate([15,-35,zoffset])
    screw();
    
    translate([35,-35,zoffset])
    screw();

    
    // front middle
    translate([-15,-17,zoffset])
    screw();
    
    translate([15,-17,zoffset])
    screw();
    
    // middle screws
    translate([-39.5,25,zoffset])
    screw();
    
    translate([39.5,25,zoffset])
    screw();
    
    // top row
    translate([-35,50,zoffset])
    screw();
    
    translate([-15,57,zoffset])
    screw();
    
    translate([15,57,zoffset])
    screw();
    
    translate([35,50,zoffset])
    screw();
  

}


module left_half_base(){
    
   difference(){ 
   
        union(){
            translate([(-laptop_width/4),0,0])
            cube([(laptop_width/2)-rounding, depth-rounding, height-rounding], center=true);
           
        }
        
    }
}



module keyboard_cutout_left(){
    translate([-112,27,4.5+1.5])
    rotate([0,0,angle_halfs])
    keyboard_left();
    
    translate([-112,27,4.5+5.5])
    rotate([0,0,angle_halfs])
    keyboard_left();
}

module keybpard_cutout_right(){

    mirror([1,0,0])
    keyboard_cutout_left();
}



module keyboard_left(){
    
        import("../case_solid_spacing.stl");
}



module left_base_part(){
    translate([-112,0,3.61])
    rotate([0,0,angle_halfs]) 
    translate([-1.5,27,0])
    scale([1.05, 1.05, 0.75])
    keyboard_left();
        
}


module interconnect_cable_cutout(){

    translate([0,20,3])
    cylinder(d1=75, d2=70, h=14);
    
    
    translate([-50,-10,3])
    cube([100,30,14]);
}

module main_body(){
    
    difference(){
    
        hull(){
            left_base_part();
            
            mirror([1,0,0])
            left_base_part();
            
            translate([-35,9.65,5])
            color("aquamarine")
            cube([70,50,10]);
        }
        
        keyboard_cutout_left();
        keybpard_cutout_right();
        
        // main usb port cutout
        translate([-68,45,3.2])
        cube([25,40,15]);
        
        interconnect_cable_cutout();
        
        screws();
    }
}





// usb interconnect cutout
//translate([-60.5,-15,4])
//    rotate([0,0,-40])
//    #cube([18,40,10]);



main_body();

//connect_plate();
//siderail();
//left_half();
// right_half();
