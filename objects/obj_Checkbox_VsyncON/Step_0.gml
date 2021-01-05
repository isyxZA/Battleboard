if global.keybind == false {
	if place_meeting(x,y, obj_MOUSE) {
	    if mouse_check_button_pressed(mb_left) {
	        if is_checked == false { 
	            if global.vsync == false { 
	                global.vsync = true;
	                anim_count = 0;
	                if display_aa >= 12 display_reset(8, true); 
	                    else if display_aa == 6 display_reset(4, true); 
	                        else if display_aa == 2 display_reset(2, true); 
	            }
	        }
	    }
	}
}

if global.vsync == true { is_checked = true; } 
    else if global.vsync == false { is_checked = false; }
    
if is_checked == true { 
    if anim_count < anim_timer { 
        scl = ease_out_quad(anim_count, 0.2, 0.8, anim_timer);
        anim_count ++; 
    }
}

