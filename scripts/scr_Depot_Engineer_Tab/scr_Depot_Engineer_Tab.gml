/// @description scr_Depot_Engineer_Tab(target_unit, depot_supply, repair_supply, tow_supply, mortar_supply, depot_max, repair_max, tow_max, mortar_max, depot_rate, repair_rate, tow_rate, mortar_rate);
/// @param target_unit
/// @param  depot_supply
/// @param  repair_supply
/// @param  tow_supply
/// @param  mortar_supply
/// @param  depot_max
/// @param  repair_max
/// @param  tow_max
/// @param  mortar_max
/// @param  depot_rate
/// @param  repair_rate
/// @param  tow_rate
/// @param  mortar_rate
function scr_Depot_Engineer_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) {

	/*  Arguments
	0   resupply unit ID        
	1   depot supply count     
	2   repair supply count                
	3   tow supply count
	4   mortar supply count
	5   max depot supply the unit can carry
	6   max repair supply the unit can carry
	7   max tow supply the unit can carry
	8   max mortar supply the unit can carry
	*/

	/*
	le_fire_menu[0] = "Depot Parts";
	le_fire_menu[1] = "Repair Parts";
	le_fire_menu[2] = "TOW Parts";
	le_fire_menu[3] = "Mortar Parts";
	le_fire_menu[4] = "Retarget";
	le_fire_menu[5] = "Cancel";
	*/

	var depot_count        = argument1*argument9;
	var repair_count       = argument2*argument10;
	var tow_count          = argument3*argument11;
	var mortar_count       = argument4*argument12;
	var depot_max          = argument5*argument9;
	var repair_max         = argument6*argument10;
	var tow_max            = argument7*argument11;
	var mortar_max         = argument8*argument12;
	var depot_supply_rate  = argument9;
	var repair_supply_rate = argument10;
	var tow_supply_rate    = argument11;
	var mortar_supply_rate = argument12;

	var f0;
	var f1;
	var f2;
	var f3;
	var f4;
	var f5;
	var f6;

	if p_one == true {
		f0 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
		f3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*3)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
		f4 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*4)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
		f5 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*5)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*6)*global.menu_ratio, obj_MOUSE, false, false);
		f6 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*6)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*7)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			f0 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
			f3 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*2)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
			f4 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*3)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
			f5 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*4)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
			f6 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*5)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*6)*global.menu_ratio, obj_MOUSE, false, false);
		}

	var ap_cost = 2;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //RESUPPLY DEPOT
	        //Select number of rounds to fire
	        //Increase by a rate of 1 building supply
	        if mouse_wheel_up() { 
	            //Check if there is enough building supply available
	            if global.depot_d_amount <= (global.parts_ammo-depot_supply_rate) {
	                //Make sure the unit does not go over max
	                if ((global.depot_d_amount+depot_count)+depot_supply_rate) <= depot_max {
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
	                        if ap >= ((global.depot_d_amount+depot_supply_rate)/depot_supply_rate)*ap_cost {
	                            //Add the rounds
	                            global.depot_d_amount +=  depot_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 1
	        if mouse_wheel_down() { 
	            if global.depot_d_amount >= depot_supply_rate { 
	                global.depot_d_amount -= depot_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if global.depot_d_amount < 0 { global.depot_d_amount = 0; }
	        if global.depot_d_amount > global.parts_ammo { global.depot_d_amount = global.parts_ammo; }
	        //Add to temp AP cost
	        global.temp_AP = (global.depot_d_amount/depot_supply_rate)*ap_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 {
	            //RESUPPLY REPAIR
	            //Select number of rounds to fire
	            //Increase by a rate of 1 building supply
	            if mouse_wheel_up() { 
	                //Check if there is enough building supply available
	                if global.repair_d_amount <= (global.parts_ammo-repair_supply_rate) {
	                    //Make sure the unit does not go over max
	                    if ((global.repair_d_amount+repair_count)+repair_supply_rate) <= repair_max {
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
	                            if ap >= ((global.repair_d_amount+repair_supply_rate)/repair_supply_rate)*ap_cost {
	                                //Add the rounds
	                                global.repair_d_amount +=  repair_supply_rate; 
	                            }
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 1
	            if mouse_wheel_down() { 
	                if global.repair_d_amount >= repair_supply_rate { 
	                    global.repair_d_amount -= repair_supply_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if global.repair_d_amount < 0 { global.repair_d_amount = 0; }
	            if global.repair_d_amount > global.parts_ammo { global.repair_d_amount = global.parts_ammo; }
	            //Add to temp AP cost
	            global.temp_AP = (global.repair_d_amount/repair_supply_rate)*ap_cost;
	            //Set the menu position
	            global.fire_option = 1; 
	            //Switch off camera zoom
	            global.can_zoom  = false;
	            global.header_highlight = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = true;
	        }
	            else if f3 {
	                //RESUPPLY TOW
	                //Select number of rounds to fire
	                //Increase by a rate of 1
	                if mouse_wheel_up() { 
	                     //Check if there is enough building supply available
	                    if global.tow_d_amount <= (global.parts_ammo-tow_supply_rate) {
	                        //Make sure the unit rifle building does not go over max
	                        if ((global.tow_d_amount+tow_count)+tow_supply_rate) <= tow_max {
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
	                                if ap >= ((global.tow_d_amount+tow_supply_rate)/tow_supply_rate)*ap_cost {
	                                    //Add the rounds
	                                    global.tow_d_amount +=  tow_supply_rate; 
	                                }
	                            }
	                        }
	                    } 
	                }
	                //Decrease by a rate of 1
	                if mouse_wheel_down() { 
	                    if global.tow_d_amount >= tow_supply_rate { 
	                        global.tow_d_amount -= tow_supply_rate; 
	                    } 
	                }
	                //Clamp the value between zero and the max available rounds
	                if global.tow_d_amount < 0 { global.tow_d_amount = 0; }
	                if global.tow_d_amount > global.parts_ammo { global.tow_d_amount = global.parts_ammo; }
	                //Add to temp AP cost
	                global.temp_AP = (global.tow_d_amount/tow_supply_rate)*ap_cost;
	                global.fire_option = 2; 
	                //Switch off camera zoom
	                global.can_zoom  = false;
	                global.header_highlight = false;
	                obj_ACTIONMENU.display_tabinfo = false;
	                obj_ACTIONMENU.display_menuinfo = true;
	            }
	                else if f4 {
	                    //RESUPPLY MORTAR
	                    //Select number of rounds to fire
	                    //Increase by a rate of 1
	                    if mouse_wheel_up() { 
	                         //Check if there is enough building supply available
	                        if global.mortar_d_amount <= (global.parts_ammo-mortar_supply_rate) {
	                            //Make sure the unit does not go over max
	                            if ((global.mortar_d_amount+mortar_count)+mortar_supply_rate) <= mortar_max {
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
	                                    if ap >= ((global.mortar_d_amount+mortar_supply_rate)/mortar_supply_rate)*ap_cost {
	                                        //Add the rounds
	                                        global.mortar_d_amount +=  mortar_supply_rate; 
	                                    }
	                                }
	                            }
	                        } 
	                    }
	                    //Decrease by a rate of 1
	                    if mouse_wheel_down() { 
	                        if global.mortar_d_amount >= mortar_supply_rate { 
	                            global.mortar_d_amount -= mortar_supply_rate; 
	                        } 
	                    }
	                    //Clamp the value between zero and the max available rounds
	                    if global.mortar_d_amount < 0 { global.mortar_d_amount = 0; }
	                    if global.mortar_d_amount > global.parts_ammo { global.mortar_d_amount = global.parts_ammo; }
	                    //Add to temp AP cost
	                    global.temp_AP = (global.mortar_d_amount/mortar_supply_rate)*ap_cost;
	                    global.fire_option = 3; 
	                    //Switch off camera zoom
	                    global.can_zoom  = false;
	                    global.header_highlight = false;
	                    obj_ACTIONMENU.display_tabinfo = false;
	                    obj_ACTIONMENU.display_menuinfo = true;
	                }
	                    else if f5 {
	                        //RE-TARGET 
	                        global.fire_option = 4; 
	                        global.can_zoom  = true; 
	                        global.header_highlight = false;
	                        obj_ACTIONMENU.display_tabinfo = false;
	                        obj_ACTIONMENU.display_menuinfo = false;
	                    }
	                        else if f6 {
	                            //CANCEL
	                            global.fire_option = 5; 
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
	                //TRANSFER DEPOT SUPPLY
	                //Remove supply cost
	                if global.depot_d_amount != 0 {
	                    var t=0;
	                    while (global.depot_d_amount >= depot_supply_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_depot_list, i);
	                            if (u.can_shoot == true) && (u.parts_ammo >= depot_supply_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    global.depot_d_amount -= depot_supply_rate;
	                                    if global.depot_d_amount >= 0 {
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_parts = true;
	                                            u.weapon = "DEPOT";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.resupply_unit = argument0;
	                                            u.resupply_unit.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
	                                        }
	                                        u.shoot_amount  += 1; 
	                                        u.parts_ammo    -= depot_supply_rate;
	                                        global.turn_AP  -= ap_cost;
	                                        u.action_points -= ap_cost; 
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            global.depot_d_amount = 0;
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
	                    global.depot_d_amount = 0;
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
	                    //TRANSFER REPAIR SUPPLY
	                    //Remove supply cost
	                    if global.repair_d_amount != 0 {
	                        var t=0;
	                        while (global.repair_d_amount >= repair_supply_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_depot_list, i);
	                                if (u.can_shoot == true) && (u.parts_ammo >= repair_supply_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        global.repair_d_amount -= repair_supply_rate;
	                                        if global.repair_d_amount >= 0 {
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_parts = true;
	                                                u.weapon = "REPAIR";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.resupply_unit = argument0;
	                                                u.resupply_unit.resupplying = true;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
	                                            }
	                                            u.shoot_amount  += 1; 
	                                            u.parts_ammo    -= repair_supply_rate;
	                                            global.turn_AP  -= ap_cost;
	                                            u.action_points -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                global.repair_d_amount = 0;
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
	                        global.repair_d_amount = 0;
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
	                        //TRANSFER TOW SUPPLY
	                        //Remove supply cost
	                        if global.tow_d_amount != 0 {
	                            var t=0;
	                            while (global.tow_d_amount >= tow_supply_rate) {
	                                t+=1;
	                                var i;
	                                for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                                    var u = ds_list_find_value(global.selected_depot_list, i);
	                                    if (u.can_shoot == true) && (u.parts_ammo >= tow_supply_rate) {
	                                        if (u.action_points >= ap_cost) {
	                                            global.tow_d_amount -= tow_supply_rate;
	                                            if global.tow_d_amount >= 0 { 
	                                                if u.shoot_amount == 0 { 
	                                                    u.action_confirmed = true;
	                                                    global.units_running += 1; 
	                                                    u.shoot_parts = true;
	                                                    u.weapon = "TOW";
	                                                    u.target_x = global.target_x;
	                                                    u.target_y = global.target_y;
	                                                    u.resupply_unit = argument0;
	                                                    u.resupply_unit.resupplying = true;
	                                                    u.alert_display = true;
	                                                    u.alert_colour = c_red;
	                                                    u.alarm[3] = global.tick_rate*3;
	                                                }
	                                                u.shoot_amount    += 1; 
	                                                u.parts_ammo      -= tow_supply_rate;
	                                                global.turn_AP    -= ap_cost;
	                                                u.action_points   -= ap_cost;
	                                                u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                            }
	                                        }
	                                    }
	                                }
	                                if t >= 200 { 
	                                    global.tow_d_amount = 0;
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
	                            global.tow_d_amount = 0;
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
	                            //TRANSFER MORTAR SUPPLY
	                            //Remove supply cost
	                            if global.mortar_d_amount != 0 {
	                                var t=0;
	                                while (global.mortar_d_amount >= mortar_supply_rate) {
	                                    t+=1;
	                                    var i;
	                                    for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                                        var u = ds_list_find_value(global.selected_depot_list, i);
	                                        if (u.can_shoot == true) && (u.parts_ammo >= mortar_supply_rate) {
	                                            if (u.action_points >= ap_cost) {
	                                                global.mortar_d_amount -= mortar_supply_rate;
	                                                if global.flare_d_amount >= 0 { 
	                                                    if u.shoot_amount == 0 { 
	                                                        u.action_confirmed = true;
	                                                        global.units_running += 1; 
	                                                        u.shoot_parts = true;
	                                                        u.weapon = "MORTAR";
	                                                        u.target_x = global.target_x;
	                                                        u.target_y = global.target_y;
	                                                        u.resupply_unit = argument0;
	                                                        u.resupply_unit.resupplying = true;
	                                                        u.alert_display = true;
	                                                        u.alert_colour = c_red;
	                                                        u.alarm[3] = global.tick_rate*3;
	                                                    }
	                                                    u.shoot_amount    += 1; 
	                                                    u.parts_ammo      -= mortar_supply_rate;
	                                                    global.turn_AP    -= ap_cost;
	                                                    u.action_points   -= ap_cost;
	                                                    u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                                }
	                                            }
	                                        }
	                                    }
	                                    if t >= 200 { 
	                                        global.mortar_d_amount = 0;
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
	                                global.mortar_d_amount = 0;
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
	                            else if f5 { 
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
	                                else if f6 { 
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
