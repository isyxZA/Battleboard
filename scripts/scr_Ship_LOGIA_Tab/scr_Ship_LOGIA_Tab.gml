/// @description scr_Ship_LOGIA_Tab(target_unit, ammo_supply, building_supply, ammo_max, building_max, ammo_rate, building_rate);
/// @param  target_unit
/// @param  ammo_supply
/// @param  building_supply
/// @param  ammo_max
/// @param  building_max
/// @param  ammo_rate
/// @param  building_rate
function scr_Ship_LOGIA_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	/*
	lala_fire_menu[0] = "Ammunition";
	lala_fire_menu[1] = "Parts";
	lala_fire_menu[2] = "Retarget";
	lala_fire_menu[3] = "Cancel";
	*/

	var target_unit         = argument0;
	var ammo_count          = argument1;
	var building_count      = argument2;
	var ammo_max            = argument3;
	var building_max        = argument4;
	var logiamo_supply_rate = argument5;
	var logibld_supply_rate = argument6;

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

	var ap_cost = 2;

	if f1 { 
	    //RESUPPLY AMMO
	    //Select number of rounds to fire
	    //Increase by a rate of 10
	    if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
	        //Check if there is enough supply available
	        if logiamo_s_amount <= (lc_amo_ammo-logiamo_supply_rate) {
	            //Make sure the unit ammo does not go over max
	            if ((logiamo_s_amount+ammo_count)+logiamo_supply_rate) <= ammo_max {
	                //Check if there is enough turn AP for the move
	                var m_ap = (global.turn_AP-global.temp_AP);
	                if m_ap >=  ap_cost {
	                    //Check total unit AP available
	                    var ap = target_unit.action_points;
	                    if ap >= ((logiamo_s_amount+logiamo_supply_rate)/logiamo_supply_rate)*ap_cost {
	                        //Add the rounds
	                        logiamo_s_amount +=  logiamo_supply_rate; 
	                    }
	                }
	            }
	        } 
	    }
	    //Decrease by a rate of 10
	    if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
	        if logiamo_s_amount >= logiamo_supply_rate { 
	            logiamo_s_amount -= logiamo_supply_rate; 
	        } 
	    }
	    //Clamp the value between zero and the max available rounds
	    if logiamo_s_amount < 0 { logiamo_s_amount = 0; }
	    if logiamo_s_amount > lc_amo_ammo { logiamo_s_amount = lc_amo_ammo; }
	    //Add to temp AP cost
	    global.temp_AP = (logiamo_s_amount/logiamo_supply_rate)*ap_cost;
	    //Set the menu position
	    global.fire_option = 0; 
	    //Switch off camera zoom
	    global.can_zoom  = false;
	    obj_ACTIONMENU.display_tabinfo = false;
	    obj_ACTIONMENU.display_menuinfo = true;
	}
	    else if f2 {
	        //RESUPPLY PARTS
	        //Select number of rounds to fire
	        //Increase by a rate of 10
	        if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
	            //Check if there is enough supply available
	            if logibld_s_amount <= (lc_bld_ammo-logibld_supply_rate) { 
	                //Make sure the unit rpg ammo does not go over max
	                if ((logibld_s_amount+building_count)+logibld_supply_rate) <= building_max {
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >= ap_cost {
	                        //Check total unit AP available
	                        var ap = target_unit.action_points;
	                        if ap >= ((logibld_s_amount+logibld_supply_rate)/logibld_supply_rate)*ap_cost {
	                            //Add the rounds
	                            logibld_s_amount += logibld_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 4
	        if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
	            if logibld_s_amount >= logibld_supply_rate { 
	                logibld_s_amount -= logibld_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if logibld_s_amount < 0 { logibld_s_amount = 0; }
	        if logibld_s_amount > lc_bld_ammo { logibld_s_amount = lc_bld_ammo; }
	        //Add to temp AP cost
	        global.temp_AP = (logibld_s_amount/logibld_supply_rate)*ap_cost;
	        //Set the menu position
	        global.fire_option = 1; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f3 {
	            //RE-TARGET 
	            global.fire_option = 2; 
	            global.can_zoom  = true;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = false;
	        }
	            else if f4 {
	                //CANCEL
	                global.fire_option = 3; 
	                global.can_zoom  = true;  
	                obj_ACTIONMENU.display_tabinfo = false;
	                obj_ACTIONMENU.display_menuinfo = false;
	            }
	                else { 
	                    //global.fire_option = 0; 
	                    global.can_zoom  = true;
	                    obj_ACTIONMENU.display_tabinfo = false;
	                    obj_ACTIONMENU.display_menuinfo = false;
	                }
            
	if mouse_check_button_released(global.LMOUSE) {
	    if global.my_turn == true {
	        if f0 { 
	        }
	            else if f1 {
	                //TRANSFER AMMO SUPPLY
	                //Remove ammo cost
	                if logiamo_s_amount != 0 {
	                    if global.supply_ship != noone {
	                        var u = global.supply_ship;
	                        if (u.can_shoot == true) && (u.ammunition_ammo >= logiamo_s_amount) {
	                            if (target_unit.action_points >= global.temp_AP) {
	                                    u.action_confirmed = true;
	                                    global.units_running += 1; 
	                                    u.shoot_ammunition = true;
	                                    u.weapon = "AMMO";
	                                    u.target_x = global.target_x;
	                                    u.target_y = global.target_y;
	                                    u.resupply_unit = argument0;
	                                    u.resupply_unit.resupplying = true;
	                                    u.shoot_amount    += logiamo_s_amount/logiamo_supply_rate; 
	                                    u.ammunition_ammo -= logiamo_s_amount;
	                                    global.turn_AP    -= ap_cost*u.shoot_amount;
										target_unit.alert_display = true;
	                                    target_unit.alert_colour = c_red;
										target_unit.alarm[3] = global.tick_rate*3;
	                                    target_unit.action_points   -= ap_cost*u.shoot_amount;
	                                    target_unit.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
                                
	                            }
	                        }
	                    }
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
	                if global.temp_AP > 0 { 
	                    global.draw_apcost = true; 
	                    obj_CONTROL.ap_cost = global.temp_AP;
	                }
	                global.fire_display = false;
	                if global.supply_ship != noone { global.supply_ship.selected = false; }
	                global.can_zoom  = true;
	                queue_reset = true;
	            }
	                else if f2 {
	                    //TRANSFER PARTS SUPPLY
	                    //Remove ammo cost
	                    if logibld_s_amount != 0 {
	                        if global.supply_ship != noone {
	                            var u = global.supply_ship;
	                            if (u.can_shoot == true) && (u.parts_ammo >= logibld_s_amount) {
	                                if (target_unit.action_points >= global.temp_AP) {
	                                    u.action_confirmed = true;
	                                    global.units_running += 1; 
	                                    u.shoot_parts = true;
	                                    u.weapon = "PARTS";
	                                    u.target_x = global.target_x;
	                                    u.target_y = global.target_y;
	                                    u.resupply_unit = argument0;
	                                    u.resupply_unit.resupplying = true;
	                                    u.shoot_amount   += logibld_s_amount/logibld_supply_rate; 
	                                    u.parts_ammo     -= logibld_s_amount;
	                                    global.turn_AP   -= ap_cost*u.shoot_amount;
	                                    target_unit.alert_display = true;
	                                    target_unit.alert_colour = c_red;
										target_unit.alarm[3] = global.tick_rate*3;
	                                    target_unit.action_points   -= ap_cost*u.shoot_amount;
	                                    target_unit.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                }
	                            }
	                        }
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
	                    if global.temp_AP > 0 { 
	                        global.draw_apcost = true; 
	                        obj_CONTROL.ap_cost = global.temp_AP;
	                    }
	                    global.fire_display = false;
	                    if global.supply_ship != noone { global.supply_ship.selected = false; }
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
	                            if global.supply_ship != noone { global.supply_ship.selected = false; }
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
