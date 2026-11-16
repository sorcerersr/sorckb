// Entry file for per-keycap STL export.
//
// Set via -D:
//   openscad -Dcap_index=12 -o stl/homerow/d.stl caps.scad
//
// cap_index selects one of the 36 caps in cap_list (row order:
// toprow 0-9, homerow 10-19, bottomrow 20-29, thumbs 30-35).
use "capslibrary.scad";

// --- toprow (0-9) ---
module cap_q() { cap_tilted_toprow(one="Q", two="^", three="", four="ESC", shifted=true); }
module cap_w() { cap_tilted_toprow(one="W", two="<", three="", four="↖"); }
module cap_e() { cap_tilted_toprow(one="E", two=">", three="", four="▲"); }
module cap_r() { cap_tilted_toprow(one="R", two="$", three="", four="↘"); }
module cap_t() { cap_tilted_toprow(one="T", two="%", three="", four="↑"); }
module cap_y() { cap_tilted_toprow(one="Y", two="@", three="", four=""); }
module cap_u() { cap_tilted_toprow(one="U", two="&", three="", four="7"); }
module cap_i() { cap_tilted_toprow(one="I", two="*", three="", four="8"); }
module cap_o() { cap_tilted_toprow(one="O", two="'", three="", four="9"); }
module cap_p() { cap_tilted_toprow(one="P", two="`", three="", four="/"); }

// --- homerow (10-19) ---
module cap_a() { cap_normal(one="A", two="{", three="", four="all"); }
module cap_s() { cap_normal(one="S", two="(", three="os", four="◀"); }
module cap_d() { cap_normal(one="D", two=")", three="ctrl", four="▼"); }
module cap_f() { cap_normal(one="F", two="}", three="alt", four="▼"); }
module cap_g() { cap_normal(one="G", two="=", three="", four="↓"); }
module cap_h() { cap_normal(one="H", two="\\", three="", four="-"); }
module cap_j() { cap_normal(one="J", two="+", three="alt", four="4"); }
module cap_k() { cap_normal(one="K", two="-", three="ctrl", four="5"); }
module cap_l() { cap_normal(one="L", two="/", three="os", four="6"); }
module cap_colon() { cap_normal(one=":", two="\"", three=";", four="0", shifted=true); }

// --- bottomrow (20-29) ---
module cap_z() { cap_tilted_bottomrow(one="Z", two="~", three="", four="UNDO", shifted=true); }
module cap_x() { cap_tilted_bottomrow(one="X", two="[", three="", four="CUT", shifted=true); }
module cap_c() { cap_tilted_bottomrow(one="C", two="]", three="", four="COPY", shifted=true); }
module cap_v() { cap_tilted_bottomrow(one="V", two="_", three="", four="PASTE", shifted=true); }
module cap_b() { cap_tilted_bottomrow(one="B", two="#", three="", four="REDO", shifted=true); }
module cap_n() { cap_tilted_bottomrow(one="N", two="|", three="", four=","); }
module cap_m() { cap_tilted_bottomrow(one="M", two="!", three="", four="1"); }
module cap_less() { cap_tilted_bottomrow(one="<", two=";", three=",", four="2"); }
module cap_greater() { cap_tilted_bottomrow(one=">", two=":", three=".", four="3"); }
module cap_question() { cap_tilted_bottomrow(one="?", two="?", three="/", four=".", shifted=true); }

// --- thumbs (30-35) ---
module cap_shift() { cap_thumb(one="⇧", two="", three="", four="", shifted=true, use_alternate_font=true); }
module cap_backspace() { cap_thumb(one="⌫", two="␣", three="nav", four="⌦", shifted=true, use_alternate_font=true); }
module cap_tab() { cap_thumb(one="⇥", two="↵", three="fn", four="⇤", use_alternate_font=true); }
module cap_enter() { cap_thumb(one="↵", two="", three="fn", four="", use_alternate_font=true); }
module cap_space() { cap_thumb(one="␣", two="", three="nav", four="fn", shifted=true, use_alternate_font=true); }
module cap_sym() { cap_thumb(one="sym", two="", three="altgr", four="", use_alternate_font=true); }

// --- single-cap export: children(idx) emits the idx-th cap at the origin ---
module cap_list(idx) {
    cap_q();
    cap_w();
    cap_e();
    cap_r();
    cap_t();
    cap_y();
    cap_u();
    cap_i();
    cap_o();
    cap_p();
    cap_a();
    cap_s();
    cap_d();
    cap_f();
    cap_g();
    cap_h();
    cap_j();
    cap_k();
    cap_l();
    cap_colon();
    cap_z();
    cap_x();
    cap_c();
    cap_v();
    cap_b();
    cap_n();
    cap_m();
    cap_less();
    cap_greater();
    cap_question();
    cap_shift();
    cap_backspace();
    cap_tab();
    cap_enter();
    cap_space();
    cap_sym();
    children(idx);
}

cap_index = is_undef(cap_index) ? 0 : cap_index;
cap_list(cap_index);
