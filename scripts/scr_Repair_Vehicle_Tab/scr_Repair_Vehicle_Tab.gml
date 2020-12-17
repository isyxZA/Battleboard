/// @description scr_Repair_Vehicle_Tab(current_health, max_health, repair_rate);
/// @param current_health
/// @param max_health
/// @param repair_rate
function scr_Repair_Vehicle_Tab(argument0, argument1, argument2) {

	var f0;
	var f1;
	var f2;

	if p_one == true {
		f0 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			f0 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			f1 = collision_rectangle(global.menu_x, global.menu_y                                     , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		}

	var repair_count = argument0;
	var repair_max   = argument1;
	var repair_rate  = argument2;
	var ap_cost      = 2;

	if f1 { 
	    //REPAIR
	    //Select number of rounds to fire
	    //Increase by a rate of 10
	    if mouse_wheel_up() { 
	        //Check if there is enough ammo available to add another amount
	        if repair_v_amount <= (repair_v_ammo-repair_rate) { 
	            //Make sure the unit ammo does not go over max
	            if ((repair_v_amount+repair_count)+repair_rate) <= repair_max {
	                //Check if there is enough turn AP for the move
	                var m_ap = (global.turn_AP-global.temp_AP);
	                if m_ap >= ap_cost {
	                    //Check total unit AP available
	                    var i;
	                    var u_ap = 0;
	                    if !ds_list_empty(global.selected_list) {
	                        for (i=0; i<ds_list_size(global.selected_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_list, i);
	                            if unit.manned_unit != noone { u_ap += unit.action_points; }
	                        }
	                    }
	                    if u_ap >= ((repair_v_amount+repair_rate)/repair_rate)*ap_cost {
	                        //Add the rounds
	                        repair_v_amount += repair_rate; 
	                    }
	                }
	            } 
	        }
	    }
	    //Decrease by a rate of 4
	    if mouse_wheel_down() { 
	        if repair_v_amount >= repair_rate { 
	            repair_v_amount -= repair_rate; 
	        } 
	    }
	    //Clamp the value between zero and the max available rounds
	    if repair_v_amount < 0 { repair_v_amount = 0; }
	    if repair_v_amount > repair_v_ammo { repair_v_amount = repair_v_ammo; }
	    //Add to temp AP cost
	    global.temp_AP = (repair_v_amount/repair_rate)*ap_cost;
	    //Set menu position
	    global.fire_option = 0; 
	    //Switch off zoom
	    global.can_zoom  = false;
	    obj_ACTIONMENU.display_tabinfo = false;
	    obj_ACTIONMENU.display_menuinfo = true;
	}
	    else if f2 {
	        //CANCEL
	        global.fire_option = 1; 
	        global.can_zoom  = true; 
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = false;
	    }
	        else { 
	            //OUT OF MENU AREA
	            global.fire_option = 0; 
	            global.can_zoom  = true;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = false;
	        }
                
	if mouse_check_button_pressed(mb_left) {
	    if global.my_turn == true {
	        if f0 { 
	        }
	            else if f1 { 
	                //REPAIR
	                //Remove parts cost
	                if repair_v_amount != 0 {
	                    var t=0;
	                    while (repair_v_amount >= repair_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_list, i);
	                            var amt = (u.manned_unit.shoot_amount*repair_rate);
	                            if (u.manned_unit.repair_ammo >= repair_rate) {
	                                if (u.action_points >= ap_cost) && (u.unit_health+amt <= u.health_max-repair_rate){
	                                    repair_v_amount -= repair_rate;
	                                    if repair_v_amount >= 0 { 
	                                        if u.manned_unit.shoot_amount == 0 { 
	                                            u.manned_unit.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.manned_unit.shoot_repair = true;
	                                            u.manned_unit.weapon   = "REPAIR";
	                                            u.manned_unit.target_x = x;
	                                            u.manned_unit.target_y = y;
	                                            u.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
												if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                        }
	                                        u.manned_unit.shoot_amount  += 1; 
	                                        u.manned_unit.repair_ammo   -= repair_rate;
	                                        global.turn_AP              -= ap_cost;
	                                        u.action_points             -= ap_cost;
	                                        u.alert_text                 = "-"+string(u.manned_unit.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            repair_v_amount = 0; 
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_list, i);
	                        with unit { if resupplying == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    repair_v_amount = 0;
	                }
	                    else { 
							//Deselect all units
							if !ds_list_empty(global.selected_list) {
								scr_DeselectAll();
							}
	                        global.repair_display = false;
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
	                global.can_zoom  = true;
	            }
	                else if f2 { 
	                    //CANCEL
						//Deselect all units
						if !ds_list_empty(global.selected_list) {
							scr_DeselectAll();
						}
	                    //Stop drawing all menus
	                    global.repair_display = false;
						//Reset menu animation
						menu_anim = true;
						menu_anim_count = 0;
						menu_alpha = 0;
						menu_scl = 0;
						//Remove the surface
						if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                }
	    }
	}

}
