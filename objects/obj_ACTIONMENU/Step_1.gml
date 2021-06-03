//STOP RUNNING THIS EVERY STEP\\
global.total_infa   = ds_list_size(global.infa_list);
global.total_infb   = ds_list_size(global.infb_list);
global.total_mbta   = ds_list_size(global.mbta_list);
global.total_mbtb   = ds_list_size(global.mbtb_list);
global.total_laca   = ds_list_size(global.laca_list);
global.total_lacb   = ds_list_size(global.lacb_list);
global.total_lava   = ds_list_size(global.lava_list);
global.total_lavb   = ds_list_size(global.lavb_list);
global.total_logia  = ds_list_size(global.logia_list);
global.total_logib  = ds_list_size(global.logib_list);
global.total_depot  = ds_list_size(global.depot_list);
global.total_repair = ds_list_size(global.repair_list);
global.total_tow    = ds_list_size(global.tow_list);
global.total_mortar = ds_list_size(global.mortar_list);

//Set global reference position of targeting reticule
if global.fire_display != true {
    var my_tile = instance_nearest(mouse_x-global.cell_size*0.5, mouse_y-global.cell_size*0.5, obj_Game_Tile);
    global.target_x = my_tile.tile_x;
    global.target_y = my_tile.tile_y;
    display_menuinfo = false;
    display_tabinfo  = false;
}
    else if global.fire_display == true { 
        if keyboard_check_direct(global.SHOOT) {
            if !mouse_check_button(global.RMOUSE) {
				global.menu_x = mouse_x;
				global.menu_y = mouse_y;
            }
        }
    }

//Set menu position
if mouse_check_button(global.RMOUSE) {
	global.menu_x = mouse_x;
	global.menu_y = mouse_y;
}

