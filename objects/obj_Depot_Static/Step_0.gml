//Visibilty area in fog of war
if light_size < size_target { light_size = lerp(light_size, size_target, 0.01); }
if light_strength != global.light_level { light_strength = lerp(light_strength, global.light_level, 0.005); }

if global.game_turn != 0 {
    //SET UNIT ACTIONS DURING PLAYER TURN       
    if global.my_turn == true {
        if active == true {
            if (is_manned == true) && (can_be_selected == true) {
				with obj_LogiLanding_Unit { active = true; }
                //If a menu is not being displayed then allow for unit selection/deselection
                if (global.menu_create == false) && (global.repair_display == false) && (global.nav_menu == false) {
                    //Sets top left of selection box
                    if mouse_check_button_pressed(global.LMOUSE) {
                        pX = mouse_x-6;
                        pY = mouse_y-10;
                        //Start double click check (ref obj_MOUSE)
                        if place_meeting(x, y, obj_MOUSE) { global.double_click = true; }
                    }
                    if mouse_check_button_released(global.LMOUSE){
                        //If the unit is already selected
                        if selected {
                            //If touching the mouse then stay selected
                            if place_meeting(x, y, obj_MOUSE) {
                                if global.double_click == true { 
                                    global.click_count += 1;
                                    global.dbl_click_unit = unit_type;
                                }
                            }
                                else {
                                    //If already previously selected and not picking a waypoint
                                    if keyboard_check_direct(vk_shift) { }
                                        else { if global.nav_select == false { selected = false; } }
                                }
                        }
                            else {
                                //Determine if selected or not
                                scr_ToggleSelect(pX, pY, mouse_x-6, mouse_y-10);
                            }
                    }
                    if global.can_select == true {
                        if (nav_confirmed == false) && (action_confirmed == false) && (resupplying == false) {
                            if mouse_check_button_released(global.RMOUSE){
	                            if place_meeting(x, y, obj_MOUSE) {
	                                if selected == false { 
										if action_points > 0 {
		                                    selected = true;
		                                    global.menu_create = true;
										}
											else { 
												ap_depleted = true; 
												pX = -1;
												pY = -1;
											}
	                                }
	                                    else {
		                                    pX = -1;
		                                    pY = -1;
	                                    }
	                            }
	                        }
	                            else if keyboard_check_released(global.MOVE) {
	                                if place_meeting(x, y, obj_MOUSE) {
	                                    if selected == false {
											if action_points >= mp_cost {
		                                        selected = true;
		                                        global.nav_select = true;
											}
												else { ap_depleted = true; }
	                                    }
	                                }
	                            }
	                                else if keyboard_check_released(global.SHOOT) {
	                                    if place_meeting(x, y, obj_MOUSE) {
	                                        if selected == false { 
												if action_points >= ap_cost {
		                                            selected = true;
		                                            global.menu_create = true;
		                                            global.reticule_display = true;
												}
													else { ap_depleted = true; }
	                                        }
	                                    }
	                                }
                        }
                    }
                }
                if selected {
                    //Initialize navigation selection
                    if been_selected == false {
                        //Put actions here that need to only run ONCE when selected
                        been_selected = true;
                        nav_offset = 0;
                        //Reset selection box
                        pX = -1;
                        pY = -1;
                        //Clear the previous path
                        path_clear_points(my_path);
                        //Add self to selected units list
                        ds_list_add(global.selected_list, id);
                        ds_list_add(global.selected_depot_list, id);
                    }
                    //Determine firing solution
                    if global.reticule_display == true {
                        //Check for collision with Cant_Shoot object along aiming line
                        var d = point_distance(x_end, y_end, global.target_x, global.target_y);
                        //Prevent unit from targeting self
                        if (x == global.target_x) && (y == global.target_y) { can_shoot = false; }
                            else {
                                //If the target is within range
                                if d <= action_range {
                                    //If the unit has enough action points for a shot
                                    if (global.turn_AP >= ap_cost) && (action_points >= ap_cost) {
                                        //If the unit has enough ammo for at least one round
                                        if (ammunition_ammo >= ammunition_rate) || (parts_ammo >= parts_rate) {
                                            can_shoot = true; 
                                        }
                                            else { can_shoot = false; }
                                    }
                                        else { can_shoot = false; }
                                }
                                    else { can_shoot = false; }
                            }
                    }
                        else { 
                            if can_shoot == true { can_shoot = false; } 
                        }
                }
                    else {
                        //If not selected or deselected
                        if been_selected == true {
                            been_selected = false;
                            //Disable queue 
                            in_queue = false;
                            //Remove self from selected units list
                            ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
                            ds_list_delete(global.selected_depot_list, ds_list_find_index(global.selected_depot_list, id));
							mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);
                        }
                        if can_shoot == true { can_shoot = false; }
                    }
            }
                else if is_manned == false {
                    //If selected and currently selecting a path
                    if been_selected == true {
                        //Switch off seledted
                        selected = false;
                        //Disable path drawing 
                        been_selected = false;
                        //Disable queue 
                        in_queue = false;
                        //Remove self from selected units list
                        var sl_index = ds_list_find_index(global.selected_list, id);
						if sl_index != undefined { ds_list_delete(global.selected_list, sl_index); }
                        ds_list_delete(global.selected_depot_list, ds_list_find_index(global.selected_depot_list, id));
                    }
                    if can_shoot == true { can_shoot = false; }
                }
        }
			else {
				if is_manned == false {
                    //If selected and currently selecting a path
                    if been_selected == true {
                        //Switch off seledted
                        selected = false;
                        //Disable path drawing 
                        been_selected = false;
                        //Disable queue 
                        in_queue = false;
                        //Remove self from selected units list
                        var sl_index = ds_list_find_index(global.selected_list, id);
						if sl_index != undefined { ds_list_delete(global.selected_list, sl_index); }
                        ds_list_delete(global.selected_depot_list, ds_list_find_index(global.selected_depot_list, id));
                    }
                    if can_shoot == true { can_shoot = false; }
                }
			}
    }
        else {
            //If selected and currently selecting a path
            if been_selected == true {
                //Switch off seledted
                selected = false;
                //Disable path drawing 
                been_selected = false;
                //Disable queue 
                in_queue = false;
                //Remove self from selected units list
                ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
                ds_list_delete(global.selected_depot_list, ds_list_find_index(global.selected_depot_list, id));
				if is_manned == true { mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36); }
            }
            if can_shoot == true { can_shoot = false; }
        }
}
    else {
        if path_get_number(my_path) != 0 { path_clear_points(my_path); }
    }




