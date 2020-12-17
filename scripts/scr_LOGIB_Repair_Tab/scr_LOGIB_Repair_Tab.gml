/// @description scr_LOGIB_Repair_Tab(target_unit, mg_ammo, mg_max, mg_rate);
/// @param target_unit
/// @param mg_ammo
/// @param mg_max
/// @param mg_rate
function scr_LOGIB_Repair_Tab(argument0, argument1, argument2, argument3) {

	/*
	lbr_fire_menu[0] = "MG Ammo";
	lbr_fire_menu[1] = "Retarget";
	lbr_fire_menu[2] = "Cancel";
	*/

	var repairmg_count       = argument1;
	var mg_max               = argument2;
	var repairmg_supply_rate = argument3;

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

	var ap_cost = obj_LOGIB_Unit.ap_cost;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //RESUPPLY MG AMMO
	        //Select number of rounds to fire
	        //Increase by a rate of 20
	        if mouse_wheel_up() { 
	            //Check if there is enough supply available
	            if rprmg_l_amount <= (logib_amo_supply-repairmg_supply_rate) {
	                //Make sure the unit ammo does not go over max
	                if ((rprmg_l_amount+repairmg_count)+repairmg_supply_rate) <= mg_max {
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
	                        if ap >= ((rprmg_l_amount+repairmg_supply_rate)/repairmg_supply_rate)*ap_cost {
	                            //Add the rounds
	                            rprmg_l_amount += repairmg_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 10
	        if mouse_wheel_down() { 
	            if rprmg_l_amount >= repairmg_supply_rate { 
	                rprmg_l_amount -= repairmg_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if rprmg_l_amount < 0 { rprmg_l_amount = 0; }
	        if rprmg_l_amount > logib_amo_supply { rprmg_l_amount = logib_amo_supply; }
	        //Add to temp AP cost
	        global.temp_AP = (rprmg_l_amount/repairmg_supply_rate)*ap_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
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
	                //global.fire_option = 0; 
	                global.can_zoom  = true;
	                global.header_highlight = false;
	                obj_ACTIONMENU.display_tabinfo = false;
	                obj_ACTIONMENU.display_menuinfo = false;
	            }
            
	if mouse_check_button_pressed(mb_left) {
	    if global.my_turn == true {
	        if f0 { 
	            //Switch ammo/fire options tab
				if ds_list_size(tabs) > 1 {
					var t_size = ds_list_size(tabs)-1;
					if tab_count < t_size { tab_count += 1; }
						else { tab_count = 0; }
					global.ammo_tab = ds_list_find_value(tabs, tab_count);
					rprmg_l_amount   = 0;
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
	                //TRANSFER AMMO SUPPLY
	                //Remove ammo cost
	                if rprmg_l_amount != 0 {
	                    var t=0;
	                    while (rprmg_l_amount >= repairmg_supply_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_logib_list, i);
	                            if (u.can_shoot == true) && (u.ammo_supply >= repairmg_supply_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    rprmg_l_amount -= repairmg_supply_rate;
	                                    if rprmg_l_amount >= 0 {
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_ammo = true;
	                                            u.weapon = "MG";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.resupply_unit = argument0;
	                                            u.resupply_unit.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
	                                        }
	                                        u.shoot_amount   += 1; 
	                                        u.ammo_supply    -= repairmg_supply_rate;
	                                        global.turn_AP   -= ap_cost;
	                                        u.action_points  -= ap_cost; 
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            rprmg_l_amount = 0;
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
	                    rprmg_l_amount = 0;
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
