if build_pos < 2 {
    alert_display = true;
    alert_text = "Constructing";
    alert_colour = c_red;
    can_be_manned = false;
}
    else {
        if occupy_switch == true { 
			occupy_switch = false; 
			can_be_manned = true;
			var t = instance_place(x, y, obj_Game_Tile);
			t.occupied = false;
		}
        if is_manned == false {
            alert_display = true;
            alert_text = "Unmanned";
            alert_colour = c_orange;
        }
    }

if (x_final == x_end) && (y_final == y_end) { nav_split = false; }
    else { nav_split = true; }
 
if selected { 
    if (global.nav_select == true) || (global.nav_menu == true) {
        if line_alpha >= 0.95 { fade_switch = true; }
            else if line_alpha <= 0.35 { fade_switch = false; }
        if fade_switch == true { line_alpha = lerp(line_alpha, 0, 0.025); } 
            else if fade_switch == false { line_alpha = lerp(line_alpha, 1, 0.025); }
    }
    if global.reticule_display == true {
        target_x = global.target_x;
        target_y = global.target_y;
    }
} 





