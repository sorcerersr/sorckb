use <switches.scad>;
use <screwinsert.scad>;
use <controller.scad>;

$fn=100;

height=5.75+1.5+1.5-4;

module casetop(){
    
        difference(){
            minkowski(){
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
        
        translate([52.25,-10.3,1])
        cube([6,4,4]);
        
        // and usb breakout
        translate([44.25,-35,1])
        rotate([0,0,-35])
        cube([4,6,4]);
        
        translate([50.25,-43.1,1])
        rotate([0,0,-35])
        cube([6,4,4]);
        
      
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
        translate([62.5,-32,3.7])
        rotate([0,180,-35])
        #usb_c_breakout(spacing=true); 
        
        
        
    }
}


module screws(solid=false){

    translate([-49,-34.5,2.25])
    screw(solid);
    
    translate([-49,20.5,2.25])
    screw(solid);
    
    translate([-15,-43.5,2.25])
    screw(solid);

    translate([18,-55.5,2.25])
    screw(solid);    

    translate([47,-66.5,2.25])
    screw(solid);

    // at usb-c breakout board position
    translate([60,-49,2.25])
    screw(solid);

    // at usb-c breakout board position
    translate([62,-16,2.25])
    screw(solid);
    
    translate([66.5,28.5,2.25])
    screw(solid);
    
    translate([22.5,28,2.25])
    screw(solid);
    
    translate([-12,28,2.25])
    screw(solid);
    
    translate([-3,-30,2.25])
    screw(solid);
    
    translate([40,-35,2.25])
    screw(solid);
    
}



// top

module top(){
    intersection(){
        case();
        translate([-80, -80, 0.25])
        cube([160, 160, 15]);
    }
}


// bottom
module bottom(){
    intersection(){
        case();
        translate([-125, -125, 0.25-4])
        cube([250, 250, 4]);

    }
    
    // some small guides to align bottom and half
    translate([55.4,-51,-2])
    rotate([0,0,-35])
    cube([4,3,3]);
    
    translate([30,-61.7,-2])
    rotate([0,0,70])
    cube([4,5,3]);
    
    translate([-30,-39.95,-2])
    rotate([0,0,70])
    cube([4,5,3]);
    
    translate([30,25.8,-2])
    cube([5,4,3]);
    
    translate([-40,21,-2])
    rotate([0,0,14.6])
    cube([5,4,3]);
}

top();
bottom();
