/// @description scr_LOGIB_INFA_Tab(target_unit, rifle_ammo, rpg_ammo, flare_ammo, rifle_max, rpg_max, flare_max, rifle_rate, rpg_rate, flare_rate);
/// @param target_unit
/// @param  rifle_ammo
/// @param  rpg_ammo
/// @param  flare_ammo
/// @param  rifle_max
/// @param  rpg_max
/// @param  flare_max
/// @param  rifle_rate
/// @param  rpg_rate
/// @param  flare_rate
function scr_LOGIB_INFA_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	/*  Arguments
	0   resupply unit ID        
	1   rifle ammo count     
	2   flare ammo count                
	3   rpg ammo count
	4   max rifle ammo the unit can carry
	5   max rpg ammo the unit can carry
	6   max flare ammo the unit can carry
	*/

	/*
	laia_fire_menu[0] = "Resupply Rifles";
	laia_fire_menu[1] = "Resupply RPG";
	laia_fire_menu[2] = "Resupply Flares";
	laia_fire_menu[3] = "Retarget";
	laia_fire_menu[4] = "Cancel";
	*/

	var rifle_count = argument1;
	var rpg_count   = argument2;
	var flare_count = argument3;
	var rifle_max   = argument4;
	var rpg_max     = argument5;
	var flare_max   = argument6;
	var rfl_supply_rate = argument7;
	var rpg_supply_rate = argument8;
	var flr_supply_rate = argument9;

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

	var ap_cost = obj_LOGIB_Unit.ap_cost;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //RESUPPLY RIFLES
	        //Select number of rounds to fire
	        //Increase by a rate of 20
	        if mouse_wheel_up() { 
	            //Check if there is enough ammo supply available
	            if infrfl_l_amount <= (logib_amo_supply-rfl_supply_rate) {
	                //Make sure the unit rifle ammo does not go over max
	                if ((infrfl_l_amount+rifle_count)+rfl_supply_rate) <= rifle_max {
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >=  ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_logib_list) {
	                            for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_logib_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((infrfl_l_amount+rfl_supply_rate)/rfl_supply_rate)*ap_cost {
	                            //Add the rounds
	                            infrfl_l_amount += rfl_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 20
	        if mouse_wheel_down() { 
	            if infrfl_l_amount >= rfl_supply_rate { 
	                infrfl_l_amount -= rfl_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if infrfl_l_amount < 0 { infrfl_l_amount = 0; }
	        if infrfl_l_amount > logib_amo_supply { infrfl_l_amount = logib_amo_supply; }
	        //Add to temp AP cost
	        global.temp_AP = (infrfl_l_amount/rfl_supply_rate)*ap_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 {
	            //RESUPPLY RPG
	            //Select number of rounds to fire
	            //Increase by a rate of 1
	            if mouse_wheel_up() { 
	                //Check if there is enough ammo available
	                if infrpg_l_amount <= (logib_amo_supply-rpg_supply_rate) { 
	                    //Make sure the unit rpg ammo does not go over max
	                    if ((infrpg_l_amount+rpg_count)+rpg_supply_rate) <= rpg_max {
	                        //Check if there is enough turn AP for the move
	                        var m_ap = (global.turn_AP-global.temp_AP);
	                        if m_ap >=  ap_cost {
	                            //Check total unit AP available
	                            var i;
	                            var ap = 0;
	                            if !ds_list_empty(global.selected_logib_list) {
	                                for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                                    var unit = ds_list_find_value(global.selected_logib_list, i);
	                                    if unit.can_shoot == true { ap += unit.action_points; }
	                                }
	                            }
	                            if ap >= ((infrpg_l_amount+rpg_supply_rate)/rpg_supply_rate)*ap_cost {
	                                //Add the rounds
	                                infrpg_l_amount +=  rpg_supply_rate; 
	                            }
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 1
	            if mouse_wheel_down() { 
	                if infrpg_l_amount >= rpg_supply_rate { 
	                    infrpg_l_amount -= rpg_supply_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if infrpg_l_amount < 0 { infrpg_l_amount = 0; }
	            if infrpg_l_amount > logib_amo_supply { infrpg_l_amount = logib_amo_supply; }
	            //Add to temp AP cost
	            global.temp_AP = (infrpg_l_amount/rpg_supply_rate)*ap_cost;
	            //Set the menu position
	            global.fire_option = 1; 
	            //Switch off camera zoom
	            global.can_zoom  = false;
	            global.header_highlight = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = true;
	        }
	            else if f3 {
	                //RESUPPLY FLARES
	                //Select number of rounds to fire
	                //Increase by a rate of 1
	                if mouse_wheel_up() { 
	                    //Check if there is enough ammo available
	                    if infflr_l_amount <= (logib_amo_supply-flr_supply_rate) { 
	                        //Make sure the unit flare ammo does not go over max
	                        if ((infflr_l_amount+flare_count)+flr_supply_rate) <= flare_max {
	                            //Check if there is enough turn AP for the move
	                            var m_ap = (global.turn_AP-global.temp_AP);
	                            if m_ap >=  ap_cost {
	                                //Check total unit AP available
	                                var i;
	                                var ap = 0;
	                                if !ds_list_empty(global.selected_logib_list) {
	                                    for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                                        var unit = ds_list_find_value(global.selected_logib_list, i);
	                                        if unit.can_shoot == true { ap += unit.action_points; }
	                                    }
	                                }
	                                if ap >= ((infflr_l_amount+flr_supply_rate)/flr_supply_rate)*ap_cost {
	                                    //Add the rounds
	                                    infflr_l_amount +=  flr_supply_rate; 
	                                }
	                            }
	                        }
	                    } 
	                }
	                //Decrease by a rate of 1
	                if mouse_wheel_down() { 
	                    if infflr_l_amount >= flr_supply_rate { 
	                        infflr_l_amount -= flr_supply_rate; 
	                    } 
	                }
	                //Clamp the value between zero and the max available rounds
	                if infflr_l_amount < 0 { infflr_l_amount = 0; }
	                if infflr_l_amount > logib_amo_supply { infflr_l_amount = logib_amo_supply; }
	                //Add to temp AP cost
	                global.temp_AP = (infflr_l_amount/flr_supply_rate)*ap_cost;
	                //Set the menu position
	                global.fire_option = 2; 
	                //Switch off camera zoom
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
					infrfl_l_amount  = 0;
			        infrpg_l_amount  = 0;
			        infflr_l_amount  = 0;
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
	                //TRANSFER RIFLE AMMO
	                //Remove ammo cost
	                if infrfl_l_amount != 0 {
	                    var t=0;
	                    while (infrfl_l_amount >= rfl_supply_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_logib_list, i);
	                            if (u.can_shoot == true) && (u.ammo_supply >= rfl_supply_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    infrfl_l_amount -= rfl_supply_rate;
	                                    if infrfl_l_amount >= 0 { 
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_ammo = true;
	                                            u.weapon     = "RIFLE";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.resupply_unit = argument0;
	                                            u.resupply_unit.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
	                                        }
	                                        u.shoot_amount   += 1; 
	                                        u.ammo_supply    -= rfl_supply_rate;
	                                        global.turn_AP   -= ap_cost;
	                                        u.action_points  -= ap_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            infrfl_l_amount = 0;
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_logib_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    infrfl_l_amount = 0;
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
	                    //TRANSFER RPG AMMO
	                    //Remove ammo cost
	                    if infrpg_l_amount != 0 {
	                        var t=0;
	                        while (infrpg_l_amount >= rpg_supply_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_logib_list, i);
	                                if (u.can_shoot == true) && (u.ammo_supply >= rpg_supply_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        infrpg_l_amount -= rpg_supply_rate;
	                                        if infrpg_l_amount >= 0 { 
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_ammo = true;
	                                                u.weapon     = "RPG";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.resupply_unit = argument0;
	                                                u.resupply_unit.resupplying = true;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
	                                            }
	                                            u.shoot_amount   += 1; 
	                                            u.ammo_supply    -= rpg_supply_rate;
	                                            global.turn_AP   -= ap_cost;
	                                            u.action_points  -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                infrpg_l_amount = 0;
	                                global.targeting_error = true;
	                            } 
	                        }
	                    }
	                    //Hold shift to keep targeting
	                    if keyboard_check_direct(vk_shift) {
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_logib_list, i);
	                            with unit { if action_confirmed == true { selected = false; } }
	                        }
	                        ammo_check = true;
	                        infrpg_l_amount = 0;
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
	                        //TRANSFER FLARE AMMO
	                        //Remove ammo cost
	                        if infflr_l_amount != 0 {
	                            var t=0;
	                            while (infflr_l_amount >= flr_supply_rate) {
	                                t+=1;
	                                var i;
	                                for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                                    var u = ds_list_find_value(global.selected_logib_list, i);
	                                    if (u.can_shoot == true) && (u.ammo_supply >= flr_supply_rate) {
	                                        if (u.action_points >= ap_cost) {
	                                            infflr_l_amount -= flr_supply_rate;
	                                            if infflr_l_amount >= 0 {
	                                                if u.shoot_amount == 0 { 
	                                                    u.action_confirmed = true;
	                                                    global.units_running += 1; 
	                                                    u.shoot_ammo = true;
	                                                    u.weapon     = "FLARE";
	                                                    u.target_x = global.target_x;
	                                                    u.target_y = global.target_y;
	                                                    u.resupply_unit = argument0;
	                                                    u.resupply_unit.resupplying = true;
	                                                    u.alert_display = true;
	                                                    u.alert_colour = c_red;
	                                                    u.alarm[3] = global.tick_rate*3;
	                                                }
	                                                u.shoot_amount   += 1; 
	                                                u.ammo_supply    -= flr_supply_rate;
	                                                global.turn_AP   -= ap_cost;
	                                                u.action_points  -= ap_cost;
	                                                u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                            }
	                                        }
	                                    }
	                                }
	                                if t >= 200 { 
	                                    infflr_l_amount = 0;
	                                    global.targeting_error = true;
	                                } 
	                            }
	                        }
	                        //Hold shift to keep targeting
	                        if keyboard_check_direct(vk_shift) {
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_logib_list, i);
	                                with unit { if action_confirmed == true { selected = false; } }
	                            }
	                            ammo_check = true;
	                            infflr_l_amount = 0;
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
