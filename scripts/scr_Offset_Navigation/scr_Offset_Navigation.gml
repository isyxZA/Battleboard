function scr_Offset_Navigation() {
	
	//rotate mx,my left or right
	if keyboard_check_pressed(global.LSHIFT) { 
	    nav_offset -= global.cell_size; 
	    global.mouse_holdpos = false;
	    obj_MOUSE.mouse_timer = 0;
	}
	    else if keyboard_check_pressed(global.RSHIFT) { 
	        nav_offset += global.cell_size;
	        global.mouse_holdpos = false; 
	        obj_MOUSE.mouse_timer = 0;
	    }

}
