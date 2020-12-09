/// @description scr_Ship_LOGIB_Tab(target_unit, ammo_supply, ammo_max, ammo_rate);
/// @param  target_unit
/// @param  ammo_supply
/// @param  building_supply
/// @param  ammo_max
/// @param  building_max
/// @param  ammo_rate
/// @param  building_rate
function scr_Ship_LOGIB_Tab(argument0, argument1, argument2, argument3) {

	/*
	lalb_fire_menu[0] = "Ammunition";
	lalb_fire_menu[1] = "Retarget";
	lalb_fire_menu[2] = "Cancel";
	*/

	var target_unit         = argument0;
	var ammo_count          = argument1;
	var ammo_max            = argument2;
	var logiamo_supply_rate = argument3;

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

	var ap_cost = 2;

	if f1 { 
	    //RESUPPLY AMMO
	    //Select number of rounds to fire
	    //Increase by a rate of 10
	    if mouse_wheel_up() { 
	        //Check if there is enough supply available
	        if global.logiamo_s_amount <= (global.lc_ammunition_ammo-logiamo_supply_rate) {
	            //Make sure the unit ammo does not go over max
	            if ((global.logiamo_s_amount+ammo_count)+logiamo_supply_rate) <= ammo_max {
	                //Check if there is enough turn AP for the move
	                var m_ap = (global.turn_AP-global.temp_AP);
	                if m_ap >=  ap_cost {
	                    //Check total unit AP available
	                    var ap = target_unit.action_points;
	                    if ap >= ((global.logiamo_s_amount+logiamo_supply_rate)/logiamo_supply_rate)*ap_cost {
	                        //Add the rounds
	                        global.logiamo_s_amount +=  logiamo_supply_rate; 
	                    }
	                }
	            }
	        } 
	    }
	    //Decrease by a rate of 10
	    if mouse_wheel_down() { 
	        if global.logiamo_s_amount >= logiamo_supply_rate { 
	            global.logiamo_s_amount -= logiamo_supply_rate; 
	        } 
	    }
	    //Clamp the value between zero and the max available rounds
	    if global.logiamo_s_amount < 0 { global.logiamo_s_amount = 0; }
	    if global.logiamo_s_amount > global.lc_ammunition_ammo { global.logiamo_s_amount = global.lc_ammunition_ammo; }
	    //Add to temp AP cost
	    global.temp_AP = (global.logiamo_s_amount/logiamo_supply_rate)*ap_cost;
	    //Set the menu position
	    global.fire_option = 0; 
	    //Switch off camera zoom
	    global.can_zoom  = false;
	    obj_ACTIONMENU.display_tabinfo = false;
	    obj_ACTIONMENU.display_menuinfo = true;
	}
	    else if f2 {
	        //RE-TARGET 
	        global.fire_option = 1; 
	        global.can_zoom  = true;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = false;
	    }
	        else if f3 {
	            //CANCEL
	            global.fire_option = 2; 
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
            
	if mouse_check_button_released(mb_left) {
	    if global.my_turn == true {
	        if f0 { 
	        }
	            else if f1 {
	                //TRANSFER AMMO SUPPLY
	                //Remove ammo cost
	                if global.logiamo_s_amount != 0 {
	                    if global.supply_ship != noone {
	                        var u = global.supply_ship;
	                        if (u.can_shoot == true) && (u.ammunition_ammo >= global.logiamo_s_amount) {
	                            if (target_unit.action_points >= global.temp_AP) {
	                                    u.action_confirmed = true;
	                                    global.units_running += 1; 
	                                    u.shoot_ammunition = true;
	                                    u.weapon = "AMMO";
	                                    u.target_x = global.target_x;
	                                    u.target_y = global.target_y;
	                                    u.resupply_unit = argument0;
	                                    u.resupply_unit.resupplying = true;
	                                    u.shoot_amount    += global.logiamo_s_amount/logiamo_supply_rate; 
	                                    u.ammunition_ammo -= global.logiamo_s_amount;
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
			            else if f3 { 
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
