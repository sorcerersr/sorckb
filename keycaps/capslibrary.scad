



// Library of base keycap modules. Use via: use "capslibrary.scad"
//
// use_alternate_font selects the legend font:
//   false (default) -> Hack Nerd Font Mono Bold
//   true            -> DejaVu Sans Bold (thumb caps)

module normal_cap(){
    import("MX_Stem_MX_Size_Saddle.stl");
}

module tilted_cap_bottom(){
    rotate([0,0,180])
    import("MX_Stem_MX_Size_Saddle_Tilted.stl");
}

module tilted_cap_top(){

    import("MX_Stem_MX_Size_Saddle_Tilted.stl");
}



module _legend(string, size, pos, rot, halign, valign, thickness=0.20001, use_alternate_font=false){
    if (string != "") {
        translate(pos)
        rotate(rot)
            text3d(string, size, halign, valign, thickness, use_alternate_font);
    }
}


module legend_normal(one,two,three,four,shifted=false,use_alternate_font=false){
    difference(){
        union(){
            if(shifted){
                translate([-6,6,4])
                _legend(one, 5,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5,use_alternate_font=use_alternate_font);
            } else {
                translate([-6,6,4])
                _legend(one, 7,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5,use_alternate_font=use_alternate_font);
            }
            translate([6,6,4])
            _legend(two, 5,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="top",thickness=5,use_alternate_font=use_alternate_font);

            if(shifted){
                translate([-5,-6,3.5])
                _legend(three, 5,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);

            } else {
                translate([-5.5,-5,3.5])
                _legend(three, 2,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);

            }
            translate([5,-6,3.5])
            _legend(four, 4,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);
        }
        cap(normal=true);
    }
}

module legend_tilted_toprow(one,two,three,four,shifted=false,use_alternate_font=false){
    difference(){
        union(){
            if(shifted){
                translate([-6,4,4])
                _legend(one, 5,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5,use_alternate_font=use_alternate_font);
            } else {
                translate([-5,4,4])
                _legend(one, 6,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5,use_alternate_font=use_alternate_font);
            }
            translate([6,4,4])
            _legend(two, 5,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="top",thickness=5,use_alternate_font=use_alternate_font);

            if(shifted){
                translate([-5,-6,3.5])
                _legend(three, 5,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);

            } else {
                translate([-5.5,-5,3.5])
                _legend(three, 2,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);

            }
            translate([5,-7,3.5])
            _legend(four, 4,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);
        }
        tilted_cap_top();
    }
}


module legend_tilted_bottomrow(one,two,three,four,shifted=false,use_alternate_font=false){
    difference(){
        union(){
            if(shifted){
                translate([-6,8,3])
                _legend(one, 7,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=8,use_alternate_font=use_alternate_font);
            } else {
                translate([-6,8,3])
                _legend(one, 7,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=8,use_alternate_font=use_alternate_font);
            }
            translate([6,8,3])
            _legend(two, 5,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="top",thickness=5,use_alternate_font=use_alternate_font);

            if(shifted){
                translate([-5,-6,3.5])
                _legend(three, 5,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);

            } else {
                translate([-5.5,-4,3.5])
                _legend(three, 5,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);

            }

            if(shifted){
                translate([6  ,-4,3.5])
                _legend(four, 3,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="right", valign="bottom",thickness=8,use_alternate_font=use_alternate_font);
            } else {
                translate([5,-4,3.5])
                _legend(four, 4,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="right", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);

            }
        }
        tilted_cap_bottom();
    }
}




module legend_thumb(one,two,three,four,shifted=false,use_alternate_font=false){
    difference(){
        union(){
            if(shifted){
                translate([-6,6,4])
                _legend(one, 3,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5,use_alternate_font=use_alternate_font);
            } else {
                translate([-6,6,4])
                _legend(one,3,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5,use_alternate_font=use_alternate_font);
            }
            translate([6,6,4])
            _legend(two, 3,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="top",thickness=5,use_alternate_font=use_alternate_font);

            if(shifted){
                translate([-6,-5,3.5])
                _legend(three, 2,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);

            } else {
                translate([-6.5,-5,3.5])
                _legend(three, 3,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);

            }
            translate([6.5,-5,3.5])
            _legend(four, 3,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="bottom",thickness=5,use_alternate_font=use_alternate_font);
        }
        cap(normal=true);
    }
}

module text3d(string, size, horalign, vertalign, thickness=0.20001, use_alternate_font=false){

    font_size = size;
    font = use_alternate_font ? "DejaVu Sans:style=Bold" : "Hack Nerd Font Mono:style=Bold";

    linear_extrude(thickness)
    text(string, font=font, size=font_size,  halign=horalign, valign=vertalign);

}



module cap(normal=true){

    if(normal){
            normal_cap();

    } else {rotate([0,180.0])

        tilted_cap_top();
    }

    //legend_normal(one="Q", two="^", three="", four="ESC");

}


module cap_normal(one,two,three,four,shifted=false,use_alternate_font=false){
     difference(){

            cap(normal=true);
            translate([0,0,-0.5])
            legend_normal(one, two, three, four,shifted=shifted,use_alternate_font=use_alternate_font);
        }
}

module cap_thumb(one,two,three,four,shifted=false,use_alternate_font=false){
     difference(){

            cap(normal=true);
            translate([0,0,-0.5])
            legend_thumb(one, two, three, four,shifted=shifted,use_alternate_font=use_alternate_font);
        }
}


module cap_tilted_toprow(one,two,three,four,shifted=false,use_alternate_font=false){
     difference(){

            tilted_cap_top();
            translate([0,0,-0.5])
            legend_tilted_toprow(one, two, three, four,shifted=shifted,use_alternate_font=use_alternate_font);
        }
}


module cap_tilted_bottomrow(one,two,three,four,shifted=false,use_alternate_font=false){
     difference(){

            tilted_cap_bottom();
            translate([0,0,-0.5])
            legend_tilted_bottomrow(one, two, three, four,shifted=shifted,use_alternate_font=use_alternate_font);
        }
}
