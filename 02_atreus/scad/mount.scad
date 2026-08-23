


module controller(){

    rotate([180,0,0])
    import("../promicro/promicro-usb-c.stl", center=true);
}



module mount(){
    import("../temp_stl/pro_micro_mount.stl", center=true);
}



module hat(){
    
    translate([-12.5, 9, -5.94])
    cube([25,15, 2]);
    
    translate([-2.5, 9, -5.94])
    cube([5,4, 3.9]);
    
    translate([-2.5, 21, -5.94])
    cube([5,2.5, 8.9]);

    
    translate([-12.5, 9, -5.94])
    cube([3.3,4, 5.3]);
    
    translate([12.5-3.2, 9, -5.94])
    cube([3.3,4, 5.3]);
}




difference(){
    hat();
    
    translate([0,16.85,-5.3])
    #cube([10.3,6,7.9], center=true);

    translate([0,-5.3,-2.7])
    #controller();
    #mount();

}