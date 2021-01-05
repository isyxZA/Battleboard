if global.keybind == false {
	if place_meeting(x,y, obj_MOUSE) {
	    if mouse_check_button_pressed(mb_left) {
	        if is_checked == false { 
	            global.edge_pan = false;
	            anim_count = 0;
	        }
	    }
	}
}

if global.edge_pan == true { is_checked = false; }
    else if global.edge_pan == false { is_checked = true; }
    
if is_checked == true { 
    if anim_count < anim_timer { 
        scl = ease_out_quad(anim_count, 0.2, 0.8, anim_timer);
        anim_count ++; 
    }
}

