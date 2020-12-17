/// @description scr_LOGIA_LACA_Tab(target_unit, depot_supply, repair_supply, tow_supply, mortar_supply, depot_max, repair_max, tow_max, mortar_max, depot_rate, repair_rate, tow_rate, mortar_rate);
/// @param target_unit
/// @param depot_supply
/// @param repair_supply
/// @param tow_supply
/// @param mortar_supply
/// @param depot_max
/// @param repair_max
/// @param tow_max
/// @param mortar_max
/// @param depot_rate
/// @param repair_rate
/// @param tow_rate
/// @param mortar_rate
function scr_LOGIA_LACA_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) {

	/*
	laea_fire_menu[0] = "Depot Parts";
	laea_fire_menu[1] = "Repair Parts";
	laea_fire_menu[2] = "TOW Parts";
	laea_fire_menu[3] = "Mortar Parts";
	laea_fire_menu[4] = "Retarget";
	laea_fire_menu[5] = "Cancel";
	*/

	var depot_count        = argument1*argument9;
	var repair_count       = argument2*argument10;
	var tow_count          = argument3*argument11;
	var mortar_count       = argument4*argument12;
	var depot_max          = argument5*argument9;
	var repair_max         = argument6*argument10;
	var tow_max            = argument7*argument11;
	var mortar_max         = argument8*argument12;
	var lacdpt_supply_rate = argument9;
	var lacrpr_supply_rate = argument10;
	var lactow_supply_rate = argument11;
	var lacmtr_supply_rate = argument12;

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

	var ap_cost = obj_LOGIA_Unit.ap_cost;

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
	            if lacdpt_l_amount <= (logia_bld_supply-lacdpt_supply_rate) {
	                //Make sure the unit does not go over max
	                if ((lacdpt_l_amount+depot_count)+lacdpt_supply_rate) <= depot_max {
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >= ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_logia_list) {
	                            for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_logia_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((lacdpt_l_amount+lacdpt_supply_rate)/lacdpt_supply_rate)*ap_cost {
	                            //Add the rounds
	                            lacdpt_l_amount +=  lacdpt_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 1
	        if mouse_wheel_down() { 
	            if lacdpt_l_amount >= lacdpt_supply_rate { 
	                lacdpt_l_amount -= lacdpt_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if lacdpt_l_amount < 0 { lacdpt_l_amount = 0; }
	        if lacdpt_l_amount > logia_bld_supply { lacdpt_l_amount = logia_bld_supply; }
	        //Add to temp AP cost
	        global.temp_AP = (lacdpt_l_amount/lacdpt_supply_rate)*ap_cost;
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
	                if lacrpr_l_amount <= (logia_bld_supply-lacrpr_supply_rate) {
	                    //Make sure the unit does not go over max
	                    if ((lacrpr_l_amount+repair_count)+lacrpr_supply_rate) <= repair_max {
	                        //Check if there is enough turn AP for the move
	                        var m_ap = (global.turn_AP-global.temp_AP);
	                        if m_ap >= ap_cost {
	                            //Check total unit AP available
	                            var i;
	                            var ap = 0;
	                            if !ds_list_empty(global.selected_logia_list) {
	                                for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                    var unit = ds_list_find_value(global.selected_logia_list, i);
	                                    if unit.can_shoot == true { ap += unit.action_points; }
	                                }
	                            }
	                            if ap >= ((lacrpr_l_amount+lacrpr_supply_rate)/lacrpr_supply_rate)*ap_cost {
	                                //Add the rounds
	                                lacrpr_l_amount += lacrpr_supply_rate; 
	                            }
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 1
	            if mouse_wheel_down() { 
	                if lacrpr_l_amount >= lacrpr_supply_rate { 
	                    lacrpr_l_amount -= lacrpr_supply_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if lacrpr_l_amount < 0 { lacrpr_l_amount = 0; }
	            if lacrpr_l_amount > logia_bld_supply { lacrpr_l_amount = logia_bld_supply; }
	            //Add to temp AP cost
	            global.temp_AP = (lacrpr_l_amount/lacrpr_supply_rate)*ap_cost;
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
	                    if lactow_l_amount <= (logia_bld_supply-lactow_supply_rate) {
	                        //Make sure the unit rifle building does not go over max
	                        if ((lactow_l_amount+tow_count)+lactow_supply_rate) <= tow_max {
	                            //Check if there is enough turn AP for the move
	                            var m_ap = (global.turn_AP-global.temp_AP);
	                            if m_ap >= ap_cost {
	                                //Check total unit AP available
	                                var i;
	                                var ap = 0;
	                                if !ds_list_empty(global.selected_logia_list) {
	                                    for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                        var unit = ds_list_find_value(global.selected_logia_list, i);
	                                        if unit.can_shoot == true { ap += unit.action_points; }
	                                    }
	                                }
	                                if ap >= ((lactow_l_amount+lactow_supply_rate)/lactow_supply_rate)*ap_cost {
	                                    //Add the rounds
	                                    lactow_l_amount += lactow_supply_rate; 
	                                }
	                            }
	                        }
	                    } 
	                }
	                //Decrease by a rate of 1
	                if mouse_wheel_down() { 
	                    if lactow_l_amount >= lactow_supply_rate { 
	                        lactow_l_amount -= lactow_supply_rate; 
	                    } 
	                }
	                //Clamp the value between zero and the max available rounds
	                if lactow_l_amount < 0 { lactow_l_amount = 0; }
	                if lactow_l_amount > logia_bld_supply { lactow_l_amount = logia_bld_supply; }
	                //Add to temp AP cost
	                global.temp_AP = (lactow_l_amount/lactow_supply_rate)*ap_cost;
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
	                        if lacmtr_l_amount <= (logia_bld_supply-lacmtr_supply_rate) {
	                            //Make sure the unit does not go over max
	                            if ((lacmtr_l_amount+mortar_count)+lacmtr_supply_rate) <= mortar_max {
	                                //Check if there is enough turn AP for the move
	                                var m_ap = (global.turn_AP-global.temp_AP);
	                                if m_ap >= ap_cost {
	                                    //Check total unit AP available
	                                    var i;
	                                    var ap = 0;
	                                    if !ds_list_empty(global.selected_logia_list) {
	                                        for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                            var unit = ds_list_find_value(global.selected_logia_list, i);
	                                            if unit.can_shoot == true { ap += unit.action_points; }
	                                        }
	                                    }
	                                    if ap >= ((lacmtr_l_amount+lacmtr_supply_rate)/lacmtr_supply_rate)*ap_cost {
	                                        //Add the rounds
	                                        lacmtr_l_amount += lacmtr_supply_rate; 
	                                    }
	                                }
	                            }
	                        } 
	                    }
	                    //Decrease by a rate of 1
	                    if mouse_wheel_down() { 
	                        if lacmtr_l_amount >= lacmtr_supply_rate { 
	                            lacmtr_l_amount -= lacmtr_supply_rate; 
	                        } 
	                    }
	                    //Clamp the value between zero and the max available rounds
	                    if lacmtr_l_amount < 0 { lacmtr_l_amount = 0; }
	                    if lacmtr_l_amount > logia_bld_supply { lacmtr_l_amount = logia_bld_supply; }
	                    //Add to temp AP cost
	                    global.temp_AP = (lacmtr_l_amount/lacmtr_supply_rate)*ap_cost;
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
					lacdpt_l_amount = 0;
			        lacrpr_l_amount = 0;
			        lactow_l_amount = 0;
			        lacmtr_l_amount = 0;
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
	                //TRANSFER DEPOT SUPPLY
	                //Remove supply cost
	                if lacdpt_l_amount != 0 {
	                    var t=0;
	                    while (lacdpt_l_amount >= lacdpt_supply_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_logia_list, i);
	                            if (u.can_shoot == true) && (u.building_supply >= lacdpt_supply_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    lacdpt_l_amount -= lacdpt_supply_rate;
	                                    if lacdpt_l_amount >= 0 { 
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_building = true;
	                                            u.weapon = "DEPOT";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.resupply_unit = argument0;
	                                            u.resupply_unit.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
	                                        }
	                                        u.shoot_amount     += 1; 
	                                        u.building_supply  -= lacdpt_supply_rate;
	                                        global.turn_AP     -= ap_cost;
	                                        u.action_points    -= ap_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            lacdpt_l_amount = 0;
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_logia_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    lacdpt_l_amount = 0;
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
	                    //TRANSFER REPAIR SUPPLY
	                    //Remove supply cost
	                    if lacrpr_l_amount != 0 {
	                        var t=0;
	                        while (lacrpr_l_amount >= lacrpr_supply_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_logia_list, i);
	                                if (u.can_shoot == true) && (u.building_supply >= lacrpr_supply_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        lacrpr_l_amount -= lacrpr_supply_rate;
	                                        if lacrpr_l_amount >= 0 { 
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_building = true;
	                                                u.weapon = "REPAIR";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.resupply_unit = argument0;
	                                                u.resupply_unit.resupplying = true;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
	                                            }
	                                            u.shoot_amount    += 1; 
	                                            u.building_supply -= lacrpr_supply_rate;
	                                            global.turn_AP    -= ap_cost;
	                                            u.action_points   -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                lacrpr_l_amount = 0;
	                                global.targeting_error = true;
	                            } 
	                        }
	                    }
	                    //Hold shift to keep targeting
	                    if keyboard_check_direct(vk_shift) {
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_logia_list, i);
	                            with unit { if action_confirmed == true { selected = false; } }
	                        }
	                        ammo_check = true;
	                        lacrpr_l_amount = 0;
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
	                    else if f3 {
	                        //TRANSFER TOW SUPPLY
	                        //Remove supply cost
	                        if lactow_l_amount != 0 {
	                            var t=0;
	                            while (lactow_l_amount >= lactow_supply_rate) {
	                                t+=1;
	                                var i;
	                                for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                    var u = ds_list_find_value(global.selected_logia_list, i);
	                                    if (u.can_shoot == true) && (u.building_supply >= lactow_supply_rate) {
	                                        if (u.action_points >= ap_cost) {
	                                            lactow_l_amount -= lactow_supply_rate;
	                                            if lactow_l_amount >= 0 { 
	                                                if u.shoot_amount == 0 { 
	                                                    u.action_confirmed = true;
	                                                    global.units_running += 1; 
	                                                    u.shoot_building = true;
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
	                                                u.building_supply -= lactow_supply_rate;
	                                                global.turn_AP    -= ap_cost;
	                                                u.action_points   -= ap_cost;
	                                                u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                            }
	                                        }
	                                    }
	                                }
	                                if t >= 200 { 
	                                    lactow_l_amount = 0;
	                                    global.targeting_error = true;
	                                } 
	                            }
	                        }
	                        //Hold shift to keep targeting
	                        if keyboard_check_direct(vk_shift) {
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_logia_list, i);
	                                with unit { if action_confirmed == true { selected = false; } }
	                            }
	                            ammo_check = true;
	                            lactow_l_amount = 0;
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
	                        else if f4 {
	                            //TRANSFER MORTAR SUPPLY
	                            //Remove supply cost
	                            if lacmtr_l_amount != 0 {
	                                var t=0;
	                                while (lacmtr_l_amount >= lacmtr_supply_rate) {
	                                    t+=1;
	                                    var i;
	                                    for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                        var u = ds_list_find_value(global.selected_logia_list, i);
	                                        if (u.can_shoot == true) && (u.building_supply >= lacmtr_supply_rate) {
	                                            if (u.action_points >= ap_cost) {
	                                                lacmtr_l_amount -= lacmtr_supply_rate;
	                                                if infflr_l_amount >= 0 { 
	                                                    if u.shoot_amount == 0 { 
	                                                        u.action_confirmed = true;
	                                                        global.units_running += 1; 
	                                                        u.shoot_building = true;
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
	                                                    u.building_supply -= lacmtr_supply_rate;
	                                                    global.turn_AP    -= ap_cost;
	                                                    u.action_points   -= ap_cost;
	                                                    u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                                }
	                                            }
	                                        }
	                                    }
	                                    if t >= 200 { 
	                                        lacmtr_l_amount = 0;
	                                        global.targeting_error = true;
	                                    } 
	                                }
	                            }
	                            //Hold shift to keep targeting
	                            if keyboard_check_direct(vk_shift) {
	                                var i;
	                                for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                    var unit = ds_list_find_value(global.selected_logia_list, i);
	                                    with unit { if action_confirmed == true { selected = false; } }
	                                }
	                                ammo_check = true;
	                                lacmtr_l_amount = 0;
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
