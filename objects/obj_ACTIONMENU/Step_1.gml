global.selected_infantry = ds_list_size(global.selected_infantry_list);
global.selected_tank     = ds_list_size(global.selected_tank_list);
global.selected_engineer = ds_list_size(global.selected_engineer_list);
global.selected_btr      = ds_list_size(global.selected_btr_list);
global.selected_logi     = ds_list_size(global.selected_logi_list);
global.selected_depot    = ds_list_size(global.selected_depot_list);
global.selected_repair   = ds_list_size(global.selected_repair_list);
global.selected_tow      = ds_list_size(global.selected_tow_list);
global.selected_mortar   = ds_list_size(global.selected_mortar_list);

global.total_infantry = ds_list_size(global.infantry_list);
global.total_tank     = ds_list_size(global.tank_list);
global.total_engineer = ds_list_size(global.engineer_list);
global.total_btr      = ds_list_size(global.btr_list);
global.total_logi     = ds_list_size(global.logi_list);
global.total_depot    = ds_list_size(global.depot_list);
global.total_repair   = ds_list_size(global.repair_list);
global.total_tow      = ds_list_size(global.tow_list);
global.total_mortar   = ds_list_size(global.mortar_list);


//Set global reference position of targeting reticule
if global.fire_display != true {
    var my_tile = instance_nearest(mouse_x-global.cell_size*0.5, mouse_y-global.cell_size*0.5, obj_Game_Tile);
    global.target_x = my_tile.tile_x;
    global.target_y = my_tile.tile_y;
    display_menuinfo = false;
    display_tabinfo  = false;
}
    else if global.fire_display == true { 
        if keyboard_check_direct(ord("Q")) {
            if !mouse_check_button(mb_right) {
				global.menu_x = mouse_x;
				global.menu_y = mouse_y;
            }
        }
    }

//Set menu position
if mouse_check_button(mb_right) {
	global.menu_x = mouse_x;
	global.menu_y = mouse_y;
}

