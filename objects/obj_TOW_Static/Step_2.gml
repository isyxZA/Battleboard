if action_confirmed == true {
	if net_action == true {
		net_action = false;
		if PLAYER.net_status == "HOST" {
			//Send action data to client
			var cc = ds_list_size(global.clients);
			if cc > 0 { 
				var i;
				for (i=0;i<cc;i++) {
					var csocket = ds_list_find_value(global.clients, i);
					net_write_client(csocket, 
						buffer_u8, NET_SHOOT,
						buffer_u32, id,
						buffer_u16, target_x,
						buffer_u16, target_y,
						buffer_string, weapon,
						buffer_u8, shoot_amount
					);
				}
			}
		}
			else if PLAYER.net_status == "CLIENT" {
				//Send action data to host
				net_write_server(
					buffer_u8, NET_SHOOT,
					buffer_u32, id,
					buffer_u16, target_x,
					buffer_u16, target_y,
					buffer_string, weapon,
					buffer_u8, shoot_amount
				);
			}
	}
    if shoot_tow == true {
        if !shoot_mask.t_line {
            //Add alert to gui
            ds_list_add(global.action_alert_list, "Firing TOW Missile");
            shoot_tow = false;
            timer_target = 3;
            timer_count = timer_target;
            timer_start = true;
            shoot_amount -= 1;
        }
            else {
                shoot_tow = false;
                timer_start = false;
                action_confirmed = false;
                //Ammo amount to be returned
                tow_ammo += shoot_amount*tow_rate;
                //Action points to be returned
                var pp = shoot_amount*ap_cost;
                action_points += pp;
                global.turn_AP += pp;
                global.ap_return = pp;
                global.draw_apreturn = true;
                shoot_amount = 0;
                alert_display = true;
                alert_text = "Cancelled!"; 
                alert_colour = c_red;
                alarm[3] = global.tick_rate*3;
                global.units_running -= 1;
				//SEND NET CANCEL SIGNAL
				if PLAYER.net_status == "HOST" {
					//Send action data to client
					var cc = ds_list_size(global.clients);
					if cc > 0 { 
						var i;
						for (i=0;i<cc;i++) {
							var csocket = ds_list_find_value(global.clients, i);
							net_write_client(csocket, 
								buffer_u8, NET_CANCELSHOOT,
								buffer_u32, id,
							);
						}
					}
				}
					else if PLAYER.net_status == "CLIENT" {
						//Send action data to host
						net_write_server(
							buffer_u8, NET_CANCELSHOOT,
							buffer_u32, id,
						);
					}
            }
    }
        else {}
}

if timer_start == true {
    timer_start = false;
    alarm[2] = global.tick_rate;
}

if mp_depleted == true {
    mp_depleted = false;
    alert_display = true;
    alert_text = "MP Depleted!";
    alert_colour = c_red;
    alarm[3] = global.tick_rate*3;
}

if ap_depleted == true {
    ap_depleted = false;
    alert_display = true;
    alert_text = "AP Depleted!";
    alert_colour = c_red;
    alarm[3] = global.tick_rate*3;
}

if ammo_check == true {
    ammo_check = false;
    if (tow_ammo < tow_rate) { 
        alert_display = true;
        alert_text = "Ammo Depleted!"; 
        alert_colour = c_red;
        alarm[3] = global.tick_rate*3;
    }
        else if (tow_ammo < (tow_rate*2)) {
            alert_display = true;
            alert_text = "Low Ammo!"; 
            alert_colour = c_orange;
            alarm[3] = global.tick_rate*3;
        }
            else { }

}

var d;
if action_confirmed == true || draw_flash == true { 
    d = point_direction(x, y, target_x, target_y)+rot_adj; 
    if turret_rot != d  { turret_rot += (sin(degtorad(turret_rot-d))); }
}
    else { 
        if selected && global.reticule_display == true {
             d = point_direction(x, y, global.target_x, global.target_y)+rot_adj;
             if turret_rot != d  { turret_rot += (sin(degtorad(turret_rot-d))); } 
        }
            else { if turret_rot != 180  { turret_rot += (sin(degtorad(turret_rot-180))); } }
    }
    
