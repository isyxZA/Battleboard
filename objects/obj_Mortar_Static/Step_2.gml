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
    if shoot_mortar == true {
        //Add alert to gui
        ds_list_add(global.action_alert_list, "Firing Mortars");
        shoot_mortar = false;
        timer_target = 3;
        timer_count = timer_target;
        timer_start = true;
        shoot_amount -= 1;
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
    if (mortar_ammo < mortar_rate) { 
        alert_display = true;
        alert_text = "Ammo Depleted!"; 
        alert_colour = c_red;
        alarm[3] = global.tick_rate*3;
    }
        else if (mortar_ammo < (mortar_rate*2)) {
            alert_display = true;
            alert_text = "Low Ammo!"; 
            alert_colour = c_orange;
            alarm[3] = global.tick_rate*3;
        }
            else { }

}

//Toggle tile highlights
if build_pos == 2 {
    if selected {
        if global.highlight_supply != true && global.highlight_move != true {
            //Highlight tiles within action range
            if keyboard_check_pressed(ord("F")) {
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
                            //Highlight if within FOV limits
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
            if keyboard_check_pressed(ord("T")) {
                if highlight_move == false { 
                    highlight_move = true;
                    global.highlight_move = true;
                    //Check which game tiles are in range
                    if !ds_list_empty(global.tile_list){
                        var i;
                        for (i=0; i<ds_list_size(global.tile_list); i+=1){
                            var z = ds_list_find_value(global.tile_list, i);
                            if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius){
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
if keyboard_check_released(ord("F")) {
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
            if (fov <= 135) && (fov >= 45) { 
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
            if (fov <= 135) && (fov >= 45) { 
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
if keyboard_check_released(ord("T")) {
    if highlight_move == true { 
        highlight_move = false;
        global.highlight_move = false;
        //Remove game tile visibility
        if !ds_list_empty(global.tile_list){
            var i;
            for (i=0; i<ds_list_size(global.tile_list); i+=1){
                var z = ds_list_find_value(global.tile_list, i);
                if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius){
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
                if point_in_circle(z.tile_x,z.tile_y, x, y, view_radius){
                    if z.unit_count > 0 { 
                        z.unit_count -= 1; 
                        z.alarm[1] = 1;
                    }
                }
            }
        }
    }
}

/* */
/*  */
