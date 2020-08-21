/// @description scr_Depot_Logi_Tab(target_unit, ammo_supply, building_supply, ammo_max, building_max, ammo_rate, building_rate);
/// @param target_unit
/// @param  ammo_supply
/// @param  building_supply
/// @param  ammo_max
/// @param  building_max
/// @param  ammo_rate
/// @param  building_rate
function scr_Depot_Logi_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	/*  Arguments
	0   resupply unit ID        
	1   ammo count     
	2   parts count                
	3   max ammo the unit can carry
	4   max parts ammo the unit can carry
	*/

	/*
	ll_fire_menu[0] = "Ammunition";
	ll_fire_menu[1] = "Parts";
	ll_fire_menu[2] = "Retarget";
	ll_fire_menu[3] = "Cancel";
	*/

	var ammo_count           = argument1;
	var building_count       = argument2;
	var ammo_max             = argument3;
	var building_max         = argument4;
	var ammo_supply_rate     = argument5;
	var building_supply_rate = argument6;

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

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //RESUPPLY AMMO
	        //Select number of rounds to fire
	        //Increase by a rate of 10
	        if mouse_wheel_up() { 
	            //Check if there is enough supply available
	            if global.ammo_d_amount <= (global.ammunition_ammo-ammo_supply_rate) {
	                //Make sure the unit ammo does not go over max
	                if ((global.ammo_d_amount+ammo_count)+ammo_supply_rate) <= ammo_max {
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >=  ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_depot_list) {
	                            for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_depot_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((global.ammo_d_amount+ammo_supply_rate)/ammo_supply_rate)*ap_cost {
	                            //Add the rounds
	                            global.ammo_d_amount +=  ammo_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 10
	        if mouse_wheel_down() { 
	            if global.ammo_d_amount >= ammo_supply_rate { 
	                global.ammo_d_amount -= ammo_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if global.ammo_d_amount < 0 { global.ammo_d_amount = 0; }
	        if global.ammo_d_amount > global.ammunition_ammo { global.ammo_d_amount = global.ammunition_ammo; }
	        //Add to temp AP cost
	        global.temp_AP = (global.ammo_d_amount/ammo_supply_rate)*ap_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 {
	            //RESUPPLY PARTS
	            //Select number of rounds to fire
	            //Increase by a rate of 10
	            if mouse_wheel_up() { 
	                //Check if there is enough supply available
	                if global.building_d_amount <= (global.parts_ammo-building_supply_rate) { 
	                    //Make sure the unit rpg ammo does not go over max
	                    if ((global.building_d_amount+building_count)+building_supply_rate) <= building_max {
	                        //Check if there is enough turn AP for the move
	                        var m_ap = (global.turn_AP-global.temp_AP);
	                        if m_ap >=  ap_cost {
	                            //Check total unit AP available
	                            var i;
	                            var ap = 0;
	                            if !ds_list_empty(global.selected_depot_list) {
	                                for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                                    var unit = ds_list_find_value(global.selected_depot_list, i);
	                                    if unit.can_shoot == true { ap += unit.action_points; }
	                                }
	                            }
	                            if ap >= ((global.building_d_amount+building_supply_rate)/building_supply_rate)*ap_cost {
	                                //Add the rounds
	                                global.building_d_amount += building_supply_rate; 
	                            }
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 4
	            if mouse_wheel_down() { 
	                if global.building_d_amount >= building_supply_rate { 
	                    global.building_d_amount -= building_supply_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if global.building_d_amount < 0 { global.building_d_amount = 0; }
	            if global.building_d_amount > global.parts_ammo { global.building_d_amount = global.parts_ammo; }
	            //Add to temp AP cost
	            global.temp_AP = (global.building_d_amount/building_supply_rate)*ap_cost;
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
	            //Switch ammo tab
	            if global.selected_depot != 0 {
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
	                                        else if global.selected_btr != 0 {
	                                            global.ammo_tab = "BTR"; 
												//Remove the surface
												if surface_exists(global.menu_surf) { surface_free (global.menu_surf); }
	                                            ammo_check = true;
	                                        }
	                                            else {
	                                            }
	        }
	            else if f1 {
	                //TRANSFER AMMO SUPPLY
	                //Remove ammo cost
	                if global.ammo_d_amount != 0 {
	                    var t=0;
	                    while (global.ammo_d_amount >= ammo_supply_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_depot_list, i);
	                            if (u.can_shoot == true) && (u.ammunition_ammo >= ammo_supply_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    global.ammo_d_amount -= ammo_supply_rate;
	                                    if global.ammo_d_amount >= 0 { 
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_ammunition = true;
	                                            u.weapon = "AMMO";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.resupply_unit = argument0;
	                                            u.resupply_unit.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
	                                        }
	                                        u.shoot_amount    += 1; 
	                                        u.ammunition_ammo -= ammo_supply_rate;
	                                        global.turn_AP    -= ap_cost;
	                                        u.action_points   -= ap_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            global.ammo_d_amount = 0;
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
	                    global.ammo_d_amount = 0;
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
	                    //TRANSFER PARTS SUPPLY
	                    //Remove ammo cost
	                    if global.building_d_amount != 0 {
	                        var t=0;
	                        while (global.building_d_amount >= building_supply_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_depot_list, i);
	                                if (u.can_shoot == true) && (u.parts_ammo >= building_supply_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        global.building_d_amount -= building_supply_rate;
	                                        if global.building_d_amount >= 0 {
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_parts = true;
	                                                u.weapon = "PARTS";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.resupply_unit = argument0;
	                                                u.resupply_unit.resupplying = true;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
	                                            }
	                                            u.shoot_amount   += 1; 
	                                            u.parts_ammo     -= building_supply_rate;
	                                            global.turn_AP   -= ap_cost;
	                                            u.action_points  -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                global.building_d_amount = 0;
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
	                        global.building_d_amount = 0;
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
