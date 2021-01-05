/// @description scr_LAVA_Tab(he_rate, ap_rate, mg_rate, tow_rate, sqd_rate, he_cost, ap_cost, mg_cost, tow_cost, sqd_cost)
/// @param he_rate
/// @param ap_rate
/// @param mg_rate
/// @param tow_rate
/// @param sqd_rate
/// @param he_cost
/// @param ap_cost
/// @param mg_cost
/// @param tow_cost
/// @param sqd_cost


function scr_LAVA_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	var f0;
	var f1;
	var f2;
	var f3;
	var f4;
	var f5;
	var f6;
	var f7;

	if p_one == true {
		f0 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
		f3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*3)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
		f4 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*4)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
		f5 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*5)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*6)*global.menu_ratio, obj_MOUSE, false, false);
		f6 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*6)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*7)*global.menu_ratio, obj_MOUSE, false, false);
		f7 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*7)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*8)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			f0 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
			f3 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*2)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
			f4 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*3)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
			f5 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*4)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
			f6 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*5)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*6)*global.menu_ratio, obj_MOUSE, false, false);
			f7 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*6)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*7)*global.menu_ratio, obj_MOUSE, false, false);
		}

	var he_rate  = argument0;
	var ap_rate  = argument1;
	var mg_rate  = argument2;
	var tow_rate = argument3;
	var sqd_rate = argument4;
	var he_cost  = argument5;
	var ap_cost  = argument6;
	var mg_cost  = argument7;
	var tow_cost = argument8;
	var sqd_cost = argument9;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //Select number of rounds to fire HE
	        //Increase by a rate of 1
	        if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
	            //Check if there is enough ammo available
	            if lava_he_amount <= (lava_he_ammo-he_rate) { 
	                //Check if there is enough turn AP for the move
	                var m_ap = (global.turn_AP-global.temp_AP);
	                if m_ap >=  he_cost {
	                    //Check total unit AP available
	                    var i;
	                    var ap = 0;
	                    if !ds_list_empty(global.selected_lava_list) {
	                        for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_lava_list, i);
	                            if unit.can_shoot == true { ap += unit.action_points; }
	                        }
	                    }
	                    if ap >= ((lava_he_amount+he_rate)/he_rate)*he_cost {
	                        //Add the rounds
	                        lava_he_amount += he_rate; 
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 1
	        if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
	            if lava_he_amount >= he_rate { 
	                lava_he_amount -= he_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if lava_he_amount < 0 { lava_he_amount = 0; }
	        if lava_he_amount > lava_he_ammo { lava_he_amount = lava_he_ammo; }
	        //Add to temp AP cost
	        global.temp_AP = (lava_he_amount/he_rate)*he_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 { 
	            //Select number of rounds to fire AP
	            //Increase by a rate of 1
	            if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
	                //Check if there is enough ammo available
	                if lava_ap_amount <= (lava_ap_ammo-ap_rate) { 
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >=  ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_lava_list) {
	                            for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_lava_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((lava_ap_amount+ap_rate)/ap_rate)*ap_cost {
	                            //Add the rounds
	                            lava_ap_amount += ap_rate; 
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 1
	            if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
	                if lava_ap_amount >= ap_rate { 
	                    lava_ap_amount -= ap_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if lava_ap_amount < 0 { lava_ap_amount = 0; }
	            if lava_ap_amount > lava_ap_ammo { lava_ap_amount = lava_ap_ammo; }
	            //Add to temp AP cost
	            global.temp_AP = (lava_ap_amount/ap_rate)*ap_cost;
	            //Set the menu position
	            global.fire_option = 1; 
	            //Switch off camera zoom
	            global.can_zoom  = false;
	            global.header_highlight = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = true;
	        }
				else if f3 { 
		            //Select number of rounds to fire MG
		            //Increase by a rate of 1
		            if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
		                //Check if there is enough ammo available
		                if lava_mg_amount <= (lava_mg_ammo-mg_rate) { 
		                    //Check if there is enough turn AP for the move
		                    var m_ap = (global.turn_AP-global.temp_AP);
		                    if m_ap >=  mg_cost {
		                        //Check total unit AP available
		                        var i;
		                        var ap = 0;
		                        if !ds_list_empty(global.selected_lava_list) {
		                            for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
		                                var unit = ds_list_find_value(global.selected_lava_list, i);
		                                if unit.can_shoot == true { ap += unit.action_points; }
		                            }
		                        }
		                        if ap >= ((lava_mg_amount+mg_rate)/mg_rate)*mg_cost {
		                            //Add the rounds
		                            lava_mg_amount += mg_rate; 
		                        }
		                    }
		                } 
		            }
		            //Decrease by a rate of 1
		            if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
		                if lava_mg_amount >= mg_rate { 
		                    lava_mg_amount -= mg_rate; 
		                } 
		            }
		            //Clamp the value between zero and the max available rounds
		            if lava_mg_amount < 0 { lava_mg_amount = 0; }
		            if lava_mg_amount > lava_mg_ammo { lava_mg_amount = lava_mg_ammo; }
		            //Add to temp AP cost
		            global.temp_AP = (lava_mg_amount/mg_rate)*mg_cost;
		            //Set the menu position
		            global.fire_option = 2; 
		            //Switch off camera zoom
		            global.can_zoom  = false;
		            global.header_highlight = false;
		            obj_ACTIONMENU.display_tabinfo = false;
		            obj_ACTIONMENU.display_menuinfo = true;
		        }
					else if f4 { 
			            //Select number of rounds to fire TOW
			            //Increase by a rate of 1
			            if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
			                //Check if there is enough ammo available
			                if lava_at_amount <= (lava_at_ammo-tow_rate) { 
			                    //Check if there is enough turn AP for the move
			                    var m_ap = (global.turn_AP-global.temp_AP);
			                    if m_ap >=  tow_cost {
			                        //Check total unit AP available
			                        var i;
			                        var ap = 0;
			                        if !ds_list_empty(global.selected_lava_list) {
			                            for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
			                                var unit = ds_list_find_value(global.selected_lava_list, i);
			                                if unit.can_shoot == true { ap += unit.action_points; }
			                            }
			                        }
			                        if ap >= ((lava_at_amount+tow_rate)/tow_rate)*tow_cost {
			                            //Add the rounds
			                            lava_at_amount += tow_rate; 
			                        }
			                    }
			                } 
			            }
			            //Decrease by a rate of 1
			            if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
			                if lava_at_amount >= tow_rate { 
			                    lava_at_amount -= tow_rate; 
			                } 
			            }
			            //Clamp the value between zero and the max available rounds
			            if lava_at_amount < 0 { lava_at_amount = 0; }
			            if lava_at_amount > lava_at_ammo { lava_at_amount = lava_at_ammo; }
			            //Add to temp AP cost
			            global.temp_AP = (lava_at_amount/tow_rate)*tow_cost;
			            //Set the menu position
			            global.fire_option = 3; 
			            //Switch off camera zoom
			            global.can_zoom  = false;
			            global.header_highlight = false;
			            obj_ACTIONMENU.display_tabinfo = false;
			            obj_ACTIONMENU.display_menuinfo = true;
			        }
						else if f5 { 
				            //Select squad to disembark
				            //Increase by a rate of 1
				            if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
								if tile_empty == true {
							        //Check if there is enough ammo available
							        if lava_sq_amount <= (lava_sq_ammo-sqd_rate) { 
							            //Check if there is enough turn AP for the move
							            var m_ap = (global.turn_AP-global.temp_AP);
							            if m_ap >=  sqd_cost {
							                //Check total unit AP available
							                var i;
							                var ap = 0;
							                if !ds_list_empty(global.selected_lava_list) {
							                    for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
							                        var unit = ds_list_find_value(global.selected_lava_list, i);
													var sl = point_distance(unit.x, unit.y, global.target_x, global.target_y);
							                        if (unit.can_shoot == true) && (sl <= 136)  { 
														ap += unit.action_points;
													}
							                    }
							                }
							                if ap >= (lava_sq_amount+sqd_rate)*sqd_cost {
							                    //Add the rounds
												lava_sq_amount += sqd_rate;
							                }
							            }
							        } 
								}
									else { lava_sq_amount = 0; }
				            }
				            //Decrease by a rate of 1
				            if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
				                if lava_sq_amount >= sqd_rate { 
				                    lava_sq_amount -= sqd_rate; 
				                } 
				            }
				            //Clamp the value between zero and the max available rounds
				            if lava_sq_amount < 0 { lava_sq_amount = 0; }
				            if lava_sq_amount > 1 { lava_sq_amount = 1; }
				            //Add to temp AP cost
				            global.temp_AP = (lava_sq_amount/sqd_rate)*sqd_cost;
				            //Set the menu position
				            global.fire_option = 4; 
				            //Switch off camera zoom
				            global.can_zoom  = false;
				            global.header_highlight = false;
				            obj_ACTIONMENU.display_tabinfo = false;
				            obj_ACTIONMENU.display_menuinfo = true;
				        }
				            else if f6 { 
				                //RE-TARGET
				                global.fire_option = 5; 
				                global.can_zoom  = true;
				                global.header_highlight = false;
				                obj_ACTIONMENU.display_tabinfo = false;
				                obj_ACTIONMENU.display_menuinfo = false;
				            }
				                else if f7 { 
				                    //CANCEL
				                    global.fire_option = 6; 
				                    global.can_zoom  = true;
				                    global.header_highlight = false;
				                    obj_ACTIONMENU.display_tabinfo = false;
				                    obj_ACTIONMENU.display_menuinfo = false;
				                }
				                    else { 
				                        //global.fire_option = 0; 
				                        global.can_zoom  = true;
				                        global.header_highlight = false;
				                        obj_ACTIONMENU.display_tabinfo = false;
				                        obj_ACTIONMENU.display_menuinfo = false;
				                    }
            
	if mouse_check_button_pressed(global.LMOUSE) {
	    if global.my_turn == true {
	        if f0 { 
	            //Switch ammo/fire options tab
				if ds_list_size(tabs) > 1 {
					var t_size = ds_list_size(tabs)-1;
					if tab_count < t_size { tab_count += 1; }
						else { tab_count = 0; }
					global.ammo_tab = ds_list_find_value(tabs, tab_count);
					lava_he_amount = 0;
			        lava_ap_amount = 0;
					lava_mg_amount = 0;
					lava_at_amount = 0;
					lava_sq_amount = 0;
					//Reset menu animation
					menu_anim = true;
					menu_anim_count = 0;
					menu_alpha = 0;
					menu_scl = 0;
					//Remove the surface
					if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
				}
	        }
	            else if f1 { 
	                //FIRE HIGH EXPLOSIVE ROUND
	                //Remove ammo cost
	                if lava_he_amount != 0 {
	                    var t=0;
	                    while (lava_he_amount >= he_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_lava_list, i);
	                                if (u.can_shoot == true) && (u.he_ammo >= he_rate) {
	                                    if (u.action_points >= he_cost) {
	                                        lava_he_amount -= he_rate;
	                                        if lava_he_amount >= 0 {
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_he = true;
	                                                u.weapon   = "HE";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
													if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                            }
	                                            u.shoot_amount   += 1; 
	                                            u.he_ammo        -= he_rate;
	                                            global.turn_AP   -= he_cost;
	                                            u.action_points  -= he_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*he_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                        }
	                        if t >= 200 { 
	                            lava_he_amount = 0; 
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_lava_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    lava_he_amount = 0;
	                }
	                    else { 
							//Deselect all units
							if !ds_list_empty(global.selected_list) {
								scr_DeselectAll();
							}
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
	                    //FIRE ARMOR PIERCING ROUND
	                    //Remove ammo cost
	                    if lava_ap_amount != 0 {
	                        var t=0;
	                        while (lava_ap_amount >= ap_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_lava_list, i);
	                                if (u.can_shoot == true) && (u.ap_ammo >= ap_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        lava_ap_amount -= ap_rate;
	                                        if lava_ap_amount >= 0 { 
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_ap = true;
	                                                u.weapon = "AP";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
													if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                            }
	                                            u.shoot_amount   += 1; 
	                                            u.ap_ammo        -= ap_rate;
	                                            global.turn_AP   -= ap_cost;
	                                            u.action_points  -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                lava_ap_amount = 0;
	                                global.targeting_error = true;
	                            } 
	                        }
	                    }
	                    //Hold shift to keep targeting
	                    if keyboard_check_direct(vk_shift) {
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_lava_list, i);
	                            with unit { if action_confirmed == true { selected = false; } }
	                        }
	                        ammo_check = true;
	                        lava_ap_amount = 0;
	                    }
	                        else { 
								//Deselect all units
								if !ds_list_empty(global.selected_list) {
									scr_DeselectAll();
								}
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
		                    //FIRE MACHINE GUN ROUND
		                    //Remove ammo cost
		                    if lava_mg_amount != 0 {
		                        var t=0;
		                        while (lava_mg_amount >= mg_rate) {
		                            t+=1;
		                            var i;
		                            for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
		                                var u = ds_list_find_value(global.selected_lava_list, i);
		                                if (u.can_shoot == true) && (u.mg_ammo >= mg_rate) {
		                                    if (u.action_points >= mg_cost) {
		                                        lava_mg_amount -= mg_rate;
		                                        if lava_mg_amount >= 0 { 
		                                            if u.shoot_amount == 0 { 
		                                                u.action_confirmed = true;
		                                                global.units_running += 1; 
		                                                u.shoot_mg = true;
		                                                u.weapon = "MG";
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
		                                lava_mg_amount = 0;
		                                global.targeting_error = true;
		                            } 
		                        }
		                    }
		                    //Hold shift to keep targeting
		                    if keyboard_check_direct(vk_shift) {
		                        var i;
		                        for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
		                            var unit = ds_list_find_value(global.selected_lava_list, i);
		                            with unit { if action_confirmed == true { selected = false; } }
		                        }
		                        ammo_check = true;
		                        lava_mg_amount = 0;
		                    }
		                        else { 
									//Deselect all units
									if !ds_list_empty(global.selected_list) {
										scr_DeselectAll();
									}
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
							else if f4 { 
			                    //FIRE TOW ROUND
			                    //Remove ammo cost
			                    if lava_at_amount != 0 {
			                        var t=0;
			                        while (lava_at_amount >= tow_rate) {
			                            t+=1;
			                            var i;
			                            for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
			                                var u = ds_list_find_value(global.selected_lava_list, i);
			                                if (u.can_shoot == true) && (u.tow_ammo >= tow_rate) {
			                                    if (u.action_points >= tow_cost) {
			                                        lava_at_amount -= tow_rate;
			                                        if lava_at_amount >= 0 { 
			                                            if u.shoot_amount == 0 { 
			                                                u.action_confirmed = true;
			                                                global.units_running += 1; 
			                                                u.shoot_tow = true;
			                                                u.weapon = "TOW";
			                                                u.target_x = global.target_x;
			                                                u.target_y = global.target_y;
			                                                u.alert_display = true;
			                                                u.alert_colour = c_red;
			                                                u.alarm[3] = global.tick_rate*3;
															if PLAYER.net_status != "NONE" { u.net_action = true; }
			                                            }
			                                            u.shoot_amount   += 1; 
			                                            u.tow_ammo       -= tow_rate;
			                                            global.turn_AP   -= tow_cost;
			                                            u.action_points  -= tow_cost;
			                                            u.alert_text = "-"+string(u.shoot_amount*tow_cost)+ " AP";
			                                        }
			                                    }
			                                }
			                            }
			                            if t >= 200 { 
			                                lava_at_amount = 0;
			                                global.targeting_error = true;
			                            } 
			                        }
			                    }
			                    //Hold shift to keep targeting
			                    if keyboard_check_direct(vk_shift) {
			                        var i;
			                        for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
			                            var unit = ds_list_find_value(global.selected_lava_list, i);
			                            with unit { if action_confirmed == true { selected = false; } }
			                        }
			                        ammo_check = true;
			                        lava_at_amount = 0;
			                    }
			                        else { 
										//Deselect all units
										if !ds_list_empty(global.selected_list) {
											scr_DeselectAll();
										}
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
								else if f5 { 
				                    //DISMOUNT SQUAD
									if tile_empty == false { lava_sq_amount = 0; }
				                    //Remove ammo cost
				                    if lava_sq_amount != 0 {
				                        var t=0;
				                        while (lava_sq_amount >= sqd_rate) {
				                            t+=1;
				                            var i;
				                            for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
				                                var u = ds_list_find_value(global.selected_lava_list, i);
												var tl = point_distance(u.x, u.y, global.target_x, global.target_y);
				                                if (u.can_shoot == true) && (u.sqd_ammo >= sqd_rate) && (tl <= 136) {
				                                    if (u.action_points >= sqd_cost) {
				                                        lava_sq_amount -= sqd_rate;
				                                        if lava_sq_amount >= 0 { 
				                                            if u.shoot_amount == 0 { 
				                                                u.action_confirmed = true;
				                                                global.units_running += 1; 
				                                                u.shoot_sqd = true;
				                                                u.weapon = "SQD";
				                                                u.target_x = global.target_x;
				                                                u.target_y = global.target_y;
				                                                u.alert_display = true;
				                                                u.alert_colour = c_red;
				                                                u.alarm[3] = global.tick_rate*3;
																if PLAYER.net_status != "NONE" { u.net_action = true; }
				                                            }
				                                            u.shoot_amount   += 1; 
				                                            u.sqd_ammo       -= sqd_rate;
				                                            global.turn_AP   -= sqd_cost;
				                                            u.action_points  -= sqd_cost;
				                                            u.alert_text = "-"+string(u.shoot_amount*sqd_cost)+ " AP";
				                                        }
				                                    }
				                                }
				                            }
				                            if t >= 200 { 
				                                lava_sq_amount = 0;
				                                global.targeting_error = true;
				                            } 
				                        }
				                    }
				                    //Hold shift to keep targeting
				                    if keyboard_check_direct(vk_shift) {
				                        var i;
				                        for (i=0; i<ds_list_size(global.selected_lava_list); i+=1) {
				                            var unit = ds_list_find_value(global.selected_lava_list, i);
				                            with unit { if action_confirmed == true { selected = false; } }
				                        }
				                        ammo_check = true;
				                        lava_sq_amount = 0;
				                    }
				                        else { 
											//Deselect all units
											if !ds_list_empty(global.selected_list) {
												scr_DeselectAll();
											}
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
				                    else if f6 { 
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
				                        else if f7 { 
				                            //CANCEL
											//Deselect all units
											if !ds_list_empty(global.selected_list) {
												scr_DeselectAll();
											}
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
