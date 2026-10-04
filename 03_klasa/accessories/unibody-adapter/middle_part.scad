use <unibody_adapter.scad>
 
 $fn=50;
 
 

module screws_path(spacing=false){
    zoffset=1.45;
    dia=spacing ? 4.4 : 4;
    height=spacing ? 2.4 : 2;
    
    // front row
    translate([-35,-35,zoffset])
    cylinder(d=dia,h=height);
    
    translate([-15,-35,zoffset])
    cylinder(d=dia,h=height);
    
    translate([15,-35,zoffset])
    cylinder(d=dia,h=height);
    
    translate([35,-35,zoffset])
    cylinder(d=dia,h=height);

    
    // front middle
    translate([-15,-17,zoffset])
    cylinder(d=dia,h=height);
    
    translate([15,-17,zoffset])
    cylinder(d=dia,h=height);
    
    // middle screws
    translate([-39.5,25,zoffset])
    cylinder(d=dia,h=height);
    
    translate([39.5,25,zoffset])
    cylinder(d=dia,h=height);
    
    // top row
    translate([-35,50,zoffset])
    cylinder(d=dia,h=height);
    
    translate([-15,57,zoffset])
    cylinder(d=dia,h=height);
    
    translate([15,57,zoffset])
    cylinder(d=dia,h=height);
    
    translate([35,50,zoffset])
    cylinder(d=dia,h=height);
  

} 
 
 
 
module middle_part(){
    difference(){
        intersection(){
            translate([-45,-75,2.4])
            cube([90,150,15]);
            main_body();
        }
        #screws_path(spacing=true); 
    }    
}

module middle_part_space(){
    difference(){
        minkowski(){
            hull(){
                middle_part();
            }
            sphere(d=0.3);
        
        }
        #screws_path();
    }    
}


middle_part();
//middle_part_space();
