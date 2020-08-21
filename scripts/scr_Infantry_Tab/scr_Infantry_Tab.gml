/// @description scr_Infantry_Tab(rifle_rate, rpg_rate, flare_rate, ap_cost)
/// @param  rifle_rate
/// @param  rpg_rate
/// @param  flare_rate
/// @param  ap_cost
function scr_Infantry_Tab(argument0, argument1, argument2, argument3) {

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
	            if global.rifle_amount <= (global.rifle_ammo-rifle_rate) { 
	                //Check if there is enough turn AP for the move
	                var m_ap = (global.turn_AP-global.temp_AP);
	                if m_ap >= ap_cost {
	                    //Check total unit AP available
	                    var i;
	                    var ap = 0;
	                    if !ds_list_empty(global.selected_infantry_list) {
	                        for (i=0; i<ds_list_size(global.selected_infantry_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_infantry_list, i);
	                            if unit.can_shoot == true { ap += unit.action_points; }
	                        }
	                    }
	                    if ap >= ((global.rifle_amount+rifle_rate)/rifle_rate)*ap_cost {
	                        //Add the rounds
	                        global.rifle_amount += rifle_rate; 
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 4
	        if mouse_wheel_down() { 
	            if global.rifle_amount >= rifle_rate { 
	                global.rifle_amount -= rifle_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if global.rifle_amount < 0 { global.rifle_amount = 0; }
	        if global.rifle_amount > global.rifle_ammo { global.rifle_amount = global.rifle_ammo; }
	        //Add to temp AP cost
	        global.temp_AP = (global.rifle_amount/rifle_rate)*ap_cost;
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
	                if global.rpg_amount <= (global.rpg_ammo-rpg_rate) { 
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >=  ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_infantry_list) {
	                            for (i=0; i<ds_list_size(global.selected_infantry_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_infantry_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((global.rpg_amount+rpg_rate)/rpg_rate)*ap_cost {
	                            //Add the rounds
	                            global.rpg_amount += rpg_rate; 
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 1
	            if mouse_wheel_down() { 
	                if global.rpg_amount >= rpg_rate { 
	                    global.rpg_amount -= rpg_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if global.rpg_amount < 0 { global.rpg_amount = 0; }
	            if global.rpg_amount > global.rpg_ammo { global.rpg_amount = global.rpg_ammo; }
	            //Add to temp AP cost
	            global.temp_AP = (global.rpg_amount/rpg_rate)*ap_cost;
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
	                    if global.flare_amount <= (global.flare_ammo-flare_rate) { 
	                        //Check if there is enough turn AP for the move
	                        var m_ap = (global.turn_AP-global.temp_AP);
	                        if m_ap >=  ap_cost {
	                            //Check total unit AP available
	                            var i;
	                            var ap = 0;
	                            if !ds_list_empty(global.selected_infantry_list) {
	                                for (i=0; i<ds_list_size(global.selected_infantry_list); i+=1) {
	                                    var unit = ds_list_find_value(global.selected_infantry_list, i);
	                                    if unit.can_shoot == true { ap += unit.action_points; }
	                                }
	                            }
	                            if ap >= ((global.flare_amount+flare_rate)/flare_rate)*ap_cost {
	                                //Add the rounds
	                                global.flare_amount += flare_rate; 
	                            }
	                        }
	                    } 
	                }
	                //Decrease by a rate of 1
	                if mouse_wheel_down() { 
	                    if global.flare_amount >= flare_rate { 
	                        global.flare_amount -= flare_rate; 
	                    } 
	                }
	                //Clamp the value between zero and the max available rounds
	                if global.flare_amount < 0 { global.flare_amount = 0; }
	                if global.flare_amount > global.flare_ammo { global.flare_amount = global.flare_ammo; }
	                //Add to temp AP cost
	                global.temp_AP = (global.flare_amount/flare_rate)*ap_cost;
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
	            if global.selected_tank != 0 {
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
	                    else if global.selected_btr != 0 {
	                        global.ammo_tab = "BTR"; 
							//Remove the surface
							if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                        ammo_check = true;
	                    }
	                        else if global.selected_logi != 0 {
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
	                                            else {
	                                            }
	                }
	            else if f1 { 
	                //FIRE RIFLES
	                //Remove ammo cost
	                if global.rifle_amount != 0 {
	                    var t=0;
	                    while (global.rifle_amount >= rifle_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_infantry_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_infantry_list, i);
	                            if (u.can_shoot == true) && (u.rifle_ammo >= rifle_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    global.rifle_amount -= rifle_rate;
	                                    if global.rifle_amount >= 0 {
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
	                            global.rifle_amount = 0; 
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_infantry_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_infantry_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    global.rifle_amount = 0;
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
	                else if f2 { 
	                    //FIRE RPG
	                    //Remove ammo cost
	                    if global.rpg_amount != 0 {
	                        var t=0;
	                        while (global.rpg_amount >= rpg_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_infantry_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_infantry_list, i);
	                                if (u.can_shoot == true) && (u.rpg_ammo >= rpg_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        global.rpg_amount -= rpg_rate;
	                                        if global.rpg_amount >= 0 { 
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
	                                global.rpg_amount = 0; 
	                                global.targeting_error = true;
	                            }
	                        }
	                    }
	                    //Hold shift to keep targeting
	                    if keyboard_check_direct(vk_shift) {
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_infantry_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_infantry_list, i);
	                            with unit { if action_confirmed == true { selected = false; } }
	                        }
	                        ammo_check = true;
	                        global.rpg_amount = 0;
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
	                        if global.flare_amount != 0 {
	                            var t=0;
	                            while (global.flare_amount >= flare_rate) {
	                                t+=1;
	                                var i;
	                                for (i=0; i<ds_list_size(global.selected_infantry_list); i+=1) {
	                                    var u = ds_list_find_value(global.selected_infantry_list, i);
	                                    if (u.can_shoot == true) && (u.flare_ammo >= flare_rate) {
	                                        if (u.action_points >= ap_cost) {
	                                            global.flare_amount -= flare_rate;
	                                            if global.flare_amount >= 0 {
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
	                                    global.flare_amount = 0; 
	                                    global.targeting_error = true;
	                                }
	                            }
	                        }
	                        //Hold shift to keep targeting
	                        if keyboard_check_direct(vk_shift) {
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_infantry_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_infantry_list, i);
	                                with unit { if action_confirmed == true { selected = false; } }
	                            }
	                            ammo_check = true;
	                            global.flare_amount = 0;
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
