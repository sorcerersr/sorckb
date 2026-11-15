



// set via -D, e.g. openscad -Dblock='"toprow"' -Dfontname='"DejaVu Sans:style=Bold"'
block = is_undef(block) ? "all" : block;
fontname = is_undef(fontname) ? "DejaVu Sans:style=Bold" : fontname;

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



module _legend(string, size, pos, rot, halign, valign, thickness=0.20001){
    if (string != "") {
        translate(pos)
        rotate(rot)
            text3d(string, size, halign, valign, thickness);
    }
}


module legend_normal(one,two,three,four,shifted=false){
    difference(){
        union(){
            if(shifted){
                translate([-6,6,4])
                _legend(one, 5,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5);
            } else {
                translate([-6,6,4])
                _legend(one, 7,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5);
            }
            translate([6,6,4])
            _legend(two, 5,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="top",thickness=5);

            if(shifted){
                translate([-5,-6,3.5])
                _legend(three, 5,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5);

            } else {
                translate([-5.5,-5,3.5])
                _legend(three, 2,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5);

            }
            translate([5,-6,3.5])
            _legend(four, 4,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="bottom",thickness=5);
        }
        cap(normal=true);
    }
}

module legend_tilted_toprow(one,two,three,four,shifted=false){
    difference(){
        union(){
            if(shifted){
                translate([-6,4,4])
                _legend(one, 5,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5);
            } else {
                translate([-5,4,4])
                _legend(one, 6,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5);
            }
            translate([6,4,4])
            _legend(two, 5,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="top",thickness=5);

            if(shifted){
                translate([-5,-6,3.5])
                _legend(three, 5,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5);

            } else {
                translate([-5.5,-5,3.5])
                _legend(three, 2,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5);

            }
            translate([5,-7,3.5])
            _legend(four, 4,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="bottom",thickness=5);
        }
        tilted_cap_top();
    }
}


module legend_tilted_bottomrow(one,two,three,four,shifted=false){
    difference(){
        union(){
            if(shifted){
                translate([-6,8,3])
                _legend(one, 7,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=8);
            } else {
                translate([-6,8,3])
                _legend(one, 7,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=8);
            }
            translate([6,8,3])
            _legend(two, 5,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="top",thickness=5);

            if(shifted){
                translate([-5,-6,3.5])
                _legend(three, 5,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5);

            } else {
                translate([-5.5,-4,3.5])
                _legend(three, 5,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5);

            }

            if(shifted){
                translate([6  ,-4,3.5])
                _legend(four, 3,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="right", valign="bottom",thickness=8);
            } else {
                translate([5,-4,3.5])
                _legend(four, 4,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="right", valign="bottom",thickness=5);

            }
        }
        tilted_cap_bottom();
    }
}




module legend_thumb(one,two,three,four,shifted=false){
    difference(){
        union(){
            if(shifted){
                translate([-6,6,4])
                _legend(one, 3,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5);
            } else {
                translate([-6,6,4])
                _legend(one,3,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="left", valign="top",thickness=5);
            }
            translate([6,6,4])
            _legend(two, 3,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="top",thickness=5);

            if(shifted){
                translate([-6,-5,3.5])
                _legend(three, 2,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5);

            } else {
                translate([-6.5,-5,3.5])
                _legend(three, 3,
                        pos=[0,0,0.2], rot=[0,0,0],
                        halign="left", valign="bottom",thickness=5);

            }
            translate([6.5,-5,3.5])
            _legend(four, 3,
                    pos=[0,0,0.2], rot=[0,0,0],
                    halign="right", valign="bottom",thickness=5);
        }
        cap(normal=true);
    }
}

module text3d(string, size, horalign, vertalign, thickness=0.20001){

    font_size = size;

    linear_extrude(thickness)
    text(string, font=fontname, size=font_size,  halign=horalign, valign=vertalign);

}



module cap(normal=true){

    if(normal){
            normal_cap();

    } else {rotate([0,180.0])

        tilted_cap_top();
    }

    //legend_normal(one="Q", two="^", three="", four="ESC");

}


module cap_normal(one,two,three,four,shifted=false){
     difference(){

            cap(normal=true);
            translate([0,0,-0.5])
            legend_normal(one, two, three, four,shifted=shifted);
        }
}

module cap_thumb(one,two,three,four,shifted=false){
     difference(){

            cap(normal=true);
            translate([0,0,-0.5])
            legend_thumb(one, two, three, four,shifted=shifted);
        }
}