//Toggle tile highlights
if build_pos == 2 {
    if selected {
        if global.highlight_supply != true && global.highlight_move != true {
            //Highlight tiles within action range
            if keyboard_check_pressed(global.RANGE) {
                if highlight_shoot == false { 
                    highlight_shoot = true;
                    global.highlight_shoot = true;
                    //Check which game tiles are in range
                    if !ds_list_empty(global.tile_list){
                        var i;
                        for (i=0; i<ds_list_size(global.tile_list); i+=1){
                            var z = ds_list_find_value(global.tile_list, i);
                            var fov = point_direction(x, y, z.tile_x, z.tile_y);
                            var ddd = point_distance(x, y, z.tile_x, z.tile_y);
                            //If within FOV limits
                            if (fov <= fmax) && (fov >= fmin) { 
                                if ddd <= action_range {
                                    z.unit_count += 1;
                                    z.alarm[1] = random_range(6,32);
                                }
                            }
                        }
                    }
                }
            }
        }
        if global.highlight_supply != true && global.highlight_shoot != true {
            //Highlight tiles within movement range
            if keyboard_check_pressed(global.TERRAIN) {
                if highlight_move == false { 
                    highlight_move = true;
                    global.highlight_move = true;
                    //Check which game tiles are in range
                    if !ds_list_empty(global.tile_list){
                        var i;
                        for (i=0; i<ds_list_size(global.tile_list); i+=1){
                            var z = ds_list_find_value(global.tile_list, i);
                            if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius+(global.cell_size*2)){
                                 z.unit_count += 1;
                                 z.alarm[1] = random_range(6,32);
                            }
                        }
                    }
                }
            }
        }
    }
}
//Deactivate highlighting shoot tiles
if keyboard_check_released(global.RANGE) {
    if highlight_shoot == true { 
        highlight_shoot = false;
        global.highlight_shoot = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
        var i;
        for (i=0; i<ds_list_size(global.tile_list); i+=1){
            var z = ds_list_find_value(global.tile_list, i);
            var fov = point_direction(x, y, z.tile_x, z.tile_y);
            var ddd = point_distance(x, y, z.tile_x, z.tile_y);
            //If within FOV limits
            if (fov <= fmax) && (fov >= fmin) { 
                if ddd <= action_range {
                    z.unit_count -= 1;
                    z.alarm[1] = 1;
                }
            }
        }
    }
    }
}
if highlight_shoot == true { 
    if global.nav_menu == true {
        highlight_shoot = false;
        global.highlight_shoot = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
        var i;
        for (i=0; i<ds_list_size(global.tile_list); i+=1){
            var z = ds_list_find_value(global.tile_list, i);
            var fov = point_direction(x, y, z.tile_x, z.tile_y);
            var ddd = point_distance(x, y, z.tile_x, z.tile_y);
            //If within FOV limits
            if (fov <= fmax) && (fov >= fmin)  { 
                if ddd <= action_range {
                    z.unit_count -= 1;
                    z.alarm[1] = 1;
                }
            }
        }
    }
    }
}

//Deactivate highlighting move tiles
if keyboard_check_released(global.TERRAIN) {
    if highlight_move == true { 
        highlight_move = false;
        global.highlight_move = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
            var i;
            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                var z = ds_list_find_value(global.tile_list, i);
                if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius+(global.cell_size*2)){
                    if z.unit_count > 0 { 
                        z.unit_count -= 1; 
                        z.alarm[1] = 1;
                    }
                }
            }
        }
    }
}
if highlight_move == true { 
    if global.nav_menu == true {
        highlight_move = false;
        global.highlight_move = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
            var i;
            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                var z = ds_list_find_value(global.tile_list, i);
                if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius+(global.cell_size*2)){
                    if z.unit_count > 0 { 
                        z.unit_count -= 1; 
                        z.alarm[1] = 1;
                    }
                }
            }
        }
    }
}
