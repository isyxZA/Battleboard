if global.keybind == false {
	if place_meeting(x,y, obj_MOUSE) {
	    if mouse_check_button_pressed(mb_left) {
	        if is_checked == false { 
	            if global.vsync == true { 
	                global.vsync = false;
	                anim_count = 0;
	                if display_aa >= 12 display_reset(8, false); 
	                    else if display_aa == 6 display_reset(4, false); 
	                        else if display_aa == 2 display_reset(2, false);
	            }
	        }
	    }
	}
}

if global.vsync == true { is_checked = false; }
    else if global.vsync == false { is_checked = true; }
    
if is_checked == true { 
    if anim_count < anim_timer { 
        scl = ease_out_quad(anim_count, 0.2, 0.8, anim_timer);
        anim_count ++; 
    }
}

