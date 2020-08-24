/// @description scr_BTR_Tab(he_rate, ap_rate, ap_cost)
/// @param he_rate
/// @param  ap_rate
/// @param  ap_cost
function scr_BTR_Tab(argument0, argument1, argument2) {

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

	var he_rate = argument0;
	var ap_rate = argument1;
	var ap_cost = argument2;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //Select number of rounds to fire
	        //Increase by a rate of 1
	        if mouse_wheel_up() { 
	            //Check if there is enough ammo available
	            if global.he_amount <= (global.he_ammo-he_rate) { 
	                //Check if there is enough turn AP for the move
	                var m_ap = (global.turn_AP-global.temp_AP);
	                if m_ap >=  ap_cost {
	                    //Check total unit AP available
	                    var i;
	                    var ap = 0;
	                    if !ds_list_empty(global.selected_btr_list) {
	                        for (i=0; i<ds_list_size(global.selected_btr_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_btr_list, i);
	                            if unit.can_shoot == true { ap += unit.action_points; }
	                        }
	                    }
	                    if ap >= ((global.he_amount+he_rate)/he_rate)*ap_cost {
	                        //Add the rounds
	                        global.he_amount += he_rate; 
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 1
	        if mouse_wheel_down() { 
	            if global.he_amount >= he_rate { 
	                global.he_amount -= he_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if global.he_amount < 0 { global.he_amount = 0; }
	        if global.he_amount > global.he_ammo { global.he_amount = global.he_ammo; }
	        //Add to temp AP cost
	        global.temp_AP = (global.he_amount/he_rate)*ap_cost;
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
	            if mouse_wheel_up() { 
	                //Check if there is enough ammo available
	                if global.ap_amount <= (global.ap_ammo-ap_rate) { 
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >=  ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_btr_list) {
	                            for (i=0; i<ds_list_size(global.selected_btr_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_btr_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((global.ap_amount+ap_rate)/ap_rate)*ap_cost {
	                            //Add the rounds
	                            global.ap_amount += ap_rate; 
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 1
	            if mouse_wheel_down() { 
	                if global.ap_amount >= ap_rate { 
	                    global.ap_amount -= ap_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if global.ap_amount < 0 { global.ap_amount = 0; }
	            if global.ap_amount > global.ap_ammo { global.ap_amount = global.ap_ammo; }
	            //Add to temp AP cost
	            global.temp_AP = (global.ap_amount/ap_rate)*ap_cost;
	            //Set the menu position
	            global.fire_option = 1; 
	            //Switch off camera zoom
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
	                        global.fire_option = 0; 
	                        global.can_zoom  = true;
	                        global.header_highlight = false;
	                        obj_ACTIONMENU.display_tabinfo = false;
	                        obj_ACTIONMENU.display_menuinfo = false;
	                    }
            
	if mouse_check_button_released(mb_left) {
	    if global.my_turn == true {
	        if f0 { 
	            //Switch ammo/fire options tab
	            if global.selected_logi != 0 {
					global.ammo_tab = "LOGI"; 
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
	                                else if global.selected_infantry != 0 {
	                                    global.ammo_tab = "INFANTRY"; 
										//Remove the surface
										if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                                    ammo_check = true;
	                                }
	                                    else if global.selected_tank != 0 {
	                                        global.ammo_tab = "TANK"; 
											//Remove the surface
											if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                                        ammo_check = true;
	                                    }
	                                        else if global.selected_engineer != 0 {
	                                            global.ammo_tab = "ENGINEER"; 
												//Remove the surface
												if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                                            ammo_check = true;
	                                        }
	                                            else {
	                                            }
	        }
	            else if f1 { 
	                //FIRE HIGH EXPLOSIVE ROUND
	                //Remove ammo cost
	                if global.he_amount != 0 {
	                    var t=0;
	                    while (global.he_amount >= he_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_btr_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_btr_list, i);
	                                if (u.can_shoot == true) && (u.he_ammo >= he_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        global.he_amount -= he_rate;
	                                        if global.he_amount >= 0 {
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
	                                            global.turn_AP   -= ap_cost;
	                                            u.action_points  -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                        }
	                        if t >= 200 { 
	                            global.he_amount = 0; 
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_btr_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_btr_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    global.he_amount = 0;
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
	                    //FIRE ARMOUR PIERCING ROUND
	                    //Remove ammo cost
	                    if global.ap_amount != 0 {
	                        var t=0;
	                        while (global.ap_amount >= ap_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_btr_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_btr_list, i);
	                                if (u.can_shoot == true) && (u.ap_ammo >= ap_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        global.ap_amount -= ap_rate;
	                                        if global.ap_amount >= 0 { 
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
	                                global.ap_amount = 0;
	                                global.targeting_error = true;
	                            } 
	                        }
	                    }
	                    //Hold shift to keep targeting
	                    if keyboard_check_direct(vk_shift) {
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_btr_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_btr_list, i);
	                            with unit { if action_confirmed == true { selected = false; } }
	                        }
	                        ammo_check = true;
	                        global.ap_amount = 0;
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
