use <unibody_adapter.scad>;
use <middle_part.scad>;
$fn=50;

module base(){
    difference(){
        main_body();
        middle_part_space();
    }

}


module right_half(){

     intersection(){
        base();
        translate([0,-100,-2])
        #cube([200,200,30]);
     
     }
}



module left_half(){

     intersection(){
        base();
        translate([-200,-100,-2])
        #cube([200,200,30]);
     
     }
}


right_half();
//left_half();