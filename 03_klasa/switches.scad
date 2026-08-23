$fn=50;
switch_size = 14;
switch_distance=19;


spacing = switch_distance+2-switch_size;


module switch_cutout(){
    
    color("aquamarine")
    square(switch_size, center=true);

}


module switch_cutout_column(switch_count=1, offset=0, add_spacing){
    translate([0,14*offset,0])
    for(index = [0:switch_count-1]){
        translate([0, -index*switch_distance, 0])
        minkowski(){
            switch_cutout();
            if(add_spacing){
               translate([-spacing/2,-spacing/2,0])
                square(spacing);
            }
        }
    }
}


// Pass children through unchanged, or wrap them in hull() when wrap=true
module maybe_hull(wrap){
    if(wrap){
        hull() {
            children();
        }
    }
    else {
        children();
    }
}


module thumb_cluster(add_spacing){
    maybe_hull(add_spacing) {
        rotate([0,0,-5])
        switch_cutout_column(add_spacing=add_spacing);

        translate([switch_distance,-switch_size/3,0])
        rotate([0,0,-20])
        switch_cutout_column(add_spacing=add_spacing);
        
        translate([2*switch_distance,-switch_size,0])
        rotate([0,0,-35])
        switch_cutout_column(add_spacing=add_spacing);
    }
}



module main_switch_area(add_spacing=false, add_controller_spacing=false){
    columns = 5;
    rows = 3;
    
    column_stagger_offset = [0, 0.35, 0.5, 0.35, 0.25];
    
    
    maybe_hull(add_spacing){
        for(column = [0:columns-1]){
                
            translate([switch_distance*column, 0, 0])    
            switch_cutout_column(rows, column_stagger_offset[column], add_spacing);

        }
        
        
        if(add_controller_spacing){
            // pro micro space reserve
            // its a little bit more than the pro micro
            // is actually 
            translate([88,-22,0])
            square([20,40]);
        }
            
    }
    translate([3*switch_distance-switch_distance/2,-52,0])    
    thumb_cluster(add_spacing);

}


module switches(){
    
    translate([-40,12,0])
    main_switch_area();
    
}


module switch_plate_half(add_controller_spacing=false){

        translate([-40,12,0])
        main_switch_area(add_spacing=true, add_controller_spacing=add_controller_spacing);   
   
}


module switch_plate(){

    switch_plate_half(add_controller_spacing=true);

    // add space for usb c breakout board.
    // actual size is 18x22 but add a bit more space
    translate([43.7,-40,0])
    rotate([0,0,-35])
    square([20,27]);
    
    // use a 90 degree angle in the shape
    translate([36.135,-20.64,0])
    rotate([0,0,-35])
    square([20,27]);
    
    // fill gap
    translate([25,-45,0])
    square([35,40]);
    
    
    // other gap
    translate([-40,-36.5,0])
    rotate([0,0,-20])
    square([50,35]);
    
    

}



#switches();
switch_plate();

