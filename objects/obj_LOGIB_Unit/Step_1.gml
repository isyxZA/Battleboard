if (x_final == x_end) && (y_final == y_end) { nav_split = false; }
    else { nav_split = true; }

my_path_pos = round(path_get_length(my_path)-(path_get_length(my_path)*path_position)); 

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

if anim_select == true { 
    if anim_select_count < anim_select_timer { 
        if selected {
            if is_manning == false { scl = ease_out_quad(anim_select_count, 1.2, -0.2, anim_select_timer); }
                else { scl = ease_out_quad(anim_select_count, 0.95, -0.2, anim_select_timer); }
        }
            else {
                if is_manning == false { scl = ease_out_quad(anim_select_count, 0.8, 0.2, anim_select_timer); }
                    else { scl = ease_out_quad(anim_select_count, 0.55, 0.2, anim_select_timer); }
            }
        anim_select_count ++; 
        if anim_select_count == anim_select_timer { anim_select = false; anim_select_count = 0; }
    }
}

if is_manning == false {
	if !ds_list_empty(global.repair_list) {
	    var repair = instance_place(x_final, y_final, obj_Repair_Static);
	    if repair != noone { 
	        is_manning = true;
			manned_unit = repair.id;
	        if anim_select == false { scl = 0.75; }
	        repair.is_occupied = true;
			repair.manned_unit = id;
	    }
	        else { 
	            manned_unit = noone;
	            is_manning = false; 
	            if anim_select == false { scl = 1; }
	        }
	}
}

