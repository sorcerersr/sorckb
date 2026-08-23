
fontonly=false;
render_all = true;
grid_spacing = 22;
cols = 7;
side_legend=false;

keycaps = [
    ["×", 8, "(", 4],
    ["ä", 5, "{", 4],
    ["B↑", 5, "#", 5],
    ["", 0, "↓", 7],
    ["", 0, "↑", 7],
    ["ü", 5, "→", 7],
    ["↓↓", 6, ")", 4],
    ["↓", 7, "↓↓", 6],
    ["F8", 5, "8", 5],
    ["F4", 5, "4", 5],
    ["F5", 5, "5", 5],
    ["F6", 5, "6", 5],
    ["F1", 5, "1", 5],
    ["", 0, "*", 7],
    ["F9", 5, "9", 5],
    ["F10", 4, "←←", 6],
    ["⇨", 8, "!", 5],
    ["⇥", 8, "$", 4],
    ["ß", 5, "←", 7],
    ["↑↑", 6, "%", 5],
    ["F7", 5, "7", 5],
    ["ö", 6, "{", 4],
    ["⇤", 8, "@", 4],
    ["V↑", 5, "]", 4],
    ["↑", 7, "↑↑", 6],
    ["V×", 5, "[", 4],
    ["", 0, "Fn", 5],
    ["V↓", 5, "⇨", 7],
    ["B↓", 5, "", 5],
    ["", 5, "", 5],
    ["", 0, "", 5],
    ["", 5, "", 5],
    ["", 5, "^", 8],
    ["", 5, "&", 5],
    ["", 5, "", 5],
    ["", 5, "", 5],
    ["", 5, "", 5],
    ["Pn", 5, ".", 10],
    ["", 5, "0", 5],
    ["", 5, "=", 6],
    ["F12", 4, "+", 6],
    ["F3", 5, "3", 5],
    ["F2", 5, "2", 5],
    ["F11", 4, "", 5],
    
];





module text3d(string, size, horalign, vertalign, thickness=0.20001){

    font_size = size;
    fontname = "Hack Nerd Font Mono:style=Bold";
    
    rotate([0,180.0])
    linear_extrude(0.20001)
    text(string, font=fontname, size=font_size,  halign=horalign, valign=vertalign);
    
}




module _render_legend(string, size, pos, halign, valign, thickness=0.20001){
    if (string != "") {
        translate(pos)
            #text3d(string, size, halign, valign, thickness);
    }
}


module cap(data){
    legend_text = side_legend ? data[0] : data[2];
    legend_size = side_legend ? data[1] : data[3];

    if (legend_text != "") {
        difference(){
            if(!fontonly){
                translate([0,0,-0.1])
                cube([10,6,0.2], center=true);
            }
            
            _render_legend(legend_text, legend_size,
                pos=[-5,0,0],
                halign="right", valign="center", thickness=0.201);
        }
    }
}



module render_grid() {
    for (i = [0 : len(keycaps) - 1]) {
        k = keycaps[i];
        row = floor(i / cols);
        col = i % cols;
        x = col * grid_spacing;
        y = -row * grid_spacing;
        translate([x, y, 0])
            cap(k);
    }
}


if (render_all)
    render_grid();
else
    cap(["S", 10, "F1", 6, "1", 5]);
    

//#text3d("PgUp", 5, horalign="left", vertalign="bottom");



//#text3d("PgUp", 5, horalign="left", vertalign="bottom");

//