$fn=50;


module screw_m2x8(){

    cylinder(d=1.95, h=8);
    
    cylinder(d1=3.6, d2=1.95, h=1.07);
    

}


module solid_insert(){

    cylinder(d=5, h=8.5, center=true);

}

module screw(solid=false){

    if(solid){
        solid_insert();
    } else {
        translate([0,0,-4.25])
        screw_m2x8();
    }

}





screw(solid=true);
translate([-4,0,0])
screw(solid=false);