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
    zoffset=1.85;

    translate([-49,-34.5,zoffset])
    #screw(solid);

  

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
    translate([-112,27,7.5])
    rotate([2,-2,0])
    rotate([0,0,angle_halfs])
    #keyboard_left();
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
        translate([-68,45,7])
        cube([25,40,10]);
        

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
