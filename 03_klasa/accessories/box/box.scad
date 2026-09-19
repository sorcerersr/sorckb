use <../case.scad>;
use <../switches.scad>;



module text3d(string, size, horalign, vertalign, thickness=0.20001){

    font_size = size;
    fontname = "Hack Nerd Font Mono:style=Bold";
    
    rotate([0,180.0])
    linear_extrude(thickness)
    text(string, font=fontname, size=font_size,  halign=horalign, valign=vertalign);
    
}


module box_bottom_base(){
    color("blue")
    import("box_bottom.stl", center=true);
    
    translate([-120,-100,-8.5])
    cube([240, 155,15.47]);

}


module box_top_base(){
    color("darkblue")
    rotate([0,0,180])
    import("box_top.stl", center=true);
    
    translate([-120,-100,-8.5])
    cube([240, 155,15.47]);

}

module left(){
    minkowski(){
        scale([1,1,2.6])
        hull(){
            rotate([0,0,90])
            top();
            rotate([0,0,90])
            bottom();
        }    
        sphere(d=0.6);
     }
     translate([-20,60,-8])
     cube([70,40,32]);
}


module right(){
    mirror([1,0,0])
    left();
}


module box_bottom(){
   difference(){ 
    
        box_bottom_base();

        translate([-80,-40,0])
        #left();

        translate([80,-40,0])
        right();
   }     
}



module nametext(){

    offset=-10.825;

    //color("white")
    translate([-15,0,offset])
    text3d("Klasa", 35, horalign="center");
    
    
    //color("white")
    translate([0,-18,offset])
    text3d("https://github.com/sorcerersr/sorckb", 6, horalign="center");
    
    //color("white")
    rotate([0,0,-90])
    translate([-16,70,offset])
    text3d("SorcKB", 8, horalign="center");
    
    translate([85,15,offset-0.1000])
    //color("white")
    cube([5,45, 0.2], center=true);
    
    translate([63,15,offset-0.1000])
    //color("white")
    #cube([5,45, 0.2001], center=true);
    
    
}

module box_top(){
   difference(){ 
    
        box_top_base();

        
        translate([-80,-40,0])
        #left();

        translate([80,-40,0])
        right();
        
        
        
        
   }     
}

//box_bottom();

box_top();

//nametext();

