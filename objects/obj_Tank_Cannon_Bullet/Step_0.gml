if start_path == true {
    start_path = false;
    path_clear_points(my_path);
    path_add_point(my_path, x, y, s);
    path_add_point(my_path, x_to, y_to, s);
    path_set_closed(my_path, false);
    path_start(my_path, s, path_action_stop, 0);
    path_tracking = true;
    rot = point_direction(x, y, x_to, y_to);
}

if path_tracking == true {
    if path_position == 1 {
        path_tracking = false;
        path_speed = 0;
        explode = true;
		alarm[2] = 2;
    }
        else { }
}

if explode == true {
    if play_effect == true { 
        play_effect = false;
        audio_emitter_position(emit, x, y, 0);
        audio_play_sound_on(emit, snd_Explosion03, false, 10);
        var l = audio_sound_length(snd_Explosion03);
        alarm[0] = room_speed*l; 
        alarm[1] = 25;
		/*
		with obj_Tank_PFX {
            if explode_tank1 == false {
                explode_tank1 = true;
                tank_x = other.id.x;
                tank_y = other.id.y;
            }
        }
		*/
    }
    if light_size < 1 { light_size = lerp(light_size, 1, 0.05); }
    if can_damage == true { 
        can_damage = false; 
        var h = instance_place(x, y, obj_Houses);
        var t = instance_place(x, y, obj_Trees);
        var u = instance_place(x, y, obj_Unit_Parent);
        var e = instance_place(x, y, obj_Enemy_Parent);
        
        if h!= noone { 
            h.my_health -= damage_1;
            //if h.my_health <= 0 { h.alarm[0] = 60; }
        }
            else if t!= noone { 
                t.my_health -= damage_1;
                //if t.my_health <= 0 { t.alarm[0] = 60; }
            }
                else if u!= noone { 
                    if global.friendly_fire == false { global.friendly_fire = true; }
                    switch u.unit_type {
                        case "INFANTRY":
                            u.taking_damage = true;
                            u.unit_health -= damage_3;
                            u.alert_display = true;
                            u.alert_text = "-100 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "TANK":
                            u.taking_damage = true;
                            u.unit_health -= damage_1;
                            u.alert_display = true;
                            u.alert_text = "-25 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "ENGINEER":
                            u.taking_damage = true;
                            u.unit_health -= damage_2;
                            u.alert_display = true;
                            u.alert_text = "-50 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "BTR":
                            u.taking_damage = true;
                            u.unit_health -= damage_1;
                            u.alert_display = true;
                            u.alert_text = "-25 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "LOGI":
                            u.taking_damage = true;
                            u.unit_health -= damage_2;
                            u.alert_display = true;
                            u.alert_text = "-50 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "DEPOT":
                        case "REPAIR":
                        case "TOW":
                        case "MORTAR":
                            u.taking_damage = true;
                            u.unit_health -= damage_1;
                            u.alert_display = true;
                            u.alert_text = "-25 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                    }
                }
                    else if e!= noone { 
                        switch e.unit_type {
                            case "E_INFANTRY":
                                e.unit_health -= damage_3;
                                e.alert_display = true;
                                e.alert_text = "-100 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                            case "E_TANK":
                                e.unit_health -= damage_1;
                                e.alert_display = true;
                                e.alert_text = "-25 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                            case "E_ENGINEER":
                                e.unit_health -= damage_2;
                                e.alert_display = true;
                                e.alert_text = "-50 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                            case "E_BTR":
                                e.unit_health -= damage_1;
                                e.alert_display = true;
                                e.alert_text = "-25 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                            case "E_LOGI":
                                e.unit_health -= damage_2;
                                e.alert_display = true;
                                e.alert_text = "-50 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                            case "E_DEPOT":
                            case "E_REPAIR":
                            case "E_TOW":
                            case "E_MORTAR":
                                e.unit_health -= damage_1;
                                e.alert_display = true;
                                e.alert_text = "-25 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                        }
                    }
    }
}


