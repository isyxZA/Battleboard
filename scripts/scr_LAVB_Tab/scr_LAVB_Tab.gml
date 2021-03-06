/// @description scr_LAVB_Tab(he_rate, ap_rate, mg_rate, sqd_rate, he_cost, ap_cost, mg_cost, sqd_cost)
/// @param he_rate
/// @param ap_rate
/// @param mg_rate
/// @param sqd_rate
/// @param he_cost
/// @param ap_cost
/// @param mg_cost
/// @param sqd_cost
function scr_LAVB_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var f0;
	var f1;
	var f2;
	var f3;
	var f4;
	var f5;
	var f6;

	if p_one == true {
		f0 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
		f3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*3)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
		f4 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*4)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
		f5 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*5)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*6)*global.menu_ratio, obj_MOUSE, false, false);
		f6 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*6)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*7)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			f0 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
			f3 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*2)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
			f4 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*3)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
			f5 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*4)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
			f6 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*5)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*6)*global.menu_ratio, obj_MOUSE, false, false);
		}

	var he_rate  = argument0;
	var ap_rate  = argument1;
	var mg_rate  = argument2;
	var sqd_rate = argument3;
	var he_cost  = argument4;
	var ap_cost  = argument5;
	var mg_cost  = argument6;
	var sqd_cost = argument7;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //Select number of rounds to fire
	        //Increase by a rate of 1
	        if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
	            //Check if there is enough ammo available
	            if lavb_he_amount <= (lavb_he_ammo-he_rate) { 
	                //Check if there is enough turn AP for the move
	                var m_ap = (global.turn_AP-global.temp_AP);
	                if m_ap >=  he_cost {
	                    //Check total unit AP available
	                    var i;
	                    var ap = 0;
	                    if !ds_list_empty(global.selected_lavb_list) {
	                        for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_lavb_list, i);
	                            if unit.can_shoot == true { ap += unit.action_points; }
	                        }
	                    }
	                    if ap >= ((lavb_he_amount+he_rate)/he_rate)*he_cost {
	                        //Add the rounds
	                        lavb_he_amount += he_rate; 
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 1
	        if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
	            if lavb_he_amount >= he_rate { 
	                lavb_he_amount -= he_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if lavb_he_amount < 0 { lavb_he_amount = 0; }
	        if lavb_he_amount > lavb_he_ammo { lavb_he_amount = lavb_he_ammo; }
	        //Add to temp AP cost
	        global.temp_AP = (lavb_he_amount/he_rate)*he_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 { 
	            //Select number of rounds to fire
	            //Increase by a rate of 1
	            if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
	                //Check if there is enough ammo available
	                if lavb_ap_amount <= (lavb_ap_ammo-ap_rate) { 
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >=  ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_lavb_list) {
	                            for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_lavb_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((lavb_ap_amount+ap_rate)/ap_rate)*ap_cost {
	                            //Add the rounds
	                            lavb_ap_amount += ap_rate; 
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 1
	            if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
	                if lavb_ap_amount >= ap_rate { 
	                    lavb_ap_amount -= ap_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if lavb_ap_amount < 0 { lavb_ap_amount = 0; }
	            if lavb_ap_amount > lavb_ap_ammo { lavb_ap_amount = lavb_ap_ammo; }
	            //Add to temp AP cost
	            global.temp_AP = (lavb_ap_amount/ap_rate)*ap_cost;
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
		                if lavb_mg_amount <= (lavb_mg_ammo-mg_rate) { 
		                    //Check if there is enough turn AP for the move
		                    var m_ap = (global.turn_AP-global.temp_AP);
		                    if m_ap >=  mg_cost {
		                        //Check total unit AP available
		                        var i;
		                        var ap = 0;
		                        if !ds_list_empty(global.selected_lavb_list) {
		                            for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
		                                var unit = ds_list_find_value(global.selected_lavb_list, i);
		                                if unit.can_shoot == true { ap += unit.action_points; }
		                            }
		                        }
		                        if ap >= ((lavb_mg_amount+mg_rate)/mg_rate)*mg_cost {
		                            //Add the rounds
		                            lavb_mg_amount += mg_rate; 
		                        }
		                    }
		                } 
		            }
		            //Decrease by a rate of 1
		            if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
		                if lavb_mg_amount >= mg_rate { 
		                    lavb_mg_amount -= mg_rate; 
		                } 
		            }
		            //Clamp the value between zero and the max available rounds
		            if lavb_mg_amount < 0 { lavb_mg_amount = 0; }
		            if lavb_mg_amount > lavb_mg_ammo { lavb_mg_amount = lavb_mg_ammo; }
		            //Add to temp AP cost
		            global.temp_AP = (lavb_mg_amount/mg_rate)*mg_cost;
		            //Set the menu position
		            global.fire_option = 2; 
		            //Switch off camera zoom
		            global.can_zoom  = false;
		            global.header_highlight = false;
		            obj_ACTIONMENU.display_tabinfo = false;
		            obj_ACTIONMENU.display_menuinfo = true;
		        }
					else if f4 { 
				        //Select squad to disembark
				        //Increase by a rate of 1
				        if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
							if tile_empty == true {
					            //Check if there is enough ammo available
					            if lavb_sq_amount <= (lavb_sq_ammo-sqd_rate) { 
					                //Check if there is enough turn AP for the move
					                var m_ap = (global.turn_AP-global.temp_AP);
					                if m_ap >=  sqd_cost {
					                    //Check total unit AP available
					                    var i;
					                    var ap = 0;
					                    if !ds_list_empty(global.selected_lavb_list) {
					                        for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
					                            var unit = ds_list_find_value(global.selected_lavb_list, i);
												var sl = point_distance(unit.x, unit.y, global.target_x, global.target_y);
					                            if (unit.can_shoot == true) && (sl <= 136) { ap += unit.action_points; }
					                        }
					                    }
					                    if ap >= ((lavb_sq_amount+sqd_rate)/sqd_rate)*sqd_cost {
					                        //Add the rounds
					                        lavb_sq_amount += sqd_rate; 
					                    }
					                }
					            } 
							}
								else { lavb_sq_amount = 0; }
				        }
				        //Decrease by a rate of 1
				        if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
				            if lavb_sq_amount >= sqd_rate { 
				                lavb_sq_amount -= sqd_rate; 
				            } 
				        }
				        //Clamp the value between zero and the max available rounds
				        if lavb_sq_amount < 0 { lavb_sq_amount = 0; }
				        if lavb_sq_amount > 1 { lavb_sq_amount = 1; }
				        //Add to temp AP cost
				        global.temp_AP = (lavb_sq_amount/sqd_rate)*sqd_cost;
				        //Set the menu position
				        global.fire_option = 3; 
				        //Switch off camera zoom
				        global.can_zoom  = false;
				        global.header_highlight = false;
				        obj_ACTIONMENU.display_tabinfo = false;
				        obj_ACTIONMENU.display_menuinfo = true;
				    }
			            else if f5 { 
			                //RE-TARGET
			                global.fire_option = 4; 
			                global.can_zoom  = true;
			                global.header_highlight = false;
			                obj_ACTIONMENU.display_tabinfo = false;
			                obj_ACTIONMENU.display_menuinfo = false;
			            }
			                else if f6 { 
			                    //CANCEL
			                    global.fire_option = 5; 
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
					lavb_he_amount = 0;
			        lavb_ap_amount = 0;
					lavb_mg_amount = 0;
					lavb_sq_amount = 0;
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
	                if lavb_he_amount != 0 {
	                    var t=0;
	                    while (lavb_he_amount >= he_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_lavb_list, i);
	                                if (u.can_shoot == true) && (u.he_ammo >= he_rate) {
	                                    if (u.action_points >= he_cost) {
	                                        lavb_he_amount -= he_rate;
	                                        if lavb_he_amount >= 0 {
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
	                            lavb_he_amount = 0; 
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_lavb_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    lavb_he_amount = 0;
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
	                    if lavb_ap_amount != 0 {
	                        var t=0;
	                        while (lavb_ap_amount >= ap_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_lavb_list, i);
	                                if (u.can_shoot == true) && (u.ap_ammo >= ap_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        lavb_ap_amount -= ap_rate;
	                                        if lavb_ap_amount >= 0 { 
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
	                                lavb_ap_amount = 0;
	                                global.targeting_error = true;
	                            } 
	                        }
	                    }
	                    //Hold shift to keep targeting
	                    if keyboard_check_direct(vk_shift) {
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_lavb_list, i);
	                            with unit { if action_confirmed == true { selected = false; } }
	                        }
	                        ammo_check = true;
	                        lavb_ap_amount = 0;
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
		                    if lavb_mg_amount != 0 {
		                        var t=0;
		                        while (lavb_mg_amount >= mg_rate) {
		                            t+=1;
		                            var i;
		                            for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
		                                var u = ds_list_find_value(global.selected_lavb_list, i);
		                                if (u.can_shoot == true) && (u.mg_ammo >= mg_rate) {
		                                    if (u.action_points >= mg_cost) {
		                                        lavb_mg_amount -= mg_rate;
		                                        if lavb_mg_amount >= 0 { 
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
		                                lavb_mg_amount = 0;
		                                global.targeting_error = true;
		                            } 
		                        }
		                    }
		                    //Hold shift to keep targeting
		                    if keyboard_check_direct(vk_shift) {
		                        var i;
		                        for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
		                            var unit = ds_list_find_value(global.selected_lavb_list, i);
		                            with unit { if action_confirmed == true { selected = false; } }
		                        }
		                        ammo_check = true;
		                        lavb_mg_amount = 0;
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
					            //DISMOUNT SQUAD
								if tile_empty == false { lavb_sq_amount = 0; }
					            //Remove ammo cost
					            if lavb_sq_amount != 0 {
					                var t=0;
					                while (lavb_sq_amount >= sqd_rate) {
					                    t+=1;
					                    var i;
					                    for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
					                        var u = ds_list_find_value(global.selected_lavb_list, i);
											var tl = point_distance(u.x, u.y, global.target_x, global.target_y);
					                        if (u.can_shoot == true) && (u.sqd_ammo >= sqd_rate) && (tl <= 136) {
					                            if (u.action_points >= sqd_cost) {
					                                lavb_sq_amount -= sqd_rate;
					                                if lavb_sq_amount >= 0 { 
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
					                        lavb_sq_amount = 0;
					                        global.targeting_error = true;
					                    } 
					                }
					            }
					            //Hold shift to keep targeting
					            if keyboard_check_direct(vk_shift) {
					                var i;
					                for (i=0; i<ds_list_size(global.selected_lavb_list); i+=1) {
					                    var unit = ds_list_find_value(global.selected_lavb_list, i);
					                    with unit { if action_confirmed == true { selected = false; } }
					                }
					                ammo_check = true;
					                lavb_sq_amount = 0;
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
			                        else if f6 { 
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
