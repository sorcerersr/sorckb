



module cuttingblock(){
    translate([5,-37.5, 9])
    cube([10,10,7]);
    
    translate([5,-37.5, 9])
    cube([10,10,7]);
    
    

}


module plate(){
    
        translate([0,0,12.7])
        color("yellow")
        rotate([180,0,0])
        import("../original/Plate.stl", center=true);
        
}




xmov = 12;

difference() {
    plate();
    translate([xmov,0,0])
    cuttingblock();
    
    mirror([1,0,0]){
        translate([xmov,0,0])
        cuttingblock();
    }
    
}


translate([xmov,0,0])
intersection() {
    plate();
    cuttingblock();
}


mirror([1,0,0]){
    translate([xmov,0,0])
    intersection() {
        plate();
        cuttingblock();
    }

}



translate([-15,-37.5, 10.2])
#cube([30,12,5]);


translate([-30,-39.5, 10.2])
#cube([60,3,4]);