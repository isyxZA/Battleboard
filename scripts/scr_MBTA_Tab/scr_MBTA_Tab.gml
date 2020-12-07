/// @description scr_MBTA_Tab(cannon_rate, mg_rate, cannon_cost, mg_cost)
/// @param cannon_rate
/// @param  mg_rate
/// @param  cannon_cost
/// @param  mg_cost
function scr_MBTA_Tab(argument0, argument1, argument2, argument3) {

	var f0;
	var f1;
	var f2;
	var f3;
	var f4;

	if p_one == true {
		f0 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
		f3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*3)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
		f4 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*4)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			f0 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
			f3 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*2)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
			f4 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*3)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
		}

	var cannon_rate = argument0;;
	var mg_rate     = argument1;
	var cannon_cost = argument2;
	var mg_cost     = argument3;

	if f0 { 
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //CANNON
	        //Select number of rounds to fire
	        //Increase by a rate of 1
	        if mouse_wheel_up() { 
	            //Check if there is enough ammo available
	            if global.mbt_ap_amount <= (global.mbt_ap_ammo-cannon_rate) { 
	                //Check if there is enough turn AP for the move
	                var m_ap = (global.turn_AP-global.temp_AP);
	                if m_ap >= cannon_cost {
	                    //Check total unit AP available
	                    var i;
	                    var ap = 0;
	                    if !ds_list_empty(global.selected_mbta_list) {
	                        for (i=0; i<ds_list_size(global.selected_mbta_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_mbta_list, i);
	                            if unit.can_shoot == true { ap += unit.action_points; }
	                        }
	                    }
	                    if ap >= ((global.mbt_ap_amount+cannon_rate)/cannon_rate)*cannon_cost {
	                            //Add the rounds
	                            global.mbt_ap_amount += cannon_rate; 
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 1
	        if mouse_wheel_down() { 
	            if global.mbt_ap_amount >= cannon_rate { 
	                global.mbt_ap_amount -= cannon_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if global.mbt_ap_amount < 0 { global.mbt_ap_amount = 0; }
	        if global.mbt_ap_amount > global.mbt_ap_ammo { global.mbt_ap_amount = global.mbt_ap_ammo; }
	        //Add to temp AP cost
	        global.temp_AP = (global.mbt_ap_amount/cannon_rate)*cannon_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 { 
	            //MG
	            //Select number of rounds to fire
	            //Increase by a rate of 4
	            if mouse_wheel_up() { 
	                //Check if there is enough ammo available
	                if global.mbt_mg_amount <= (global.mbt_mg_ammo-mg_rate) { 
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >=  mg_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_mbta_list) {
	                            for (i=0; i<ds_list_size(global.selected_mbta_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_mbta_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((global.mbt_mg_amount+mg_rate)/mg_rate)*mg_cost {
	                            //Add the rounds
	                            global.mbt_mg_amount += mg_rate; 
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 4
	            if mouse_wheel_down() { 
	                if global.mbt_mg_amount >= mg_rate { 
	                    global.mbt_mg_amount -= mg_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if global.mbt_mg_amount < 0 { global.mbt_mg_amount = 0; }
	            if global.mbt_mg_amount > global.mbt_mg_ammo { global.mbt_mg_amount = global.mbt_mg_ammo; }
	            //Add to temp AP cost
	            global.temp_AP = (global.mbt_mg_amount/mg_rate)*mg_cost;
	            global.fire_option = 1;
	            global.can_zoom  = false;
	            global.header_highlight = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = true;
	        }
	            else if f3 { 
	                //RE-TARGET
	                global.fire_option = 2; 
	                global.can_zoom  = true;
	                global.header_highlight = false;
	                obj_ACTIONMENU.display_tabinfo = false;
	                obj_ACTIONMENU.display_menuinfo = false;
	            }
	                else if f4 { 
	                    //CANCEL
	                    global.fire_option = 3; 
	                    global.can_zoom  = true;
	                    global.header_highlight = false;
	                    obj_ACTIONMENU.display_tabinfo = false;
	                    obj_ACTIONMENU.display_menuinfo = false;
	                }
	                    else { 
	                        //OUT OF MENU AREA
	                        global.fire_option = 0; 
	                        global.can_zoom  = true;
	                        global.header_highlight = false;
	                        obj_ACTIONMENU.display_tabinfo = false;
	                        obj_ACTIONMENU.display_menuinfo = false;
	                    }
            
	if mouse_check_button_released(mb_left) {
	    if global.my_turn == true {
	        if f0 { 
	             //Switch ammo tab/fire options
	            if global.selected_laca != 0 {
	                global.ammo_tab = "LAC_A"; 
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                ammo_check = true;
	            }
					else if global.selected_lacb != 0 {
			            global.ammo_tab = "LAC_B"; 
						//Remove the surface
						if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
			            ammo_check = true;
			        }
		                else if global.selected_lava != 0 {
		                    global.ammo_tab = "LAV_A"; 
							//Remove the surface
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                    ammo_check = true;
		                }
							else if global.selected_lavb != 0 {
			                    global.ammo_tab = "LAV_B"; 
								//Remove the surface
								if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
			                    ammo_check = true;
			                }
			                    else if global.selected_logia != 0 {
			                        global.ammo_tab = "LOGI_A"; 
									//Remove the surface
									if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
			                        ammo_check = true;
			                    }
									else if global.selected_logib != 0 {
				                        global.ammo_tab = "LOGI_B"; 
										//Remove the surface
										if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				                        ammo_check = true;
				                    }
				                        else if global.selected_depot != 0 {
				                            global.ammo_tab = "DEPOT";
											//Remove the surface
											if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				                            ammo_check = true;
				                        }
				                            else if global.selected_repair != 0 {
				                                global.ammo_tab = "REPAIR";
												//Remove the surface
												if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				                                ammo_check = true;
				                            }
				                                else if global.selected_tow != 0 {
				                                    global.ammo_tab = "TOW";
													//Remove the surface
													if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				                                    ammo_check = true;
				                                }
				                                    else if global.selected_mortar != 0 {
				                                        global.ammo_tab = "MORTAR";
														//Remove the surface
														if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				                                        ammo_check = true;
				                                    }
				                                        else if global.selected_infa != 0 {
				                                            global.ammo_tab = "INF_A"; 
															//Remove the surface
															if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				                                            ammo_check = true;
				                                        }
															else if global.selected_infb != 0 {
					                                            global.ammo_tab = "INF_B"; 
																//Remove the surface
																if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
					                                            ammo_check = true;
					                                        }
					                                            else {
					                                                }
	        }
	            else if f1 { 
	                //FIRE MAIN CANNON
	                //Remove ammo cost
	                if global.mbt_ap_amount != 0 {
	                    var t=0;
	                    while (global.mbt_ap_amount >= cannon_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_mbta_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_mbta_list, i);
	                            if (u.can_shoot == true) && (u.cannon_ammo >= cannon_rate) {
	                                if (u.action_points >= cannon_cost) {
	                                    global.mbt_ap_amount -= cannon_rate;
	                                    if global.mbt_ap_amount >= 0 {
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_cannon = true;
	                                            u.weapon   = "CANNON";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
												if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                        }
	                                        u.shoot_amount   += 1; 
	                                        u.cannon_ammo    -= cannon_rate;
	                                        global.turn_AP   -= cannon_cost;
	                                        u.action_points  -= cannon_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*cannon_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            global.mbt_ap_amount = 0; 
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_mbta_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_mbta_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    global.mbt_ap_amount = 0;
	                }
	                    else { 
	                        global.menu_create = false;
	                        global.reticule_display = false; 
							//Reset menu animation
							menu_anim = true;
							menu_anim_count = 0;
							menu_alpha = 0;
							menu_scl = 0;
							//Remove the surface
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                    }
	                if global.temp_AP > 0 { 
	                    global.draw_apcost = true; 
	                    obj_CONTROL.ap_cost = global.temp_AP;
	                }
	                global.fire_display = false;
	                global.can_zoom  = true;
	                queue_reset = true;
	            }
	                else if f2 { 
	                    //FIRE MACHINE GUN
	                    //Remove ammo cost
	                    if global.mbt_mg_amount != 0 {
	                        var t=0;
	                        while (global.mbt_mg_amount >= mg_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_mbta_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_mbta_list, i);
	                                if (u.can_shoot == true) && (u.mg_ammo >= mg_rate) {
	                                    if (u.action_points >= mg_cost) {
	                                        global.mbt_mg_amount -= mg_rate;
	                                        if global.mbt_mg_amount >= 0 {
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_mg = true;
	                                                u.weapon   = "MG";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
													if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                            }
	                                            u.shoot_amount   += 1; 
	                                            u.mg_ammo        -= mg_rate;
	                                            global.turn_AP   -= mg_cost;
	                                            u.action_points  -= mg_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*mg_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                global.mbt_mg_amount = 0;
	                                global.targeting_error = true;
	                            } 
	                        }
	                    }
	                    //Hold shift to keep targeting
	                    if keyboard_check_direct(vk_shift) {
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_mbta_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_mbta_list, i);
	                            with unit { if action_confirmed == true { selected = false; } }
	                        }
	                        ammo_check = true;
	                        global.mbt_mg_amount = 0;
	                        //window_mouse_set(window_get_width() / 2, window_get_height() / 2);
	                    }
	                        else { 
	                            global.menu_create = false;
	                            global.reticule_display = false; 
								//Reset menu animation
								menu_anim = true;
								menu_anim_count = 0;
								menu_alpha = 0;
								menu_scl = 0;
								//Remove the surface
								if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                        }
	                    if global.temp_AP > 0 { 
	                        global.draw_apcost = true; 
	                        obj_CONTROL.ap_cost = global.temp_AP;
	                    }
	                    global.fire_display = false;
	                    global.can_zoom  = true;
	                    queue_reset = true;
	                }
	                    else if f3 { 
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
	                        else if f4 { 
	                            //CANCEL
	                            //Stop drawing all menus
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



}
