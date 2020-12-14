/// @description scr_LOGIB_LAVB_Tab(target_unit, he_ammo, ap_ammo, mg_ammo, he_max, ap_max, mg_max, he_rate, ap_rate, mg_rate);
/// @param target_unit
/// @param  he_ammo
/// @param  ap_ammo
/// @param  mg_ammo
/// @param  he_max
/// @param  ap_max
/// @param  mg_max
/// @param  he_rate
/// @param  ap_rate
/// @param  mg_rate
function scr_LOGIB_LAVB_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	/*
	labb_fire_menu[0] = "HE(s)";
	labb_fire_menu[1] = "AP(s)";
	labb_fire_menu[2] = "MG(s)";
	labb_fire_menu[3] = "Retarget";
	labb_fire_menu[4] = "Cancel";
	*/

	var he_count = argument1;
	var ap_count = argument2;
	var mg_count = argument3;
	var he_max   = argument4;
	var ap_max   = argument5;
	var mg_max   = argument6;
	var lavhe_supply_rate = argument7;
	var lavap_supply_rate = argument8;
	var lavmg_supply_rate = argument9;

	var f0;
	var f1;
	var f2;
	var f3;
	var f4;
	var f5;

	if p_one == true {
		f0 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+global.menu_height    *global.menu_ratio, obj_MOUSE, false, false);
		f1 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
		f2 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*2)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
		f3 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*3)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
		f4 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*4)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
		f5 = collision_rectangle(global.menu_x, global.menu_y+(global.menu_height*5)*global.menu_ratio, global.menu_x+(global.menu_width*global.menu_ratio), global.menu_y+(global.menu_height*6)*global.menu_ratio, obj_MOUSE, false, false);
	}
		else {
			f0 = collision_rectangle(global.menu_x, global.menu_y+global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y                                         , obj_MOUSE, false, false);
			f1 = collision_rectangle(global.menu_x, global.menu_y                                         , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-global.menu_height*global.menu_ratio    , obj_MOUSE, false, false);
			f2 = collision_rectangle(global.menu_x, global.menu_y-global.menu_height*global.menu_ratio    , global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*2)*global.menu_ratio, obj_MOUSE, false, false);
			f3 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*2)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*3)*global.menu_ratio, obj_MOUSE, false, false);
			f4 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*3)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*4)*global.menu_ratio, obj_MOUSE, false, false);
			f5 = collision_rectangle(global.menu_x, global.menu_y-(global.menu_height*4)*global.menu_ratio, global.menu_x-(global.menu_width*global.menu_ratio), global.menu_y-(global.menu_height*5)*global.menu_ratio, obj_MOUSE, false, false);
		}

	var ap_cost = obj_LOGIB_Unit.ap_cost;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 { 
	        //RESUPPLY HE
	        //Select number of rounds to fire
	        //Increase
	        if mouse_wheel_up() { 
	            //Check if there is enough ammo supply available
	            if lavhe_l_amount <= (logib_amo_supply-lavhe_supply_rate) {
	                //Make sure the unit ammo does not go over max
	                if ((lavhe_l_amount+he_count)+lavhe_supply_rate) <= he_max {
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
	                        if ap >= ((lavhe_l_amount+lavhe_supply_rate)/lavhe_supply_rate)*ap_cost {
	                            //Add the rounds
	                            lavhe_l_amount +=  lavhe_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease
	        if mouse_wheel_down() { 
	            if lavhe_l_amount >= lavhe_supply_rate { 
	                lavhe_l_amount -= lavhe_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if lavhe_l_amount < 0 { lavhe_l_amount = 0; }
	        if lavhe_l_amount > logib_amo_supply { lavhe_l_amount = logib_amo_supply; }
	        //Add to temp AP cost
	        global.temp_AP = (lavhe_l_amount/lavhe_supply_rate)*ap_cost;
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
	            //Increase
	            if mouse_wheel_up() { 
	                //Check if there is enough ammo available
	                if lavap_l_amount <= (logib_amo_supply-lavap_supply_rate) { 
	                    //Make sure the unit rpg ammo does not go over max
	                    if ((lavap_l_amount+ap_count)+lavap_supply_rate) <= ap_max {
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
	                            if ap >= ((lavap_l_amount+lavap_supply_rate)/lavap_supply_rate)*ap_cost {
	                                //Add the rounds
	                                lavap_l_amount +=  lavap_supply_rate; 
	                            }
	                        }
	                    }
	                } 
	            }
	            //Decrease
	            if mouse_wheel_down() { 
	                if lavap_l_amount >= lavap_supply_rate { 
	                    lavap_l_amount -= lavap_supply_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if lavap_l_amount < 0 { lavap_l_amount = 0; }
	            if lavap_l_amount > logib_amo_supply { lavap_l_amount = logib_amo_supply; }
	            //Add to temp AP cost
	            global.temp_AP = (lavap_l_amount/lavap_supply_rate)*ap_cost;
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
		            //Increase
		            if mouse_wheel_up() { 
		                //Check if there is enough ammo available
		                if lavmg_l_amount <= (logib_amo_supply-lavmg_supply_rate) { 
		                    //Make sure the unit rpg ammo does not go over max
		                    if ((lavmg_l_amount+mg_count)+lavmg_supply_rate) <= mg_max {
		                        //Check if there is enough turn AP for the move
		                        var m_ap = (global.turn_AP-global.temp_AP);
		                        if m_ap >= ap_cost {
		                            //Check total unit AP available
		                            var i;
		                            var ap = 0;
		                            if !ds_list_empty(global.selected_logib_list) {
		                                for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
		                                    var unit = ds_list_find_value(global.selected_logib_list, i);
		                                    if unit.can_shoot == true { ap += unit.action_points; }
		                                }
		                            }
		                            if ap >= ((lavmg_l_amount+lavmg_supply_rate)/lavmg_supply_rate)*ap_cost {
		                                //Add the rounds
		                                lavmg_l_amount += lavmg_supply_rate; 
		                            }
		                        }
		                    }
		                } 
		            }
		            //Decrease
		            if mouse_wheel_down() { 
		                if lavmg_l_amount >= lavmg_supply_rate { 
		                    lavmg_l_amount -= lavmg_supply_rate; 
		                } 
		            }
		            //Clamp the value between zero and the max available rounds
		            if lavmg_l_amount < 0 { lavmg_l_amount = 0; }
		            if lavmg_l_amount > logib_amo_supply { lavmg_l_amount = logib_amo_supply; }
		            //Add to temp AP cost
		            global.temp_AP = (lavmg_l_amount/lavmg_supply_rate)*ap_cost;
		            //Set the menu position
		            global.fire_option = 2; 
		            //Switch off camera zoom
		            global.can_zoom  = false;
		            global.header_highlight = false;
		            obj_ACTIONMENU.display_tabinfo = false;
		            obj_ACTIONMENU.display_menuinfo = true;
		        }
		            else if f4 {
		                //RE-TARGET 
		                global.fire_option = 3; 
		                global.can_zoom  = true;
		                global.header_highlight = false;
		                obj_ACTIONMENU.display_tabinfo = false;
		                obj_ACTIONMENU.display_menuinfo = false;
		            }
		                else if f5 {
		                    //CANCEL
		                    global.fire_option = 4; 
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
            
	if mouse_check_button_released(mb_left) {
	    if global.my_turn == true {
	        if f0 { 
	            //Switch ammo/fire options tab
				if ds_list_size(tabs) > 1 {
					var t_size = ds_list_size(tabs)-1;
					if tab_count < t_size { tab_count += 1; }
						else { tab_count = 0; }
					global.ammo_tab = ds_list_find_value(tabs, tab_count);
					lavhe_l_amount   = 0;
			        lavap_l_amount   = 0;
					lavmg_l_amount   = 0;
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
	                if lavhe_l_amount != 0 {
	                    var t=0;
	                    while (lavhe_l_amount >= lavhe_supply_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_logib_list, i);
	                            if (u.can_shoot == true) && (u.ammo_supply >= lavhe_supply_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    lavhe_l_amount -= lavhe_supply_rate;
	                                    if lavhe_l_amount >= 0 { 
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_ammo = true;
	                                            u.weapon = "HE";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.resupply_unit = argument0;
	                                            u.resupply_unit.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
	                                        }
	                                        u.shoot_amount   += 1; 
	                                        u.ammo_supply    -= lavhe_supply_rate;
	                                        global.turn_AP   -= ap_cost;
	                                        u.action_points  -= ap_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            lavhe_l_amount = 0;
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
	                    lavhe_l_amount = 0;
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
	                    //TRANSFER AP AMMO
	                    //Remove ammo cost
	                    if lavap_l_amount != 0 {
	                        var t=0;
	                        while (lavap_l_amount >= lavap_supply_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_logib_list, i);
	                                if (u.can_shoot == true) && (u.ammo_supply >= lavap_supply_rate) {
	                                    if (u.action_points >= ap_cost) {
	                                        lavap_l_amount -= lavap_supply_rate;
	                                        if lavap_l_amount >= 0 { 
	                                            if u.shoot_amount == 0 { 
	                                                u.action_confirmed = true;
	                                                global.units_running += 1; 
	                                                u.shoot_ammo = true;
	                                                u.weapon = "AP";
	                                                u.target_x = global.target_x;
	                                                u.target_y = global.target_y;
	                                                u.resupply_unit = argument0;
	                                                u.resupply_unit.resupplying = true;
	                                                u.alert_display = true;
	                                                u.alert_colour = c_red;
	                                                u.alarm[3] = global.tick_rate*3;
	                                            }
	                                            u.shoot_amount   += 1; 
	                                            u.ammo_supply    -= lavap_supply_rate;
	                                            global.turn_AP   -= ap_cost;
	                                            u.action_points  -= ap_cost;
	                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                        }
	                                    }
	                                }
	                            }
	                            if t >= 200 { 
	                                lavap_l_amount = 0;
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
	                        lavap_l_amount = 0;
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
		                    //TRANSFER MG AMMO
		                    //Remove ammo cost
		                    if lavmg_l_amount != 0 {
		                        var t=0;
		                        while (lavmg_l_amount >= lavmg_supply_rate) {
		                            t+=1;
		                            var i;
		                            for (i=0; i<ds_list_size(global.selected_logib_list); i+=1) {
		                                var u = ds_list_find_value(global.selected_logib_list, i);
		                                if (u.can_shoot == true) && (u.ammo_supply >= lavmg_supply_rate) {
		                                    if (u.action_points >= ap_cost) {
		                                        lavmg_l_amount -= lavmg_supply_rate;
		                                        if lavmg_l_amount >= 0 { 
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
		                                            u.ammo_supply    -= lavmg_supply_rate;
		                                            global.turn_AP   -= ap_cost;
		                                            u.action_points  -= ap_cost;
		                                            u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
		                                        }
		                                    }
		                                }
		                            }
		                            if t >= 200 { 
		                                lavmg_l_amount = 0;
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
		                        lavmg_l_amount = 0;
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
		                        else if f5 { 
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
