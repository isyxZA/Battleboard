function scr_Navigation_Tab() {
	//Create nav menu selection boxes   
	var m1;
	var m2;
	var m3;

	if p_one == true {
		m1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		m2 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		m3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			m1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			m2 = collision_rectangle(global.menu_x, global.menu_y                                     , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			m3 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		}
	
	//For visual indication of selection
	if m1 { 
	    global.menu_option = 0; 
	}
	    else if m2 { 
	        global.menu_option = 1; 
	    }
	        else if m3 {
	            global.menu_option = 2;
	        }
	            else { 
	                global.menu_option = 0; 
	            }
	if mouse_check_button_pressed(mb_left) {
	    //Actions to be executed depending on button selection
	    if m1 { 
	        //CONFIRM NAVIGATION
	        //Store waypoint, set new sprite position, start path
	        if global.my_turn == true {
	            if !ds_list_empty(global.selected_list) {
	                var i;
	                for (i=0; i<ds_list_size(global.selected_list); i+=1) {
	                    var unit = ds_list_find_value(global.selected_list, i);
	                    with unit {
	                        //Remove selection
	                        selected = false;
	                        //If the waypoint is not the unit's current position then allow movement
	                        if nav_split == true {
	                            switch unit_type {
	                                case "INFANTRY":
	                                case "TANK":
	                                case "ENGINEER":
	                                case "BTR":
	                                case "LOGI":
	                                    nav_confirmed = true;
	                                    can_move = true; 
	                                    count_start = true;
	                                    nav_display = false;
	                                    //Set final waypoint
	                                    x_final = x_end;
	                                    y_final = y_end;
	                                    action_points -= temp_ap;
										global.turn_AP -= temp_ap;
	                                    //global.turn_AP -= (move_amount*mp_cost);
	                                    alert_display = true;
	                                    alert_text = "-"+string(temp_ap)+ " AP";
	                                    alert_colour = c_red;
	                                    alarm[3] = global.tick_rate*3;
										temp_ap = 0;
	                                    move_amount = 0;
	                                    move_max = 0;
	                                    nav_offset = 0;
	                                    break;
	                                case "DEPOT":
	                                case "REPAIR":
	                                case "TOW":
	                                case "MORTAR":
										action_points -= temp_ap;
										global.turn_AP -= temp_ap;
	                                    //global.turn_AP -= (move_amount*mp_cost);
										var inf = instance_create_layer(x, y, "Units", obj_Soldier_Unit);
	                                    with inf {
											mp_grid_clear_rectangle(global.move_grid, x-40, y-40, x+40, y+40);
											my_squad = other.my_squad;
		                                    //Set final waypoint
		                                    x_final = other.x_end;
		                                    y_final = other.y_end;
		                                    x_end = other.x_end;
		                                    y_end = other.y_end;
											active = true;
											nav_confirmed = true;
		                                    can_move = true; 
		                                    count_start = true;
											action_points = other.action_points;
											alert_display = true;
		                                    alert_text = "-"+string(temp_ap)+ " AP";
		                                    alert_colour = c_red;
		                                    alarm[3] = global.tick_rate*3;
											alarm[6] = 10;
			                                //Add to squad list
			                                switch my_squad {
			                                    case "ALPHA":
			                                        ds_list_add(global.squad_alpha, id);
			                                        break;
			                                    case "BRAVO":
			                                        ds_list_add(global.squad_bravo, id);
			                                        break;
			                                    case "CHARLIE":
			                                        ds_list_add(global.squad_charlie, id);
			                                        break;
			                                    case "DELTA":
			                                        ds_list_add(global.squad_delta, id);
			                                        break;
			                                    case "ECHO":
			                                        ds_list_add(global.squad_echo, id);
			                                        break;
			                                }
										}
	                                    switch my_squad {
	                                        case "ALPHA":
	                                            ds_list_delete(global.squad_alpha, ds_list_find_index(global.squad_alpha, id));
	                                            my_squad = "NOONE";
												active = false;
	                                            break;
	                                        case "BRAVO":
	                                            ds_list_delete(global.squad_bravo, ds_list_find_index(global.squad_bravo, id));
	                                            my_squad = "NOONE";
												active = false;
	                                            break;
	                                        case "CHARLIE":
	                                            ds_list_delete(global.squad_charlie, ds_list_find_index(global.squad_charlie, id));
	                                            my_squad = "NOONE";
												active = false;
	                                            break;
	                                        case "DELTA":
	                                            ds_list_delete(global.squad_delta, ds_list_find_index(global.squad_delta, id));
	                                            my_squad = "NOONE";
												active = false;
	                                            break;
	                                        case "ECHO":
	                                            ds_list_delete(global.squad_echo, ds_list_find_index(global.squad_echo, id));
	                                            my_squad = "NOONE";
												active = false;
	                                            break;
											case "NOONE":
												active = false;
												break;
	                                    }
	                                    alarm[9] = 100;
	                                    can_be_selected = false;
	                                    is_manned = false;
	                                    x_end = x;
	                                    y_end = y;
	                                    x_final = x;
	                                    y_final = y;
										temp_ap = 0;
	                                    move_amount = 0;
	                                    move_max = 0;
	                                    nav_offset = 0;
	                                    mp_grid_path(global.move_grid, my_path, x, y, x, y, diag);
	                                    break;
	                            }
	                        }
	                    }
	                }
	            }
	            if global.temp_AP > 0 { 
	                global.draw_apcost = true; 
	                obj_CONTROL.ap_cost = global.temp_AP;
	            }
	            select_enable = false;
				//Enable path tracking
	            alarm[0] = 20;
	            //Switch off the nav menu
	            global.nav_menu = false;
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
	            //REPOSITION
	            if !ds_list_empty(global.selected_list) {
	                var i;
	                for (i=0; i<ds_list_size(global.selected_list); i+=1) {
	                    var unit = ds_list_find_value(global.selected_list, i);
	                    //With selected units
	                    with unit {
	                        //Reset nav positions
	                        x_end = x;
	                        y_end = y;
	                        x_final = x;
	                        y_final = y;
	                        //Reset navigation path
	                        mp_grid_path(global.move_grid, my_path, x, y, x, y, diag);
							temp_ap = 0;
	                        move_amount = 0;
	                        move_max = 0;
	                        nav_offset = 0;
	                    }
	                }
	            }
	            //Switch off nav menu
	            global.nav_menu = false;
				//Reset menu animation
				menu_anim = true;
				menu_anim_count = 0;
				menu_alpha = 0;
				menu_scl = 0;
				//Remove the surface
				if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	            //Return to nav select
	            global.nav_select = true;
	        }
	            else if m3 {
	                //CANCEL
	                if !ds_list_empty(global.selected_list) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_list, i);
	                        //With selected units
	                        with unit {
	                            //Reset nav positions
	                            x_end = x;
	                            y_end = y;
	                            x_final = x;
	                            y_final = y;
	                            nav_display = false;
	                            //Reset navigation path
	                            mp_grid_path(global.move_grid, my_path, x, y, x, y, diag);
								temp_ap = 0;
	                            move_amount = 0;
	                            move_max = 0;
	                            nav_offset = 0;
	                            selected = false;
	                            pX = -1;
	                            pY = -1;
	                        }
	                    }
	                }
	                select_enable = false;
	                alarm[0] = 20;
	                //Switch off nav menu
	                global.nav_menu = false;
					//Reset menu animation
					menu_anim = true;
					menu_anim_count = 0;
					menu_alpha = 0;
					menu_scl = 0;
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                //Switch off action menu
	                global.menu_create = false;
	            }
	                else  {
	                    //OUTSIDE OF MENU
	                    if !ds_list_empty(global.selected_list) {
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_list, i);
	                             //With selected units
	                            with unit {
	                                //Reset nav positions
	                                x_end = x;
	                                y_end = y;
	                                x_final = x;
	                                y_final = y;
	                                nav_display = false;
	                                //Reset navigation path
	                                mp_grid_path(global.move_grid, my_path, x, y, x, y, diag);
									temp_ap = 0;
	                                move_amount = 0;
	                                move_max = 0;
	                                nav_offset = 0;
	                                selected = false;
	                                pX = -1;
	                                pY = -1;
	                            }
	                        }
	                    }
	                    //Switch off nav menu
	                    global.nav_menu = false;
						//Reset menu animation
						menu_anim = true;
						menu_anim_count = 0;
						menu_alpha = 0;
						menu_scl = 0;
						//Remove the surface
						if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                    //Return to action menu
	                    global.menu_create = false;
	                }
	}



}
