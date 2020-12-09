/// @description scr_Ship_Depot_Tab(target_unit, parts_ammo, ammunition_ammo, parts_max, ammunition_max, parts_rate, ammunition_rate);
/// @param target_unit
/// @param parts_ammo
/// @param ammunition_ammo
/// @param parts_max
/// @param ammunition_max
/// @param parts_rate
/// @param ammunition_rate
function scr_Ship_Depot_Tab(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	/*  Arguments
	0   resupply unit ID        
	1   ammo count     
	2   parts count                
	3   max ammo the unit can carry
	4   max parts ammo the unit can carry
	*/

	/*
	lad_fire_menu[0] = "Parts";
	lad_fire_menu[1] = "Ammunition";
	lad_fire_menu[2] = "Retarget";
	lad_fire_menu[3] = "Cancel";
	*/

	var target_unit            = argument0;
	var depotparts_count       = argument1;
	var depotammo_count        = argument2;
	var parts_max              = argument3;
	var ammunition_max         = argument4;
	var depotamo_supply_rate  = argument5;
	var depotbld_supply_rate = argument6;

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

	    if f1 {
	        //RESUPPLY PARTS
	        //Select number of rounds to fire
	        //Increase by a rate of 10
	        if mouse_wheel_up() { 
	            //Check if there is enough supply available
	            if global.dptbld_s_amount <= (global.lc_parts_ammo-depotbld_supply_rate) { 
	                //Make sure the unit rpg ammo does not go over max
	                if ((global.dptbld_s_amount+depotparts_count)+depotbld_supply_rate) <= parts_max {
	                    //Check if there is enough turn AP for the move
	                    var m_ap = (global.turn_AP-global.temp_AP);
	                    if m_ap >= ap_cost {
	                        //Check total unit AP available
	                        var ap = target_unit.action_points;
	                        if ap >= ((global.dptbld_s_amount+depotbld_supply_rate)/depotbld_supply_rate)*ap_cost {
	                            //Add the rounds
	                            global.dptbld_s_amount += depotbld_supply_rate; 
	                        }
	                    }
	                }
	            } 
	        }
	        //Decrease by a rate of 10
	        if mouse_wheel_down() { 
	            if global.dptbld_s_amount >= depotbld_supply_rate { 
	                global.dptbld_s_amount -= depotbld_supply_rate; 
	            } 
	        }
	        //Clamp the value between zero and the max available rounds
	        if global.dptbld_s_amount < 0 { global.dptbld_s_amount = 0; }
	        if global.dptbld_s_amount > global.lc_parts_ammo { global.dptbld_s_amount = global.lc_parts_ammo; }
	        //Add to temp AP cost
	        global.temp_AP = (global.dptbld_s_amount/depotbld_supply_rate)*ap_cost;
	        //Set the menu position
	        global.fire_option = 0; 
	        //Switch off camera zoom
	        global.can_zoom  = false;
	        obj_ACTIONMENU.display_tabinfo = false;
	        obj_ACTIONMENU.display_menuinfo = true;
	    }
	        else if f2 { 
	            //RESUPPLY AMMO
	            //Select number of rounds to fire
	            //Increase by a rate of 10
	            if mouse_wheel_up() { 
	                //Check if there is enough supply available
	                if global.dptamo_s_amount <= (global.lc_ammunition_ammo-depotamo_supply_rate) {
	                    //Make sure the unit ammo does not go over max
	                    if ((global.dptamo_s_amount+depotammo_count)+depotamo_supply_rate) <= ammunition_max {
	                        //Check if there is enough turn AP for the move
	                        var m_ap = (global.turn_AP-global.temp_AP);
	                        if m_ap >=  ap_cost {
	                            //Check total unit AP available
	                            var ap = target_unit.action_points;
	                            if ap >= ((global.dptamo_s_amount+depotamo_supply_rate)/depotamo_supply_rate)*ap_cost {
	                                //Add the rounds
	                                global.dptamo_s_amount +=  depotamo_supply_rate; 
	                            }
	                        }
	                    }
	                } 
	            }
	            //Decrease by a rate of 10
	            if mouse_wheel_down() { 
	                if global.dptamo_s_amount >= depotamo_supply_rate { 
	                    global.dptamo_s_amount -= depotamo_supply_rate; 
	                } 
	            }
	            //Clamp the value between zero and the max available rounds
	            if global.dptamo_s_amount < 0 { global.dptamo_s_amount = 0; }
	            if global.dptamo_s_amount > global.lc_ammunition_ammo { global.dptamo_s_amount = global.lc_ammunition_ammo; }
	            //Add to temp AP cost
	            global.temp_AP = (global.dptamo_s_amount/depotamo_supply_rate)*ap_cost;
	            //Set the menu position
	            global.fire_option = 1; 
	            //Switch off camera zoom
	            global.can_zoom  = false;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = true;
	        }
	        else if f3 {
	            //RE-TARGET 
	            global.fire_option = 2; 
	            global.can_zoom  = true;
	            obj_ACTIONMENU.display_tabinfo = false;
	            obj_ACTIONMENU.display_menuinfo = false;
	        }
	            else if f4 {
	                //CANCEL
	                global.fire_option = 3; 
	                global.can_zoom  = true;  
	                obj_ACTIONMENU.display_tabinfo = false;
	                obj_ACTIONMENU.display_menuinfo = false;
	            }
	                else { 
	                    //global.fire_option = 0; 
	                    global.can_zoom  = true;
	                    obj_ACTIONMENU.display_tabinfo = false;
	                    obj_ACTIONMENU.display_menuinfo = false;
	                }
            
	if mouse_check_button_released(mb_left) {
	    if global.my_turn == true {
	        if f0 { 
	        }
	            else if f1 {
	                //TRANSFER PARTS SUPPLY
	                //Remove cost
	                if global.dptbld_s_amount != 0 {
	                    if global.supply_ship != noone {
	                        var u = global.supply_ship;
	                        if (u.can_shoot == true) && (u.parts_ammo >= global.dptbld_s_amount) {
	                            if (target_unit.action_points >= global.temp_AP) {
	                                u.action_confirmed = true;
	                                global.units_running += 1; 
	                                u.shoot_parts = true;
	                                u.weapon = "PARTS";
	                                u.target_x = global.target_x;
	                                u.target_y = global.target_y;
	                                u.resupply_unit = argument0;
	                                u.resupply_unit.resupplying = true;
	                                u.shoot_amount    += global.dptbld_s_amount/depotbld_supply_rate; 
	                                u.parts_ammo      -= global.dptbld_s_amount;
	                                global.turn_AP    -= ap_cost*u.shoot_amount;
	                                target_unit.alert_display = true;
	                                target_unit.alert_colour = c_red;
									target_unit.alarm[3] = global.tick_rate*3;
	                                target_unit.action_points   -= ap_cost*u.shoot_amount;
	                                target_unit.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                            }
	                        }
	                    }
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
	                if global.temp_AP > 0 { 
	                    global.draw_apcost = true; 
	                    obj_CONTROL.ap_cost = global.temp_AP;
	                }
	                global.fire_display = false;
	                if global.supply_ship != noone { global.supply_ship.selected = false; }
	                global.can_zoom  = true;
	                queue_reset = true;
	            }
	                else if f2 {
	                    //TRANSFER AMMO SUPPLY
	                    //Remove ammo cost
	                    if global.dptamo_s_amount != 0 {
	                        if global.supply_ship != noone {
	                            var u = global.supply_ship;
	                            if (u.can_shoot == true) && (u.ammunition_ammo >= global.dptamo_s_amount) {
	                                if (target_unit.action_points >= global.temp_AP) {
	                                    u.action_confirmed = true;
	                                    global.units_running += 1; 
	                                    u.shoot_ammunition = true;
	                                    u.weapon = "AMMO";
	                                    u.target_x = global.target_x;
	                                    u.target_y = global.target_y;
	                                    u.resupply_unit = argument0;
	                                    u.resupply_unit.resupplying = true;
	                                    u.shoot_amount    += global.dptamo_s_amount/depotamo_supply_rate; 
	                                    u.ammunition_ammo -= global.dptamo_s_amount;
	                                    global.turn_AP    -= ap_cost*u.shoot_amount;
	                                    target_unit.alert_display = true;
	                                    target_unit.alert_colour = c_red;
										target_unit.alarm[3] = global.tick_rate*3;
	                                    target_unit.action_points   -= ap_cost*u.shoot_amount;
	                                    target_unit.alert_text = "-"+string(u.shoot_amount*ap_cost)+ " AP";
	                                }
	                            }
	                        }
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
	                    if global.temp_AP > 0 { 
	                        global.draw_apcost = true; 
	                        obj_CONTROL.ap_cost = global.temp_AP;
	                    }
	                    global.fire_display = false;
	                    if global.supply_ship != noone { global.supply_ship.selected = false; }
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
	                        if global.supply_ship != noone { global.supply_ship.selected = false; }
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
