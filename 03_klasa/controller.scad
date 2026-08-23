$fn=50;


module maybe_spacing(spacing){
    if(spacing){
        minkowski() {
            children();
            sphere(d=0.25);
        }
    }
    else {
        children();
    }
}






module usb_c_port(){
    linear_extrude(7.5){
        hull() {
            translate([3.35,0.47,0])
            circle(r=1.11);
            
            translate([3.35,-0.47,0])
            circle(r=1.11);
            
            mirror([1,0,0]){
                translate([3.35,0.47,0])
                circle(r=1.11);
                
                translate([3.35,-0.47,0])
                circle(r=1.11);    
            }
        }
    }
}


module usb_c_breakout(spacing=false){
    maybe_spacing(spacing){
        translate([0,-0.8,0.175])
        cube([18.1,22,1.5], center=true);
        
        translate([0,12.3,2.5])
        rotate([90,0,0])
        usb_c_port();
    }
}


module promicro(spacing=false){
    maybe_spacing(spacing){
        translate([0,-0.8,0.175])
        cube([18.1,36.1,1.5], center=true);
        
        translate([0,18.9,2.5])
        rotate([90,0,0])
        usb_c_port();
    }
}




//translate([0,0,-1.75])
//promicro(spacing=false);

usb_c_breakout();
