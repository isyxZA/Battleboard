/// @description scr_Depot_LAVA_Tab(target_unit, he_ammo, ap_ammo, mg_ammo, at_ammo, he_max, ap_max, mg_max, at_max, he_rate, ap_rate, mg_rate, at_rate);
/// @param target_unit
/// @param he_ammo
/// @param ap_ammo
/// @param mg_ammo
/// @param at_ammo
/// @param he_max
/// @param ap_max
/// @param mg_max
/// @param at_max
/// @param he_rate
/// @param ap_rate
/// @param mg_rate
/// @param at_rate
function scr_Depot_LAVA_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) {

	/*
	laba_fire_menu[0] = "HE(s)";
	laba_fire_menu[1] = "AP(s)";
	laba_fire_menu[2] = "MG(s)";
	laba_fire_menu[3] = "TOW(s)";
	laba_fire_menu[4] = "Retarget";
	laba_fire_menu[5] = "Cancel";
	*/

	var he_count = argument1;
	var ap_count = argument2;
	var mg_count = argument3;
	var at_count = argument4;
	var he_max   = argument5;
	var ap_max   = argument6;
	var mg_max   = argument7;
	var at_max   = argument8;
	var lavhe_supply_rate = argument9;
	var lavap_supply_rate = argument10;
	var lavmg_supply_rate = argument11;
	var lavat_supply_rate = argument12;

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

	var ap_cost = obj_Depot_Static.ap_cost;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //RESUPPLY HE
	        //Select number of rounds to fire
	        //Increase by a rate of 4
	        if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
	            //Check if there is enough ammo supply available
	            if lavhe_d_amount <= (dpt_amo_supply-lavhe_supply_rate) {
	                //Make sure the unit ammo does not go over max
	                if ((lavhe_d_amount+he_count)+lavhe_supply_rate) <= he_max {
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
	                        if ap >= ((lavhe_d_amount+lavhe_supply_rate)/lavhe_supply_rate)*ap_cost {
	                            //Add the rounds
	                            lavhe_d_amount +=  lavhe_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 1
	        if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
	            if lavhe_d_amount >= lavhe_supply_rate { 
	                lavhe_d_amount -= lavhe_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if lavhe_d_amount < 0 { lavhe_d_amount = 0; }
	        if lavhe_d_amount > dpt_amo_supply { lavhe_d_amount = dpt_amo_supply; }
	        //Add to temp AP cost
	        global.temp_AP = (lavhe_d_amount/lavhe_supply_rate)*ap_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 {
	            //RESUPPLY AP
	            //Select number of rounds to fire
	            //Increase by a rate of 4
	            if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
	                //Check if there is enough ammo available
	                if lavap_d_amount <= (dpt_amo_supply-lavap_supply_rate) { 
	                    //Make sure the unit rpg ammo does not go over max
	                    if ((lavap_d_amount+ap_count)+lavap_supply_rate) <= ap_max {
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
	                            if ap >= ((lavap_d_amount+lavap_supply_rate)/lavap_supply_rate)*ap_cost {
	                                //Add the rounds
	                                lavap_d_amount +=  lavap_supply_rate; 
	                            }
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 4
	            if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
	                if lavap_d_amount >= lavap_supply_rate { 
	                    lavap_d_amount -= lavap_supply_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if lavap_d_amount < 0 { lavap_d_amount = 0; }
	            if lavap_d_amount > dpt_amo_supply { lavap_d_amount = dpt_amo_supply; }
	            //Add to temp AP cost
	            global.temp_AP = (lavap_d_amount/lavap_supply_rate)*ap_cost;
	            //Set the menu position
	            global.fire_option = 1; 
	            //Switch off camera zoom
	            global.can_zoom  = false;
	            global.header_highlight = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = true;
	        }
				else if f3 {
		            //RESUPPLY MG
		            //Select number of rounds to fire
		            //Increase by a rate of 4
		            if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
		                //Check if there is enough ammo available
		                if lavmg_d_amount <= (dpt_amo_supply-lavmg_supply_rate) { 
		                    //Make sure the unit rpg ammo does not go over max
		                    if ((lavmg_d_amount+mg_count)+lavmg_supply_rate) <= mg_max {
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
		                            if ap >= ((lavmg_d_amount+lavmg_supply_rate)/lavmg_supply_rate)*ap_cost {
		                                //Add the rounds
		                                lavmg_d_amount += lavmg_supply_rate; 
		                            }
		                        }
		                    }
		                } 
		            }
		            //Decrease by a rate of 4
		            if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
		                if lavmg_d_amount >= lavmg_supply_rate { 
		                    lavmg_d_amount -= lavmg_supply_rate; 
		                } 
		            }
		            //Clamp the value between zero and the max available rounds
		            if lavmg_d_amount < 0 { lavmg_d_amount = 0; }
		            if lavmg_d_amount > dpt_amo_supply { lavmg_d_amount = dpt_amo_supply; }
		            //Add to temp AP cost
		            global.temp_AP = (lavmg_d_amount/lavmg_supply_rate)*ap_cost;
		            //Set the menu position
		            global.fire_option = 2; 
		            //Switch off camera zoom
		            global.can_zoom  = false;
		            global.header_highlight = false;
		            obj_ACTIONMENU.display_tabinfo = false;
		            obj_ACTIONMENU.display_menuinfo = true;
		        }
					else if f4 {
			            //RESUPPLY TOW
			            //Select number of rounds to fire
			            //Increase
			            if mouse_wheel_up() || keyboard_check_pressed(global.INCREASE) { 
			                //Check if there is enough ammo available
			                if lavat_d_amount <= (dpt_amo_supply-lavat_supply_rate) { 
			                    //Make sure the unit rpg ammo does not go over max
			                    if ((lavat_d_amount+at_count)+lavat_supply_rate) <= at_max {
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
			                            if ap >= ((lavat_d_amount+lavat_supply_rate)/lavat_supply_rate)*ap_cost {
			                                //Add the rounds
			                                lavat_d_amount += lavat_supply_rate; 
			                            }
			                        }
			                    }
			                } 
			            }
			            //Decrease by a rate of 4
			            if mouse_wheel_down() || keyboard_check_pressed(global.DECREASE) { 
			                if lavat_d_amount >= lavat_supply_rate { 
			                    lavat_d_amount -= lavat_supply_rate; 
			                } 
			            }
			            //Clamp the value between zero and the max available rounds
			            if lavat_d_amount < 0 { lavat_d_amount = 0; }
			            if lavat_d_amount > dpt_amo_supply { lavat_d_amount = dpt_amo_supply; }
			            //Add to temp AP cost
			            global.temp_AP = (lavat_d_amount/lavat_supply_rate)*ap_cost;
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
			                        //global.fire_option = 0; 
			                        global.can_zoom  = true;
			                        global.header_highlight = false;
			                        obj_ACTIONMENU.display_tabinfo = false;
			                        obj_ACTIONMENU.display_menuinfo = false;
			                    }
            
	if mouse_check_button_pressed(global.LMOUSE) {
	    if global.my_turn == true {
	        if f0 { 
	            //Switch ammo/fire options tab
				if ds_list_size(tabs) > 1 {
					var t_size = ds_list_size(tabs)-1;
					if tab_count < t_size { tab_count += 1; }
						else { tab_count = 0; }
					global.ammo_tab = ds_list_find_value(tabs, tab_count);
					lavhe_d_amount = 0;
			        lavap_d_amount = 0;
					lavmg_d_amount = 0;
					lavat_d_amount = 0;
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
	                //TRANSFER HE AMMO
	                //Remove ammo cost
	                if lavhe_d_amount != 0 {
	                    var t=0;
	                    while (lavhe_d_amount >= lavhe_supply_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_depot_list, i);
	                            if (u.can_shoot == true) && (u.ammunition_ammo >= lavhe_supply_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    lavhe_d_amount -= lavhe_supply_rate;
	                                    if lavhe_d_amount >= 0 { 
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_ammunition = true;
	                                            u.weapon = "HE";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.resupply_unit = argument0;
	                                            u.resupply_unit.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
	                                        }
	                                        u.shoot_amount    += 1; 
	                                        u.ammunition_ammo -= lavhe_supply_rate;
	                                        global.turn_AP    -= ap_cost;
	                                        u.action_points   -= ap_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            lavhe_d_amount = 0;
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
	                    lavhe_d_amount = 0;
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
	                    //TRANSFER AP AMMO
	                    //Remove ammo cost
	                    if lavap_d_amount != 0 {
	                        var t=0;
	                        while (lavap_d_amount >= lavap_supply_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_depot_list, i);
	                                if (u.can_shoot == true) && (u.ammunition_ammo >= lavap_supply_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        lavap_d_amount -= lavap_supply_rate;
	                                        if lavap_d_amount >= 0 { 
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_ammunition = true;
	                                                u.weapon = "AP";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.resupply_unit = argument0;
	                                                u.resupply_unit.resupplying = true;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
	                                            }
	                                            u.shoot_amount    += 1; 
	                                            u.ammunition_ammo -= lavap_supply_rate;
	                                            global.turn_AP    -= ap_cost;
	                                            u.action_points   -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                lavap_d_amount = 0;
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
	                        lavap_d_amount = 0;
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
		                    //TRANSFER MG AMMO
		                    //Remove ammo cost
		                    if lavmg_d_amount != 0 {
		                        var t=0;
		                        while (lavmg_d_amount >= lavmg_supply_rate) {
		                            t+=1;
		                            var i;
		                            for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
		                                var u = ds_list_find_value(global.selected_depot_list, i);
		                                if (u.can_shoot == true) && (u.ammunition_ammo >= lavmg_supply_rate) {
		                                    if (u.action_points >= ap_cost) {
		                                        lavmg_d_amount -= lavmg_supply_rate;
		                                        if lavmg_d_amount >= 0 { 
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
		                                            u.shoot_amount    += 1; 
		                                            u.ammunition_ammo -= lavmg_supply_rate;
		                                            global.turn_AP    -= ap_cost;
		                                            u.action_points   -= ap_cost;
		                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
		                                        }
		                                    }
		                                }
		                            }
		                            if t >= 200 { 
		                                lavmg_d_amount = 0;
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
		                        lavmg_d_amount = 0;
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
			                    //TRANSFER AT AMMO
			                    //Remove ammo cost
			                    if lavat_d_amount != 0 {
			                        var t=0;
			                        while (lavat_d_amount >= lavat_supply_rate) {
			                            t+=1;
			                            var i;
			                            for (i=0; i<ds_list_size(global.selected_depot_list); i+=1) {
			                                var u = ds_list_find_value(global.selected_depot_list, i);
			                                if (u.can_shoot == true) && (u.ammunition_ammo >= lavat_supply_rate) {
			                                    if (u.action_points >= ap_cost) {
			                                        lavat_d_amount -= lavat_supply_rate;
			                                        if lavat_d_amount >= 0 { 
			                                            if u.shoot_amount == 0 { 
			                                                u.action_confirmed = true;
			                                                global.units_running += 1; 
			                                                u.shoot_ammo = true;
			                                                u.weapon = "TOWMOBILE";
			                                                u.target_x = global.target_x;
			                                                u.target_y = global.target_y;
			                                                u.resupply_unit = argument0;
			                                                u.resupply_unit.resupplying = true;
			                                                u.alert_display = true;
			                                                u.alert_colour = c_red;
			                                                u.alarm[3] = global.tick_rate*3;
			                                            }
			                                            u.shoot_amount    += 1; 
			                                            u.ammunition_ammo -= lavat_supply_rate;
			                                            global.turn_AP    -= ap_cost;
			                                            u.action_points   -= ap_cost;
			                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
			                                        }
			                                    }
			                                }
			                            }
			                            if t >= 200 { 
			                                lavat_d_amount = 0;
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
			                        lavat_d_amount = 0;
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