module cap_tilted_toprow(one,two,three,four,shifted=false){
     difference(){

            tilted_cap_top();
            translate([0,0,-0.5])
            legend_tilted_toprow(one, two, three, four,shifted=shifted);
        }
}


module cap_tilted_bottomrow(one,two,three,four,shifted=false){
     difference(){

            tilted_cap_bottom();
            translate([0,0,-0.5])
            legend_tilted_bottomrow(one, two, three, four,shifted=shifted);
        }
}


space=25;

module top_row() {

cap_tilted_toprow(one="Q", two="^", three="", four="ESC", shifted=true);

translate([space*1,0,0])
cap_tilted_toprow(one="W", two="<", three="", four="↖");

translate([space*2,0,0])
cap_tilted_toprow(one="E", two=">", three="", four="▲");

translate([space*3,0,0])
cap_tilted_toprow(one="R", two="$", three="", four="↘");

translate([space*4,0,0])
cap_tilted_toprow(one="T", two="%", three="", four="↑");

translate([space*5,0,0])
cap_tilted_toprow(one="Y", two="@", three="", four="");

translate([space*6,0,0])
cap_tilted_toprow(one="U", two="&", three="", four="7");

translate([space*7,0,0])
cap_tilted_toprow(one="I", two="*", three="", four="8");

translate([space*8,0,0])
cap_tilted_toprow(one="O", two="'", three="", four="9");

translate([space*9,0,0])
cap_tilted_toprow(one="P", two="`", three="", four="/");
}

module home_row() {

translate([space*0,-space,0])
cap_normal(one="A", two="{", three="", four="all");

translate([space*1,-space,0])
cap_normal(one="S", two="(", three="os", four="◀");

translate([space*2,-space,0])
cap_normal(one="D", two=")", three="ctrl", four="▼");

translate([space*3,-space,0])
cap_normal(one="F", two="}", three="alt", four="▼");

translate([space*4,-space,0])
cap_normal(one="G", two="=", three="", four="↓");

translate([space*5,-space,0])
cap_normal(one="H", two="\\", three="", four="-");

translate([space*6,-space,0])
cap_normal(one="J", two="+", three="alt", four="4");

translate([space*7,-space,0])
cap_normal(one="K", two="-", three="ctrl", four="5");

translate([space*8,-space,0])
cap_normal(one="L", two="/", three="os", four="6");

translate([space*9,-space,0])
cap_normal(one=":", two="\"", three=";", four="0",shifted=true);
}

module bottom_row() {

translate([0,-space*2,0])
cap_tilted_bottomrow(one="Z", two="~", three="", four="UNDO", shifted=true);

translate([space*1,-space*2,0])
cap_tilted_bottomrow(one="X", two="[", three="", four="CUT",shifted=true);

translate([space*2,-space*2,0])
cap_tilted_bottomrow(one="C", two="]", three="", four="COPY",shifted=true);

translate([space*3,-space*2,0])
cap_tilted_bottomrow(one="V", two="_", three="", four="PASTE",shifted=true);

translate([space*4,-space*2,0])
cap_tilted_bottomrow(one="B", two="#", three="", four="REDO",shifted=true);


translate([space*5,-space*2,0])
cap_tilted_bottomrow(one="N", two="|", three="", four=",");

translate([space*6,-space*2,0])
cap_tilted_bottomrow(one="M", two="!", three="", four="1");

translate([space*7,-space*2,0])
cap_tilted_bottomrow(one="<", two=";", three=",", four="2");

translate([space*8,-space*2,0])
cap_tilted_bottomrow(one="<", two=":", three=".", four="3");

translate([space*9,-space*2,0])
cap_tilted_bottomrow(one="?", two="?", three="/", four=".",shifted=true);
}

module thumb_clusters() {

translate([space*2,-space*3,0])
cap_thumb(one="⇧", two="", three="", four="",shifted=true);

translate([space*3,-space*3,0])
cap_thumb(one="⌫", two="␣", three="nav", four="⌦",shifted=true);

translate([space*4,-space*3,0])
cap_thumb(one="⇥", two="↵", three="fn", four="⇤");

translate([space*5,-space*3,0])
cap_thumb(one="↵", two="", three="fn", four="");

translate([space*6,-space*3,0])
cap_thumb(one="␣", two="", three="nav", four="fn",shifted=true);

translate([space*7,-space*3,0])
cap_thumb(one="sym", two="", three="altgr", four="");
}

if (block == "toprow") top_row();
else if (block == "homerow") home_row();
else if (block == "bottomrow") bottom_row();
else if (block == "thumbs") thumb_clusters();
else { top_row(); home_row(); bottom_row(); thumb_clusters(); }
