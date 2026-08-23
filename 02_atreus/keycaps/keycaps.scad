
fontonly=true;
render_all = true;
grid_spacing = 22;
render_side_legends=false;
cols = 7;
keycaps = [
    ["A", 8, "×", 8, "(", 4],
    ["B", 8, "ä", 5, "{", 4],
    ["C", 8, "B↑", 5, "#", 5],
    ["D", 8, "", 0, "↓", 7],
    ["E", 8, "", 0, "↑", 7],
    ["F", 8, "ü", 5, "→", 7],
    ["G", 8, "↓↓", 6, ")", 4],
    ["H", 8, "↓", 7, "↓↓", 6],
    ["I", 8, "F8", 5, "8", 5],
    ["J", 8, "F4", 5, "4", 5],
    ["K", 8, "F5", 5, "5", 5],
    ["L", 8, "F6", 5, "6", 5],
    ["M", 8, "F1", 5, "1", 5],
    ["N", 8, "", 0, "*", 7],
    ["O", 8, "F9", 5, "9", 5],
    ["P", 8, "F10", 4, "←←", 6],
    ["Q", 8, "⇨", 8, "!", 5],
    ["R", 8, "⇥", 8, "$", 4],
    ["S", 8, "ß", 5, "←", 7],
    ["T", 8, "↑↑", 6, "%", 5],
    ["U", 8, "F7", 6, "7", 5],
    ["V", 8, "ö", 6, "{", 4],
    ["W", 8, "⇤", 8, "@", 4],
    ["X", 8, "V↑", 6, "]", 4],
    ["Y", 8, "↑", 7, "↑↑", 6],
    ["Z", 8, "V×", 5, "[", 4],
    ["ESC", 5, "", 0, "Fn", 5],
    ["TAB", 5, "V↓", 5, "⇨", 7],
    ["CMD", 5, "B↓", 5, "", 5],
    ["↑", 12, "", 5, "", 5],
    ["←←", 7, "", 0, "", 5],
    ["^^", 7, "", 5, "", 5],
    ["`~", 7, "", 5, "^", 8],
    ["\\|", 7, "", 5, "&", 5],
    ["Alt", 5, "", 5, "", 5],
    ["", 7, "", 5, "", 5],
    ["Fn", 7, "", 5, "", 5],
    ["-_", 7, "Pn", 5, ".", 10],
    ["´\"", 7, "", 5, "0", 5],
    ["↵", 10, "", 5, "=", 6],
    ["/?", 7, "F12", 4, "+", 6],
    [".>", 7, "F3", 5, "3", 5],
    [",<", 7, "F2", 5, "2", 5],
    [";:", 7, "F11", 4, "", 5],
    
];





module text3d(string, size, horalign, vertalign, thickness=0.20001){

    font_size = size;
    fontname = "Hack Nerd Font Mono:style=Bold";
    
    rotate([0,180.0])
    linear_extrude(0.20001)
    text(string, font=fontname, size=font_size,  halign=horalign, valign=vertalign);
    
}


module blank_cap (){

    scale([1,1,1.5])
    translate([0,0,2])
    rotate([270.0,0])
    import("blank_cap.stl", center=true);
    
    
}



module _render_legend(string, size, pos, rot, halign, valign, thickness=0.20001){
    if (string != "") {
        translate(pos)
        rotate(rot)
            #text3d(string, size, halign, valign, thickness);
    }
}


module cap(data){
    difference(){
        if(!fontonly){
            blank_cap();
        }
        
        _render_legend(data[0], data[1], 
            pos=[0,0,0.2], rot=[0,0,0], 
            halign="center", valign="center");
       
        if(render_side_legends){
      
        _render_legend(data[2], data[3], 
            pos=[7.6,-5.6,3], rot=[-67,0,90], 
            halign="right", valign="center", thickness=0.4);
        
        _render_legend(data[4], data[5], 
            pos=[-5,-7.6,3], rot=[-67,0,0], 
            halign="right", valign="center", thickness=0.4);
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

