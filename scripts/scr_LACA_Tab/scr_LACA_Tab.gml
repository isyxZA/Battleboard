/// @description scr_LACA_Tab(depot_rate, repair_rate, tow_rate, mortar_rate, ap_cost)
/// @param depot_rate
/// @param  repair_rate
/// @param  tow_rate
/// @param  mortar_rate
/// @param  ap_cost
function scr_LACA_Tab(argument0, argument1, argument2, argument3, argument4) {

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

	var depot_rate  = argument0;
	var repair_rate = argument1;
	var tow_rate    = argument2;
	var mortar_rate = argument3;
	var ap_cost     = argument4;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //DEPOT
	        //Select number of rounds to fire
	        //Increase by a rate of 1
	        if mouse_wheel_up() { 
	            //Check if there is enough ammo available
	            if laca_dpt_amount <= (laca_dpt_supply-depot_rate) { 
	                //Check if there is enough turn AP for the move
	                var m_ap = (global.turn_AP-global.temp_AP);
	                if m_ap >=  ap_cost {
	                    //Check total unit AP available
	                    var i;
	                    var ap = 0;
	                    if !ds_list_empty(global.selected_laca_list) {
	                        for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_laca_list, i);
	                            if unit.can_shoot == true { ap += unit.action_points; }
	                        }
	                    }
	                    if ap >= ((laca_dpt_amount+depot_rate)/depot_rate)*ap_cost {
	                        if laca_dpt_amount <= 0 {
	                            //Add the rounds
	                            laca_dpt_amount += depot_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 1
	        if mouse_wheel_down() { 
	            if laca_dpt_amount >= depot_rate { 
	                laca_dpt_amount -= depot_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if laca_dpt_amount < 0 { laca_dpt_amount = 0; }
	        if laca_dpt_amount > 1 { laca_dpt_amount = 1; }
	        //Add to temp AP cost
	        global.temp_AP = (laca_dpt_amount/depot_rate)*ap_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 { 
	            //REPAIR
	            //Select number of rounds to fire
	            //Increase by a rate of 1
	            if mouse_wheel_up() { 
	                //Check if there is enough ammo available
	                if laca_rpr_amount <= (laca_rpr_supply-repair_rate) { 
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >=  ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_laca_list) {
	                            for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_laca_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((laca_rpr_amount+repair_rate)/repair_rate)*ap_cost {
	                            if laca_rpr_amount <= 0 {
	                                //Add the rounds
	                                laca_rpr_amount += repair_rate; 
	                            }
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 1
	            if mouse_wheel_down() { 
	                if laca_rpr_amount >= repair_rate { 
	                    laca_rpr_amount -= repair_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if laca_rpr_amount < 0 { laca_rpr_amount = 0; }
	            if laca_rpr_amount > 1 { laca_rpr_amount = 1; }
	            //Add to temp AP cost
	            global.temp_AP = (laca_rpr_amount/repair_rate)*ap_cost;
	            //Set the menu position
	            global.fire_option = 1; 
	            //Switch off camera zoom
	            global.can_zoom  = false;
	            global.header_highlight = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = true;
	        }
	            else if f3 { 
	                //TOW
	                //Select number of rounds to fire
	                //Increase by a rate of 1
	                if mouse_wheel_up() { 
	                    //Check if there is enough ammo available
	                    if laca_tow_amount <= (laca_tow_supply-tow_rate) { 
	                        //Check if there is enough turn AP for the move
	                        var m_ap = (global.turn_AP-global.temp_AP);
	                        if m_ap >= ap_cost {
	                            //Check total unit AP available
	                            var i;
	                            var ap = 0;
	                            if !ds_list_empty(global.selected_laca_list) {
	                                for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                                    var unit = ds_list_find_value(global.selected_laca_list, i);
	                                    if unit.can_shoot == true { ap += unit.action_points; }
	                                }
	                            }
	                            if ap >= ((laca_tow_amount+tow_rate)/tow_rate)*ap_cost {
	                                if laca_tow_amount <= 0 {
	                                    //Add the rounds
	                                    laca_tow_amount += tow_rate; 
	                                }
	                            }
	                        }
	                    } 
	                }
	                //Decrease by a rate of 1
	                if mouse_wheel_down() { 
	                    if laca_tow_amount >= tow_rate { 
	                        laca_tow_amount -= tow_rate; 
	                    } 
	                }
	                //Clamp the value between zero and the max available rounds
	                if laca_tow_amount < 0 { laca_tow_amount = 0; }
	                if laca_tow_amount > 1 { laca_tow_amount = 1; }
	                //Add to temp AP cost
	                global.temp_AP = (laca_tow_amount/tow_rate)*ap_cost;
	                //Set the menu position
	                global.fire_option = 2; 
	                //Switch off camera zoom
	                global.can_zoom  = false;
	                global.header_highlight = false;
	                obj_ACTIONMENU.display_tabinfo = false;
	                obj_ACTIONMENU.display_menuinfo = true;
	            }
	                else if f4 { 
	                    //MORTAR
	                    //Select number of rounds to fire
	                    //Increase by a rate of 1
	                    if mouse_wheel_up() { 
	                        //Check if there is enough ammo available
	                        if laca_mtr_amount <= (laca_mtr_supply-mortar_rate) { 
	                            //Check if there is enough turn AP for the move
	                            var m_ap = (global.turn_AP-global.temp_AP);
	                            if m_ap >=  ap_cost {
	                                //Check total unit AP available
	                                var i;
	                                var ap = 0;
	                                if !ds_list_empty(global.selected_laca_list) {
	                                    for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                                        var unit = ds_list_find_value(global.selected_laca_list, i);
	                                        if unit.can_shoot == true { ap += unit.action_points; }
	                                    }
	                                }
	                                if ap >= ((laca_mtr_amount+mortar_rate)/mortar_rate)*ap_cost {
	                                    if laca_mtr_amount <= 0 {
	                                        //Add the rounds
	                                        laca_mtr_amount += mortar_rate; 
	                                    }
	                                }
	                            }
	                        } 
	                    }
	                    //Decrease by a rate of 1
	                    if mouse_wheel_down() { 
	                        if laca_mtr_amount >= mortar_rate { 
	                            laca_mtr_amount -= mortar_rate; 
	                        } 
	                    }
	                    //Clamp the value between zero and the max available rounds
	                    if laca_mtr_amount < 0 { laca_mtr_amount = 0; }
	                    if laca_mtr_amount > 1 { laca_mtr_amount = 1; }
	                    //Add to temp AP cost
	                    global.temp_AP = (laca_mtr_amount/mortar_rate)*ap_cost;
	                    //Set the menu position
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
	                                //OUT OF MENU AREA
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
					laca_dpt_amount = 0;
			        laca_rpr_amount = 0;
			        laca_tow_amount = 0;
			        laca_mtr_amount = 0;
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
	                //SET SUPPLY DEPOT
	                //Remove ammo cost
	                if laca_dpt_amount != 0 {
	                    var t=0;
	                    while (laca_dpt_amount >= depot_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_laca_list, i);
	                            if (u.can_shoot == true) && (u.depot_supply >= depot_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    laca_dpt_amount -= depot_rate;
	                                    if laca_dpt_amount >= 0 { 
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_depot = true;
	                                            u.weapon = "DEPOT";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
												if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                        }
	                                        u.shoot_amount   += 1; 
	                                        u.depot_supply   -= depot_rate;
	                                        global.turn_AP   -= ap_cost;
	                                        u.action_points  -= ap_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            laca_dpt_amount = 0; 
	                            global.targeting_error = true;
	                        } 
	                    }
	                }
	                //Hold shift to keep targeting
	                if keyboard_check_direct(vk_shift) {
	                    var i;
	                    for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                        var unit = ds_list_find_value(global.selected_laca_list, i);
	                        with unit { if action_confirmed == true { selected = false; } }
	                    }
	                    ammo_check = true;
	                    laca_dpt_amount = 0;
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
	                    //SET REPAIR STATION
	                    //Remove ammo cost
	                    if laca_rpr_amount != 0 {
	                        var t=0;
	                        while (laca_rpr_amount >= repair_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_laca_list, i);
	                                if (u.can_shoot == true) && (u.repair_supply >= repair_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        laca_rpr_amount -= repair_rate;
	                                        if laca_rpr_amount >= 0 {
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_repair = true;
	                                                u.weapon       = "REPAIR";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
													if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                            }
	                                            u.shoot_amount   += 1; 
	                                            u.repair_supply  -= repair_rate;
	                                            global.turn_AP   -= ap_cost;
	                                            u.action_points  -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                laca_rpr_amount = 0; 
	                                global.targeting_error = true;
	                            } 
	                        }
	                    }
	                    //Hold shift to keep targeting
	                    if keyboard_check_direct(vk_shift) {
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_laca_list, i);
	                            with unit { if action_confirmed == true { selected = false; } }
	                        }
	                        ammo_check = true;
	                        laca_rpr_amount = 0;
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
	                        //SET TOW
	                        //Remove ammo cost
	                        if laca_tow_amount != 0 {
	                            var t=0;
	                            while (laca_tow_amount >= tow_rate) {
	                                t+=1;
	                                var i;
	                                for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                                    var u = ds_list_find_value(global.selected_laca_list, i);
	                                    if (u.can_shoot == true) && (u.tow_supply >= tow_rate) {
	                                        if (u.action_points >= ap_cost) {
	                                            laca_tow_amount -= tow_rate;
	                                            if laca_tow_amount >= 0 {
	                                                if u.shoot_amount == 0 { 
	                                                    u.action_confirmed = true;
	                                                    global.units_running += 1; 
	                                                    u.shoot_tow = true;
	                                                    u.weapon    = "TOW";
	                                                    u.target_x = global.target_x;
	                                                    u.target_y = global.target_y;
	                                                    u.alert_display = true;
	                                                    u.alert_colour = c_red;
	                                                    u.alarm[3] = global.tick_rate*3;
														if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                                }
	                                                u.shoot_amount    += 1; 
	                                                u.tow_supply      -= tow_rate;
	                                                global.turn_AP    -= ap_cost;
	                                                u.action_points   -= ap_cost;
	                                                u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                            }
	                                        }
	                                    }
	                                }
	                                if t >= 200 { 
	                                    laca_tow_amount = 0;
	                                    global.targeting_error = true;
	                                } 
	                            }
	                        }
	                        //Hold shift to keep targeting
	                        if keyboard_check_direct(vk_shift) {
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_laca_list, i);
	                                with unit { if action_confirmed == true { selected = false; } }
	                            }
	                            ammo_check = true;
	                            laca_tow_amount = 0;
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
	                            //SET MORTAR
	                            //Remove ammo cost
	                            if laca_mtr_amount != 0 {
	                                var t=0;
	                                while (laca_mtr_amount >= mortar_rate) {   
	                                    t+=1;
	                                    var i;
	                                    for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                                        var u = ds_list_find_value(global.selected_laca_list, i);
	                                        if (u.can_shoot == true) && (u.mortar_supply >= mortar_rate) {
	                                            if (u.action_points >= ap_cost) {
	                                                laca_mtr_amount -= mortar_rate;
	                                                if laca_mtr_amount >= 0 { 
	                                                    if u.shoot_amount == 0 { 
	                                                        u.action_confirmed = true;
	                                                        global.units_running += 1; 
	                                                        u.shoot_mortar = true;
	                                                        u.weapon       = "MORTAR";
	                                                        u.target_x     = global.target_x;
	                                                        u.target_y     = global.target_y;
	                                                        u.alert_display = true;
	                                                        u.alert_colour = c_red;
	                                                        u.alarm[3] = global.tick_rate*3;
															if PLAYER.net_status != "NONE" { u.net_action = true; }
	                                                    }
	                                                    u.shoot_amount   += 1; 
	                                                    u.mortar_supply  -= mortar_rate;
	                                                    global.turn_AP   -= ap_cost;
	                                                    u.action_points  -= ap_cost;
	                                                    u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                                }
	                                            }
	                                        }
	                                    }
	                                    if t >= 200 { 
	                                        laca_mtr_amount = 0; 
	                                        global.targeting_error = true;
	                                    } 
	                                }
	                            }
	                            //Hold shift to keep targeting
	                            if keyboard_check_direct(vk_shift) {
	                                var i;
	                                for (i=0; i<ds_list_size(global.selected_laca_list); i+=1) {
	                                    var unit = ds_list_find_value(global.selected_laca_list, i);
	                                    with unit { if action_confirmed == true { selected = false; } }
	                                }
	                                ammo_check = true;
	                                laca_mtr_amount = 0;
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
	                                //RETARGET
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
	                                    global.fire_display     = false;
	                                    global.reticule_display = false;
	                                    global.menu_create      = false;
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