//Hotkeys for navigation, targeting and cancelling
if !ds_list_empty(global.selected_list) { 
    //Navigation
    if keyboard_check_pressed(ord("E")) {
        //First make sure no menus are being displayed
        if global.nav_menu == false && global.repair_display == false && global.nav_select == false && global.fire_display == false {
            if global.turn_AP > 0 {
                if global.reticule_display == true { global.reticule_display = false; } 
                if global.menu_create == true { global.menu_create = false; }
                if global.mouse_holdpos == true { 
                    global.mouse_holdpos = false; 
                    obj_MOUSE.mouse_timer = 0;
                }
                //MOVE
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
            }
                else {
                    //No AP available
                }
        }
            else if global.nav_select == true {
				//Make sure mp cost is within limits 
				//Confirm Navigation
				//Store waypoint, set new sprite position, start path
				if global.my_turn == true {
				    if !ds_list_empty(global.selected_list) {
						var t_ap = 0;
	                    var li;
	                    //global.temp_AP = 0;
	                    for (li=0; li<ds_list_size(global.selected_list); li+=1) {
	                        var pu = ds_list_find_value(global.selected_list, li);
							//global.temp_AP += pu.temp_ap;
							t_ap += pu.action_points;
	                    }
						if (t_ap-global.temp_AP) < 0 { global.navigation_error = true; }
							else { 
						        var i;
						        for (i=0; i<ds_list_size(global.selected_list); i+=1) {
						            var unit = ds_list_find_value(global.selected_list, i);
						            with unit {
										if temp_ap<=action_points {
							                //Remove selection
							                selected = false;
							                //If the waypoint is not the unit's current position then allow movement
							                if move_amount > 0 {
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
							                            action_points  -= temp_ap;
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
														//Check for enemy units in view range
											            alarm[9] = 100;
											            can_be_selected = false;
														//Remove self from selected units list
														ds_list_delete(global.selected_list, ds_list_find_index(global.selected_list, id));
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
						}
				    }
				    if global.temp_AP > 0 { 
				        global.draw_apcost = true; 
				        obj_CONTROL.ap_cost = global.temp_AP;
				    }
				    global.nav_select = false;
					//Reset menu animation
					menu_anim = true;
					menu_anim_count = 0;
					menu_alpha = 0;
					menu_scl = 0;
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				    select_enable = false;
				    alarm[0] = 20;
				}
			}
    }
        //Targeting
        else if keyboard_check_pressed(ord("Q")) {
            //First make sure no menus are being displayed
            if global.fire_display == false && global.nav_menu == false && global.repair_display == false && global.reticule_display == false {
                if global.turn_AP > 0 {
                    global.menu_create = true;
                    global.reticule_display = true;
                    if global.nav_select == true {
                        global.nav_select = false;
                        //RESET NAVIGATION
                        if !ds_list_empty(global.selected_list) {
                            var i;
                            for (i=0; i<ds_list_size(global.selected_list); i+=1) {
                                var u1 = ds_list_find_value(global.selected_list, i);
                                //With selected units
                                with u1 {
                                    //Reset nav positions
                                    x_end = x;
                                    y_end = y;
                                    x_final = x;
                                    y_final = y;
                                    nav_display = false;
                                    //Reset navigation path
                                    mp_grid_path(global.move_grid, my_path, x, y, x, y, diag);
                                    move_amount = 0;
									move_max = 0;
									mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);
                                }
                            }
                        }
                    } 
                    //TARGET
                    //Display targeting reticule  
                    if !ds_list_empty(global.selected_list) {
                        var ii;
                        for (ii=0; ii<ds_list_size(global.selected_list); ii+=1) {
                            var u2 = ds_list_find_value(global.selected_list, ii);
                            if (u2.action_points > 0) { 
                                u2.ammo_check = true;
                            }
                                else { 
                                    u2.ap_depleted = true;
                                    u2.selected = false; 
                                }
                        }
                    }
                }
                    else {
                        //No AP available
                    }
            }
                else if global.reticule_display == true {
                    if global.my_turn == true {
                        //Display the fire/action options
                        if global.fire_display ==  false { 
                            global.fire_display = true; 
                            if global.selected_infantry != 0 { global.ammo_tab = "INFANTRY"; }
                                else if global.selected_tank != 0 { global.ammo_tab = "TANK"; }
                                    else if global.selected_engineer != 0 { global.ammo_tab = "ENGINEER"; }
                                        else if global.selected_btr != 0 { global.ammo_tab = "BTR"; }
                                            else if global.selected_logi != 0 { global.ammo_tab = "LOGI"; }
                                                else if global.selected_depot != 0 { global.ammo_tab = "DEPOT"; }
                                                    else if global.selected_repair != 0 { global.ammo_tab = "REPAIR"; }
                                                        else if global.selected_tow != 0 { global.ammo_tab = "TOW"; }
                                                            else if global.selected_mortar != 0 { global.ammo_tab = "MORTAR"; }
                                                                else if global.supply_ship != noone { global.ammo_tab = "SUPPLY SHIP"; }
                                                                    else { global.ammo_tab = "NOONE"; }
                        
                            if ammo_check == false { ammo_check = true; }
	                        global.menu_x = mouse_x;
	                        global.menu_y = mouse_y;
                        }
                    }
                }
        }
            //CANCEL
            else if keyboard_check_pressed(ord("X")) {
                if global.fire_display     == true { global.fire_display     = false; queue_reset = true; } 
                if global.reticule_display == true { global.reticule_display = false; } 
                if global.menu_create      == true { global.menu_create      = false; }
                if global.repair_display   == true { global.repair_display   = false; }
                if global.nav_select == true || global.nav_menu == true {
                    global.nav_select = false;
                    global.nav_menu = false;
                    //RESET NAVIGATION
                    if !ds_list_empty(global.selected_list) {
                        var iii;
                        for (iii=0; iii<ds_list_size(global.selected_list); iii+=1) {
                            var u3 = ds_list_find_value(global.selected_list, iii);
                            //With selected units
                            with u3 {
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
                            }
                        }
                    }
                } 
                with obj_Unit_Parent { if selected == true { selected = false; } }
				//Reset menu animation
				menu_anim = true;
				menu_anim_count = 0;
				menu_alpha = 0;
				menu_scl = 0;
				//Remove the surface
				if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
            }
}











