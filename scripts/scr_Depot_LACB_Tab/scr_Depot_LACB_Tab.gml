/// @description scr_Depot_LACB_Tab(target_unit, tow_ammo, tow_max, tow_rate);
/// @param target_unit
/// @param tow_ammo
/// @param tow_max
/// @param tow_rate
function scr_Depot_LACB_Tab(argument0, argument1, argument2, argument3) {

	/*
	laeb_fire_menu[0] = "TOW(s)";
	laeb_fire_menu[1] = "Retarget";
	laeb_fire_menu[2] = "Cancel";
	*/

	var tow_count           = argument1*argument3;
	var tow_max             = argument2*argument3;
	var lactow2_supply_rate = argument3;

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

	var ap_cost = obj_Depot_Static.ap_cost;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //RESUPPLY TOW2
	        //Select number of rounds to fire
	        //Increase by a rate 
	        if mouse_wheel_up() { 
	            //Check if there is enough ammo supply available
	            if lactow2_d_amount <= (dpt_amo_supply-lactow2_supply_rate) {
	                //Make sure the unit does not go over max
	                if ((lactow2_d_amount+tow_count)+lactow2_supply_rate) <= tow_max {
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >= ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_depot_list) {
	                            for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_depot_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((lactow2_d_amount+lactow2_supply_rate)/lactow2_supply_rate)*ap_cost {
	                            //Add the rounds
	                            lactow2_d_amount += lactow2_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 1
	        if mouse_wheel_down() { 
	            if lactow2_d_amount >= lactow2_supply_rate { 
	                lactow2_d_amount -= lactow2_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if lactow2_d_amount < 0 { lactow2_d_amount = 0; }
	        if lactow2_d_amount > dpt_amo_supply { lactow2_d_amount = dpt_amo_supply; }
	        //Add to temp AP cost
	        global.temp_AP = (lactow2_d_amount/lactow2_supply_rate)*ap_cost;
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
					lactow2_d_amount = 0;
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
	                //TRANSFER TOW AMMO
	                //Remove supply cost
	                if lactow2_d_amount != 0 {
	                    var t=0;
	                    while (lactow2_d_amount >= lactow2_supply_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_depot_list, i);
	                            if (u.can_shoot == true) && (u.ammunition_ammo >= lactow2_supply_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    lactow2_d_amount -= lactow2_supply_rate;
	                                    if lactow2_d_amount >= 0 { 
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_ammunition = true;
	                                            u.weapon = "TOWMOBILE";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.resupply_unit = argument0;
	                                            u.resupply_unit.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
	                                        }
	                                        u.shoot_amount     += 1; 
	                                        u.ammunition_ammo  -= lactow2_supply_rate;
	                                        global.turn_AP     -= ap_cost;
	                                        u.action_points    -= ap_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            lactow2_d_amount = 0;
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_depot_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    lactow2_d_amount = 0;
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