//Hotkeys for navigation, targeting and cancelling
if !ds_list_empty(global.selected_list) { 
    //Navigation
    if keyboard_check_pressed(global.MOVE) {
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
							t_ap += pu.action_points;
	                    }
						if (t_ap-global.temp_AP) < 0 { global.navigation_error = true; }
							else { 
						        var ij;
						        for (ij=0; ij<ds_list_size(global.selected_list); ij+=1) {
						            var unit = ds_list_find_value(global.selected_list, ij);
						            with unit {
										//Remove unit from selected status
										selected = false;
										alarm[11] = 20;
										can_be_selected = false;
										ds_list_delete(global.selected_list, id);
										pX = -1;
					                    pY = -1;
										if temp_ap<=action_points {
							                //If the waypoint is not the unit's current position then allow movement
							                if move_amount > 0 {
							                    switch unit_type {
							                        case "INF_A":
													case "INF_B":
							                        case "MBT_A":
													case "MBT_B":
							                        case "LAC_A":
													case "LAC_B":
							                        case "LAV_A":
													case "LAV_B":
							                        case "LOGI_A":
													case "LOGI_B":
							                            nav_confirmed = true;
							                            can_move = true; 
							                            count_start = true;
							                            nav_display = false;
							                            //Set final waypoint
							                            x_final = x_end;
							                            y_final = y_end;
							                            action_points  -= temp_ap;
														global.turn_AP -= temp_ap;
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
														var inf = instance_create_layer(x, y, "Units", spawn_unit);
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
											            is_manned = false;
											            x_end = x;
											            y_end = y;
											            x_final = x;
											            y_final = y;
														temp_ap = 0;
											            move_amount = 0;
											            move_max = 0;
											            nav_offset = 0;
											            mp_grid_path(my_grid, my_path, x, y, x, y, diag);
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
					select_enable = false;
					alarm[0] = 20;
					//Reset menu animation
					menu_anim = true;
					menu_anim_count = 0;
					menu_alpha = 0;
					menu_scl = 0;
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free(global.menu_surf); }
				}
			}
    }
        //Targeting
        else if keyboard_check_pressed(global.SHOOT) {
            //First make sure no menus are being displayed
            if global.fire_display == false && global.nav_menu == false && global.repair_display == false && global.reticule_display == false {
                if global.turn_AP > 0 {
					//Reset menu animation
					menu_anim = true;
					menu_anim_count = 0;
					menu_alpha = 0;
					menu_scl = 0;
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free(global.menu_surf); }
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
                                    mp_grid_path(my_grid, my_path, x, y, x, y, diag);
                                    move_amount = 0;
									move_max = 0;
									nav_offset = 0;
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
                            ds_list_clear(tabs);
							global.selected_infa   = ds_list_size(global.selected_infa_list);
							global.selected_infb   = ds_list_size(global.selected_infb_list);
							global.selected_mbta   = ds_list_size(global.selected_mbta_list);
							global.selected_mbtb   = ds_list_size(global.selected_mbtb_list);
							global.selected_laca   = ds_list_size(global.selected_laca_list);
							global.selected_lacb   = ds_list_size(global.selected_lacb_list);
							global.selected_lava   = ds_list_size(global.selected_lava_list);
							global.selected_lavb   = ds_list_size(global.selected_lavb_list);
							global.selected_logia  = ds_list_size(global.selected_logia_list);
							global.selected_logib  = ds_list_size(global.selected_logib_list);
							global.selected_depot  = ds_list_size(global.selected_depot_list);
							global.selected_repair = ds_list_size(global.selected_repair_list);
							global.selected_tow    = ds_list_size(global.selected_tow_list);
							global.selected_mortar = ds_list_size(global.selected_mortar_list);
							if global.selected_infa   != 0     { ds_list_add(tabs, "INF_A"); }
							if global.selected_infb   != 0     { ds_list_add(tabs, "INF_B"); }
							if global.selected_mbta   != 0     { ds_list_add(tabs, "MBT_A"); }
							if global.selected_mbtb   != 0     { ds_list_add(tabs, "MBT_B"); }
							if global.selected_laca   != 0     { ds_list_add(tabs, "LAC_A"); }
							if global.selected_lacb   != 0     { ds_list_add(tabs, "LAC_B"); }
							if global.selected_lava   != 0     { ds_list_add(tabs, "LAV_A"); }
							if global.selected_lavb   != 0     { ds_list_add(tabs, "LAV_B"); }
							if global.selected_logia  != 0     { ds_list_add(tabs, "LOGI_A"); }
							if global.selected_logib  != 0     { ds_list_add(tabs, "LOGI_B"); }
							if global.selected_depot  != 0     { ds_list_add(tabs, "DEPOT"); }
							if global.selected_repair != 0     { ds_list_add(tabs, "REPAIR"); }
							if global.selected_tow    != 0     { ds_list_add(tabs, "TOW"); }
							if global.selected_mortar != 0     { ds_list_add(tabs, "MORTAR"); }
							//Check if any vehicles are in a repair station
							//If there are then add a repair tab to the list
							var vi;
                            for (vi=0; vi<ds_list_size(global.selected_list); vi+=1) {
								var in_repair = false;
                                var vu = ds_list_find_value(global.selected_list, vi);
                                switch vu.unit_type {
                                    case "MBT_A":
									case "MBT_B":
		                            case "LAC_A":
									case "LAC_B":
		                            case "LAV_A":
									case "LAV_B":
		                            case "LOGI_A":
									case "LOGI_B":
                                        if vu.is_manning == true { 
											in_repair = true;
                                        }
                                        break;
                                    default:
                                        break;
                                }
								if in_repair == true { 
									ds_list_add(tabs, "REPAIR OP");
									break;
								}
                            }
							if global.supply_ship != noone { ds_list_add(tabs, "SUPPLY SHIP"); }
							if !ds_list_empty(tabs) { 
								global.ammo_tab = ds_list_find_value(tabs, 0);
							}
								else {
									global.ammo_tab = "NOONE";
								}
                            if ammo_check == false { ammo_check = true; }
	                        global.menu_x = mouse_x;
	                        global.menu_y = mouse_y;
                        }
                    }
                }
        }
            //CANCEL
            else if keyboard_check_pressed(global.CANCEL) {
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
								//Remove unit from selected status
								selected = false;
								alarm[11] = 20;
								can_be_selected = false;
								ds_list_delete(global.selected_list, id);
								pX = -1;
					            pY = -1;
                                //Reset nav positions
                                x_end = x;
                                y_end = y;
                                x_final = x;
                                y_final = y;
                                nav_display = false;
                                //Reset navigation path
                                mp_grid_path(my_grid, my_path, x, y, x, y, diag);
								temp_ap = 0;
                                move_amount = 0;
								move_max = 0;
								nav_offset = 0;
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
				if surface_exists(global.menu_surf) { surface_free(global.menu_surf); }
            }
}
	else {
		if global.supply_ship != noone {
			if keyboard_check_pressed(global.SHOOT) {
				//Display the fire/action options
                if global.fire_display ==  false { 
                    global.fire_display = true; 
					global.ammo_tab = "SUPPLY SHIP";
                    if ammo_check == false { ammo_check = true; }
	                global.menu_x = mouse_x;
	                global.menu_y = mouse_y;
                }
            }
				//CANCEL
	            else if keyboard_check_pressed(global.CANCEL) {
	                if global.fire_display     == true { global.fire_display     = false; queue_reset = true; } 
	                if global.reticule_display == true { global.reticule_display = false; } 
	                if global.menu_create      == true { global.menu_create      = false; }
					with obj_Unit_Parent { if selected == true { selected = false; } }
					//Reset menu animation
					menu_anim = true;
					menu_anim_count = 0;
					menu_alpha = 0;
					menu_scl = 0;
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free(global.menu_surf); }
	            }
		}
	}

