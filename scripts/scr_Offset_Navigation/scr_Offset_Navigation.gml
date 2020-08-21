function scr_Offset_Navigation() {
	//Use X and C keys to rotate mx,my left or right

	if keyboard_check_pressed(ord("Z")) { 
	    nav_offset -= global.cell_size; 
	    global.mouse_holdpos = false;
	    obj_MOUSE.mouse_timer = 0;
	}
	    else if keyboard_check_pressed(ord("C")) { 
	        nav_offset += global.cell_size;
	        global.mouse_holdpos = false; 
	        obj_MOUSE.mouse_timer = 0;
	    }



}
