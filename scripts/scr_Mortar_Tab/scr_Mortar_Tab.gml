/// @description scr_Mortar_Tab(mortar_rate, ap_cost)
/// @param mortar_rate
/// @param  ap_cost
function scr_Mortar_Tab(argument0, argument1) {

	var f0;
	var f1;
	var f2;
	var f3;

	if p_one == true {
		f0 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
		f3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*3)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			f0 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
			f3 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*2)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
		}

	var mortar_rate = argument0;
	var ap_cost     = argument1;

	if f0 {
	    global.header_highlight = true; 
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //MORTARS
	        //Select number of rounds to fire
	        //Increase by a rate of tow_rate
	        if mouse_wheel_up() { 
	            //Check if there is enough ammo available to add another amount
	            if global.mortarS_amount <= (global.mortar_ammo-mortar_rate) { 
	                //Check if there is enough turn AP for the move
	                var m_ap = (global.turn_AP-global.temp_AP);
	                if m_ap >= ap_cost {
	                    //Check total unit AP available
	                    var i;
	                    var ap = 0;
	                    if !ds_list_empty(global.selected_mortar_list) {
	                        for (i=0; i<ds_list_size(global.selected_mortar_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_mortar_list, i);
	                            if unit.can_shoot == true { ap += unit.action_points; }
	                        }
	                    }
	                    if ap >= ((global.mortarS_amount+mortar_rate)/mortar_rate)*ap_cost {
	                        //Add the rounds
	                        global.mortarS_amount += mortar_rate; 
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 4
	        if mouse_wheel_down() { 
	            if global.mortarS_amount >= mortar_rate { 
	                global.mortarS_amount -= mortar_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if global.mortarS_amount < 0 { global.mortarS_amount = 0; }
	        if global.mortarS_amount > global.mortar_ammo { global.mortarS_amount = global.mortar_ammo; }
	        //Add to temp AP cost
	        global.temp_AP = (global.mortarS_amount/mortar_rate)*ap_cost;
	        //Set menu position
	        global.fire_option = 0; 
	        //Switch off zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 {
	            //RE-TARGET
	            global.fire_option = 1; 
	            global.can_zoom  = true; 
	            global.header_highlight = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = false;
	        }
	            else if f3 {
	                //CANCEL
	                global.fire_option = 2; 
	                global.can_zoom  = true; 
	                global.header_highlight = false;
	                obj_ACTIONMENU.display_tabinfo = false;
	                obj_ACTIONMENU.display_menuinfo = false;
	            }
	                else { 
	                    //OUT OF MENU AREA
	                    //global.fire_option = 0; 
	                    global.can_zoom  = true;
	                    global.header_highlight = false;
	                    obj_ACTIONMENU.display_tabinfo = false;
	                    obj_ACTIONMENU.display_menuinfo = false;
	                }
                
	if mouse_check_button_released(mb_left) {
	    if global.my_turn == true {
	        if f0 { 
	            //Switch ammo/fire options tab
	           if global.selected_infa != 0 {
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
		                else if global.selected_mbta != 0 {
		                    global.ammo_tab = "MBT_A"; 
							//Remove the surface
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
		                    ammo_check = true;
		                }
							else if global.selected_mbtb != 0 {
			                    global.ammo_tab = "MBT_B"; 
								//Remove the surface
								if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
			                    ammo_check = true;
			                }
			                    else if global.selected_laca != 0 {
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
						                                            else {
						                                            }
	        }
	            else if f1 { 
	                //FIRE MORTARS
	                //Remove ammo cost
	                if global.mortarS_amount != 0 {
	                    var t=0;
	                    while (global.mortarS_amount >= mortar_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_mortar_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_mortar_list, i);
	                            if (u.can_shoot == true) && (u.mortar_ammo >= mortar_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    global.mortarS_amount -= mortar_rate;
	                                    if global.mortarS_amount >= 0 { 
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_mortar = true;
	                                            u.weapon       = "MORTAR";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
												if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                        }
	                                        u.shoot_amount   += 1; 
	                                        u.mortar_ammo    -= mortar_rate;
	                                        global.turn_AP   -= ap_cost;
	                                        u.action_points  -= ap_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            global.mortarS_amount = 0; 
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_mortar_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_mortar_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    global.mortarS_amount = 0;
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
	                    //CANCEL
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
	                    else if f3 { 
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
