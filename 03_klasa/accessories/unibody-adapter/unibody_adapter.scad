use<../../case.scad>;
use <../../screwinsert.scad>;

$fn=50;



// laptop with aprox. 327 mm - rounded up = 330 mm
laptop_width=334;
depth=160;
height=4;

rounding=3;


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
    translate([-112,27,7])
    minkowski(){
        rotate([0,0,-5])
        keyboard_left();
        sphere(d=0.4);
    }
    
    

}

module keybpard_cutout_right(){

    mirror([1,0,0])
    keyboard_cutout_left();
}



module keyboard_left(){
    
        case_solid();
}



module left_base_part(){
    translate([-112,0,3.61])
    rotate([0,0,-5])
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
        }
        
        keyboard_cutout_left();
        keybpard_cutout_right();
        
        // main usb port cutout
        translate([-68,45,4])
        cube([25,40,10]);
        
        // the middle part spacing cutout
        middle_rounded(spacing=rounding+0.3);
        
        // the interconnect cable cutouts
                

        translate([-60.5,-15,4])
        rotate([0,0,-40])
        #cube([18,40,10]);
        
        mirror([1,0,0])
        translate([-60.5,-15,4])
        rotate([0,0,-40])
        #cube([18,40,10]);

    }
}

module middle(){

        height=10;
 
        translate([-35,9.65,5])
        color("aquamarine")
        cube([70,50,height]);
    
    
        translate([-7,-29,5])
        color("aquamarine")
        rotate([0,0,50])
        cube([20,50,height]);
        
        mirror([1,0,0])
        translate([-5,-30.65,5])
        color("aquamarine")
        rotate([0,0,50])
        cube([20,50,height]);
        
        translate([-25,-20,5])
        color("aquamarine")
        cube([50,50,height]);
        
        
        color("aquamarine")
        translate([0,-20,5])
        cylinder(d=50, h=height);
        
        
}


module middle_rounded(spacing=rounding){
    minkowski(){
        middle();
        
        sphere(d=spacing);
    
    }

}

module middle_with_cable_cutouts(){

    difference(){
        middle_rounded();
        
        translate([0,25,4])
        cylinder(d1=68, d2=64, h=13);
    
        translate([-50,0,4])
        rotate([0,0,-40])
        cube([22,40,13]);
        
        
        mirror([1,0,0])
        translate([-49.5,0,4])
        rotate([0,0,-40])
        cube([22,40,13]);
        

    }
    
    translate([-32.5,17,4])
    cylinder(d=8,h=12.5);
    
    mirror([1,0,0])
    translate([-32.5,17,4])
    cylinder(d=8,h=12.5);

}



// usb interconnect cutout
//translate([-60.5,-15,4])
//    rotate([0,0,-40])
//    #cube([18,40,10]);



main_body();
middle_with_cable_cutouts();
//middle_rounded();
//middle();

//connect_plate();
//siderail();
//left_half();
// right_half();