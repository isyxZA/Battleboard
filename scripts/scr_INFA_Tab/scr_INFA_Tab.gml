/// @description scr_INFA_Tab(rifle_rate, rpg_rate, flare_rate, ap_cost)
/// @param rifle_rate
/// @param rpg_rate
/// @param flare_rate
/// @param ap_cost
function scr_INFA_Tab(argument0, argument1, argument2, argument3) {

	var f0;
	var f1;
	var f2;
	var f3;
	var f4;
	var f5;

	if p_one == true {
		f0 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
		f3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*3)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
		f4 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*4)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
		f5 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*5)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*6)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			f0 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
			f3 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*2)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
			f4 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*3)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
			f5 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*4)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
		}

	var rifle_rate = argument0;
	var rpg_rate   = argument1;
	var flare_rate = argument2;
	var ap_cost    = argument3;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //RIFLES
	        //Select number of rounds to fire
	        //Increase by a rate of 4
	        if mouse_wheel_up() { 
	            //Check if there is enough ammo available to add another amount
	            if infa_rfl_amount <= (infa_rfl_ammo-rifle_rate) { 
	                //Check if there is enough turn AP for the move
	                var m_ap = (global.turn_AP-global.temp_AP);
	                if m_ap >= ap_cost {
	                    //Check total unit AP available
	                    var i;
	                    var ap = 0;
	                    if !ds_list_empty(global.selected_infa_list) {
	                        for (i=0; i<ds_list_size(global.selected_infa_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_infa_list, i);
	                            if unit.can_shoot == true { ap += unit.action_points; }
	                        }
	                    }
	                    if ap >= ((infa_rfl_amount+rifle_rate)/rifle_rate)*ap_cost {
	                        //Add the rounds
	                        infa_rfl_amount += rifle_rate; 
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 4
	        if mouse_wheel_down() { 
	            if infa_rfl_amount >= rifle_rate { 
	                infa_rfl_amount -= rifle_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if infa_rfl_amount < 0 { infa_rfl_amount = 0; }
	        if infa_rfl_amount > infa_rfl_ammo { infa_rfl_amount = infa_rfl_ammo; }
	        //Add to temp AP cost
	        global.temp_AP = (infa_rfl_amount/rifle_rate)*ap_cost;
	        //Set menu position
	        global.fire_option = 0; 
	        //Switch off zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 { 
	            //RPG
	            //Select number of rounds to fire
	            //Increase by a rate of 1
	            if mouse_wheel_up() { 
	                //Check if there is enough ammo available
	                if infa_rpg_amount <= (infa_rpg_ammo-rpg_rate) { 
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >= ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_infa_list) {
	                            for (i=0; i<ds_list_size(global.selected_infa_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_infa_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((infa_rpg_amount+rpg_rate)/rpg_rate)*ap_cost {
	                            //Add the rounds
	                            infa_rpg_amount += rpg_rate; 
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 1
	            if mouse_wheel_down() { 
	                if infa_rpg_amount >= rpg_rate { 
	                    infa_rpg_amount -= rpg_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if infa_rpg_amount < 0 { infa_rpg_amount = 0; }
	            if infa_rpg_amount > infa_rpg_ammo { infa_rpg_amount = infa_rpg_ammo; }
	            //Add to temp AP cost
	            global.temp_AP = (infa_rpg_amount/rpg_rate)*ap_cost;
	            //Set menu position
	            global.fire_option = 1; 
	            //Switch off zoom
	            global.can_zoom  = false;
	            global.header_highlight = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = true;
	        }
	            else if f3 { 
	                //FLARES
	                //Select number of rounds to fire
	                //Increase by a rate of 1
	                if mouse_wheel_up() { 
	                    //Check if there is enough ammo available
	                    if infa_flr_amount <= (infa_flr_ammo-flare_rate) { 
	                        //Check if there is enough turn AP for the move
	                        var m_ap = (global.turn_AP-global.temp_AP);
	                        if m_ap >=  ap_cost {
	                            //Check total unit AP available
	                            var i;
	                            var ap = 0;
	                            if !ds_list_empty(global.selected_infa_list) {
	                                for (i=0; i<ds_list_size(global.selected_infa_list); i+=1) {
	                                    var unit = ds_list_find_value(global.selected_infa_list, i);
	                                    if unit.can_shoot == true { ap += unit.action_points; }
	                                }
	                            }
	                            if ap >= ((infa_flr_amount+flare_rate)/flare_rate)*ap_cost {
	                                //Add the rounds
	                                infa_flr_amount += flare_rate; 
	                            }
	                        }
	                    } 
	                }
	                //Decrease by a rate of 1
	                if mouse_wheel_down() { 
	                    if infa_flr_amount >= flare_rate { 
	                        infa_flr_amount -= flare_rate; 
	                    } 
	                }
	                //Clamp the value between zero and the max available rounds
	                if infa_flr_amount < 0 { infa_flr_amount = 0; }
	                if infa_flr_amount > infa_flr_ammo { infa_flr_amount = infa_flr_ammo; }
	                //Add to temp AP cost
	                global.temp_AP = (infa_flr_amount/flare_rate)*ap_cost;
	                //Set menu position
	                global.fire_option = 2; 
	                //Switch off zoom
	                global.can_zoom  = false;
	                global.header_highlight = false;
	                obj_ACTIONMENU.display_tabinfo = false;
	                obj_ACTIONMENU.display_menuinfo = true;
	            }
	                else if f4 {
	                    //RE-TARGET
	                    global.fire_option = 3; 
	                    global.can_zoom  = true; 
	                    global.header_highlight = false;
	                    obj_ACTIONMENU.display_tabinfo = false;
	                    obj_ACTIONMENU.display_menuinfo = false;
	                }
	                    else if f5 {
	                        //CANCEL
	                        global.fire_option = 4; 
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
				if ds_list_size(tabs) > 1 {
					var t_size = ds_list_size(tabs)-1;
					if tab_count < t_size { tab_count += 1; }
						else { tab_count = 0; }
					global.ammo_tab = ds_list_find_value(tabs, tab_count);
					infa_rfl_amount = 0;
			        infa_flr_amount = 0;
			        infa_rpg_amount = 0;
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
	                //FIRE RIFLES
	                //Remove ammo cost
	                if infa_rfl_amount != 0 {
	                    var t=0;
	                    while (infa_rfl_amount >= rifle_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_infa_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_infa_list, i);
	                            if (u.can_shoot == true) && (u.rifle_ammo >= rifle_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    infa_rfl_amount -= rifle_rate;
	                                    if infa_rfl_amount >= 0 {
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_rifle = true;
	                                            u.weapon = "RIFLE";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
												if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                        }
	                                        u.shoot_amount   += 1; 
	                                        u.rifle_ammo     -= rifle_rate;
	                                        global.turn_AP   -= ap_cost;
	                                        u.action_points  -= ap_cost;
	                                        u.alert_text      = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            infa_rfl_amount = 0; 
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_infa_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_infa_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    infa_rfl_amount = 0;
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
	                    //FIRE RPG
	                    //Remove ammo cost
	                    if infa_rpg_amount != 0 {
	                        var t=0;
	                        while (infa_rpg_amount >= rpg_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_infa_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_infa_list, i);
	                                if (u.can_shoot == true) && (u.rpg_ammo >= rpg_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        infa_rpg_amount -= rpg_rate;
	                                        if infa_rpg_amount >= 0 { 
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed    = true;
	                                                global.units_running += 1; 
	                                                u.shoot_rpg = true;
	                                                u.weapon    = "RPG";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
													if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                            }
	                                            u.shoot_amount   += 1; 
	                                            u.rpg_ammo       -= rpg_rate;
	                                            global.turn_AP   -= ap_cost;
	                                            u.action_points  -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                infa_rpg_amount = 0; 
	                                global.targeting_error = true;
	                            }
	                        }
	                    }
	                    //Hold shift to keep targeting
	                    if keyboard_check_direct(vk_shift) {
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_infa_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_infa_list, i);
	                            with unit { if action_confirmed == true { selected = false; } }
	                        }
	                        ammo_check = true;
	                        infa_rpg_amount = 0;
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
	                        //FIRE FLARES
	                        //Remove ammo cost
	                        if infa_flr_amount != 0 {
	                            var t=0;
	                            while (infa_flr_amount >= flare_rate) {
	                                t+=1;
	                                var i;
	                                for (i=0; i<ds_list_size(global.selected_infa_list); i+=1) {
	                                    var u = ds_list_find_value(global.selected_infa_list, i);
	                                    if (u.can_shoot == true) && (u.flare_ammo >= flare_rate) {
	                                        if (u.action_points >= ap_cost) {
	                                            infa_flr_amount -= flare_rate;
	                                            if infa_flr_amount >= 0 {
	                                                if u.shoot_amount == 0 { 
	                                                    u.action_confirmed    = true;
	                                                    global.units_running += 1; 
	                                                    u.shoot_flare = true;
	                                                    u.weapon      = "FLARE";
	                                                    u.target_x = global.target_x;
	                                                    u.target_y = global.target_y;
	                                                    u.alert_display = true;
	                                                    u.alert_colour = c_red;
	                                                    u.alarm[3] = global.tick_rate*3;
														if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                                }
	                                                u.shoot_amount   += 1; 
	                                                u.flare_ammo     -= flare_rate;
	                                                global.turn_AP   -= ap_cost;
	                                                u.action_points  -= ap_cost;
	                                                u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                            }
	                                        }
	                                    }
	                                }
	                                if t >= 200 { 
	                                    infa_flr_amount = 0; 
	                                    global.targeting_error = true;
	                                }
	                            }
	                        }
	                        //Hold shift to keep targeting
	                        if keyboard_check_direct(vk_shift) {
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_infa_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_infa_list, i);
	                                with unit { if action_confirmed == true { selected = false; } }
	                            }
	                            ammo_check = true;
	                            infa_flr_amount = 0;
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
	                        else if f4 { 
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
	                            else if f5 { 
	                                //CANCEL
	                                //Stop drawing all menus
	                                global.fire_display     = false;
	                                global.reticule_display = false;
	                                global.menu_create      = false;
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
