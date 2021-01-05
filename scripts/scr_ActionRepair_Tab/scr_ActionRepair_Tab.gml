function scr_ActionRepair_Tab() {
	
	//Create action menu selection boxes   
	var m1;
	var m2;
	var m3;
	var m4;

	if p_one == true {
		m1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		m2 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		m3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
		m4 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*3)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			m1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			m2 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			m3 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
			m4 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*2)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
		}
	
	//For visual indication of selection (see unit end draw)
	if m1 { 
	    global.menu_option = 0; 
	}
	    else if m2 { 
	        global.menu_option = 1; 
	    }
	        else if m3 { 
	            global.menu_option = 2; 
	        }
	            else if m4 { 
	                global.menu_option = 3; 
	            }
	                else { 
	                    global.menu_option = 0; 
	                }
                
	if mouse_check_button_pressed(global.LMOUSE) {
	    //Actions to be executed depending on button selection
	    if m1 { 
	        //MOVE
	        //Check if there are movement points available
	        if global.turn_AP > 0 {
	            //Switch on navigation with selected units
	            if !ds_list_empty(global.selected_list) {
	                var i;
	                for (i=0; i<ds_list_size(global.selected_list); i+=1) {
	                    var unit = ds_list_find_value(global.selected_list, i);
	                    with unit {
	                        if action_points >= mp_cost {
	                            global.nav_select = true;
	                            nav_display = true;
	                            //Put navigation on a timer to prevent jittering
	                            if nav_allow == false { nav_allow = true; }
	                        }
	                            else { 
	                                ap_depleted = true;
	                                selected = false; 
	                            }
	                    }
	                }
	            }
	            //Switch menu to false
	            global.menu_create = false;
				//Reset menu animation
				menu_anim = true;
				menu_anim_count = 0;
				menu_alpha = 0;
				menu_scl = 0;
				//Remove the surface
				if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	        }
	    }
	        else if m2 {
	            //TARGET
	            //Display targeting reticule
	            if global.turn_AP > 0 {
	                if !ds_list_empty(global.selected_list) {
	                    var ii;
	                    for (ii=0; ii<ds_list_size(global.selected_list); ii+=1) {
	                        var unit = ds_list_find_value(global.selected_list, ii);
	                        if (unit.action_points > 0) { 
	                            if global.reticule_display == false { global.reticule_display = true; } 
	                            unit.ammo_check = true;
	                        }
	                            else { 
	                                unit.ap_depleted = true;
	                                unit.selected = false; 
	                            }
	                    }
						//Reset menu animation
						menu_anim = true;
						menu_anim_count = 0;
						menu_alpha = 0;
						menu_scl = 0;
						//Remove the surface
						if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                }
	            }
	        }
	            else if m3 {
	                //REPAIR
	                if global.turn_AP > 0 {
	                    if !ds_list_empty(global.selected_list) {
	                        var iii;
	                        for (iii=0; iii<ds_list_size(global.selected_list); iii+=1) {
	                            var unit = ds_list_find_value(global.selected_list, iii);
								//For vehicles currently selected and in a repair station
	                            if unit.manned_unit != noone {
	                                if unit.action_points > 0 { 
										//Check parts levels of the occupied repair station
	                                    unit.manned_unit.ammo_check = true;
										//Enable the repair menu
	                                    global.repair_display = true;
	                                }
	                                    else { 
	                                        unit.ap_depleted = true;
	                                        if unit.selected == true { unit.selected = false; } 
	                                    }
	                            }
	                                else { 
	                                    unit.selected = false; 
	                                }
	                        }
							//Disable action menu
	                        global.menu_create = false;
							//Reset menu animation
							menu_anim = true;
							menu_anim_count = 0;
							menu_alpha = 0;
							menu_scl = 0;
							//Remove the surface
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                    }
	                }
	            }
	                else if m4 {
	                    //CANCEL
						with obj_Unit_Parent { if selected == true { selected = false; } }
	                    global.menu_create = false;
						//Reset menu animation
						menu_anim = true;
						menu_anim_count = 0;
						menu_alpha = 0;
						menu_scl = 0;
						//Remove the surface
						if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                }
	                    else {
	                        //When clicked outside of menu area
							with obj_Unit_Parent { if selected == true { selected = false; } }
	                        global.menu_create = false;
							//Reset menu animation
							menu_anim = true;
							menu_anim_count = 0;
							menu_alpha = 0;
							menu_scl = 0;
							//Remove the surface
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                    }
	    }

}
