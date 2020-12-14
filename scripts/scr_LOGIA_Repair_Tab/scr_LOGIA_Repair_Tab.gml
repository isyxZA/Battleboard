/// @description scr_LOGIA_Repair_Tab(target_unit, repair_ammo, mg_ammo, repair_max, mg_max, repair_rate, mg_rate);
/// @param target_unit
/// @param repair_ammo
/// @param mg_ammo
/// @param repair_max
/// @param mg_max
/// @param repair_rate
/// @param mg_rate
function scr_LOGIA_Repair_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	/*
	lar_fire_menu[0] = "Parts";
	lar_fire_menu[1] = "MG Ammo";
	lar_fire_menu[2] = "Retarget";
	lar_fire_menu[3] = "Cancel";
	*/

	var repair_count         = argument1;
	var repairmg_count       = argument2;
	var repair_max           = argument3;
	var mg_max               = argument4;
	var repairS_supply_rate  = argument5;
	var repairmg_supply_rate = argument6;

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

	var ap_cost = obj_LOGIA_Unit.ap_cost;

	if f0 {
	    global.header_highlight = true;
	    obj_ACTIONMENU.display_menuinfo = false;
	}
	    else if f1 {
	        //RESUPPLY REPAIR
	        //Select number of rounds to fire
	        //Increase by a rate of 10
	        if mouse_wheel_up() { 
	            //Check if there is enough supply available
	            if rprbld_l_amount <= (logia_bld_supply-repairS_supply_rate) { 
	                //Make sure the unit rpg ammo does not go over max
	                if ((rprbld_l_amount+repair_count)+repairS_supply_rate) <= repair_max {
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >=  ap_cost {
	                        //Check total unit AP available
	                        var i;
	                        var ap = 0;
	                        if !ds_list_empty(global.selected_logia_list) {
	                            for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                var unit = ds_list_find_value(global.selected_logia_list, i);
	                                if unit.can_shoot == true { ap += unit.action_points; }
	                            }
	                        }
	                        if ap >= ((rprbld_l_amount+repairS_supply_rate)/repairS_supply_rate)*ap_cost {
	                            //Add the rounds
	                            rprbld_l_amount +=  repairS_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 4
	        if mouse_wheel_down() { 
	            if rprbld_l_amount >= repairS_supply_rate { 
	                rprbld_l_amount -= repairS_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if rprbld_l_amount < 0 { rprbld_l_amount = 0; }
	        if rprbld_l_amount > logia_bld_supply { rprbld_l_amount = logia_bld_supply; }
	        //Add to temp AP cost
	        global.temp_AP = (rprbld_l_amount/repairS_supply_rate)*ap_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        global.header_highlight = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 { 
	            //RESUPPLY MG AMMO
	            //Select number of rounds to fire
	            //Increase by a rate of 20
	            if mouse_wheel_up() { 
	                //Check if there is enough supply available
	                if rprmg_l_amount <= (logia_amo_supply-repairmg_supply_rate) {
	                    //Make sure the unit ammo does not go over max
	                    if ((rprmg_l_amount+repairmg_count)+repairmg_supply_rate) <= mg_max {
	                        //Check if there is enough turn AP for the move
	                        var m_ap = (global.turn_AP-global.temp_AP);
	                        if m_ap >=  ap_cost {
	                            //Check total unit AP available
	                            var i;
	                            var ap = 0;
	                            if !ds_list_empty(global.selected_logia_list) {
	                                for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                    var unit = ds_list_find_value(global.selected_logia_list, i);
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
	            if rprmg_l_amount > logia_amo_supply { rprmg_l_amount = logia_amo_supply; }
	            //Add to temp AP cost
	            global.temp_AP = (rprmg_l_amount/repairmg_supply_rate)*ap_cost;
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
					rprmg_l_amount   = 0;
					rprbld_l_amount  = 0;
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
	                //TRANSFER PARTS SUPPLY
	                //Remove cost
	                if rprbld_l_amount != 0 {
	                    var t=0;
	                    while (rprbld_l_amount >= repairS_supply_rate) {
	                        t+=1;
	                        var i;
	                        for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                            var u = ds_list_find_value(global.selected_logia_list, i);
	                            if (u.can_shoot == true) && (u.building_supply >= repairS_supply_rate) {
	                                if (u.action_points >= ap_cost) {
	                                    rprbld_l_amount -= repairS_supply_rate;
	                                    if rprbld_l_amount >= 0 { 
	                                        if u.shoot_amount == 0 { 
	                                            u.action_confirmed = true;
	                                            global.units_running += 1; 
	                                            u.shoot_building = true;
	                                            u.weapon = "PARTS";
	                                            u.target_x = global.target_x;
	                                            u.target_y = global.target_y;
	                                            u.resupply_unit = argument0;
	                                            u.resupply_unit.resupplying = true;
	                                            u.alert_display = true;
	                                            u.alert_colour = c_red;
	                                            u.alarm[3] = global.tick_rate*3;
	                                        }
	                                        u.shoot_amount    += 1; 
	                                        u.building_supply -= repairS_supply_rate;
	                                        global.turn_AP    -= ap_cost;
	                                        u.action_points   -= ap_cost;
	                                        u.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                    }
	                                }
	                            }
	                        }
	                        if t >= 200 { 
	                            rprbld_l_amount = 0;
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
	                    rprbld_l_amount = 0;
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
	                    //TRANSFER AMMO SUPPLY
	                    //Remove ammo cost
	                    if rprmg_l_amount != 0 {
	                        var t=0;
	                        while (rprmg_l_amount >= repairmg_supply_rate) {
	                            t+=1;
	                            var i;
	                            for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                                var u = ds_list_find_value(global.selected_logia_list, i);
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
	                        for (i=0; i<ds_list_size(global.selected_logia_list); i+=1) {
	                            var unit = ds_list_find_value(global.selected_logia_list, i);
	                            with unit { if action_confirmed == true { selected = false; } }
	                        }
	                        ammo_check = true;
	                        rprmg_l_amount = 0;
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
