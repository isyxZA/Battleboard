function scr_SupplyShip_Noone_Tab() {
	var f0;
	var f1;
	var f2;

	if p_one == true {
		f0 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			f0 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		}

	if f1 { 
	    //RE-TARGET 
	    global.fire_option = 0; 
	    global.can_zoom  = true;
	}
	    else if f2 {
	        //CANCEL
	        global.fire_option = 1; 
	        global.can_zoom  = true; 
	    }
	        else { 
	            global.fire_option = 0; 
	            global.can_zoom  = true;
	        }
            
	if mouse_check_button_released(mb_left) {
	    if f0 { 
	    }
	        else if f1 {
	            //RE-TARGET
	            //Stop drawing fire menu and display the targeting reticule
	            global.fire_display = false;
	            global.reticule_display = true;
				//Reset menu animation
				menu_anim = true;
				menu_anim_count = 0;
				menu_alpha = 0;
				menu_scl = 0;
				//Remove the surface
				if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	            queue_reset = true;
	        }
	            else if f2 { 
	                //CANCEL
	                //Stop drawing all menus
	                if global.supply_ship != noone { global.supply_ship.selected = false; }
	                global.fire_display = false;
	                global.reticule_display = false;
	                global.menu_create = false;
					//Reset menu animation
					menu_anim = true;
					menu_anim_count = 0;
					menu_alpha = 0;
					menu_scl = 0;
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                queue_reset = true;

	            }
	}




}
