if global.game_turn == 0 {
	var s = instance_nearest(x, y, obj_Jet_Spawner);
    var t = point_distance(x, y, s.x, s.y);
    if t < 256 { start_countdown = true; }
}

if start_countdown == true {
    if timer_start == true {
        timer_start = false;
        alarm[0] = global.tick_rate*0.5;
    }
}

if explode == true {
    if play_effect == true { 
        play_effect = false;
        audio_play_sound_on(emit, snd_Explosion02, false, 10);
        var l = audio_sound_length(snd_Explosion02)*0.5;
        alarm[2] = room_speed*l; 
        with obj_Bomber_PFX {
            if explode_bomb1 == false {
                explode_bomb1 = true;
                bomb_x = other.x;
                bomb_y = other.y;
            }
        }
    }
    if light_size < 0.7 { light_size = lerp(light_size, 0.7, 0.05); }
    if can_damage == true { 
        can_damage = false; 
        var h = instance_place(x, y, obj_Houses);
        var t = instance_place(x, y, obj_Trees);
        var u = instance_place(x, y, obj_Unit_Parent);
        var e = instance_place(x, y, obj_Enemy_Parent);
        
        if h!= noone { 
			if h.my_house == spr_Bunker_01 {
				with instance_create_layer(x, y, "GroundFX", obj_Crater) { sprite_index = spr_BunkerCrater01; }
				h.alarm[0] = 2;
			}
				else {
					h.my_health -= damage_1;
				}
        }
            else if t!= noone { 
                t.my_health -= damage_1;
                //if t.my_health <= 0 { t.alarm[0] = 60; }
            }
                else if u!= noone { 
                    if global.friendly_fire == false { global.friendly_fire = true; }
                    switch u.unit_type {
                        case "INF_A":
						case "INF_B":
                            u.taking_damage = true;
                            u.unit_health -= damage_3;
                            u.alert_display = true;
                            u.alert_text = "-100 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "MBT_A":
						case "MBT_B":
                            u.taking_damage = true;
                            u.unit_health -= damage_1;
                            u.alert_display = true;
                            u.alert_text = "-50 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "LAC_A":
						case "LAC_B":
                            u.taking_damage = true;
                            u.unit_health -= damage_2;
                            u.alert_display = true;
                            u.alert_text = "-80 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "LAV_A":
						case "LAV_B":
                            u.taking_damage = true;
                            u.unit_health -= damage_1;
                            u.alert_display = true;
                            u.alert_text = "-50 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "LOGI_A":
						case "LOGI_B":
                            u.taking_damage = true;
                            u.unit_health -= damage_2;
                            u.alert_display = true;
                            u.alert_text = "-80 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "DEPOT":
                        case "REPAIR":
                        case "TOW":
                        case "MORTAR":
                            u.taking_damage = true;
                            u.unit_health -= damage_2;
                            u.alert_display = true;
                            u.alert_text = "-80 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                    }
                }
                    else if e!= noone { 
                        switch e.unit_type {
                            case "E_INFA":
							case "E_INFB":
                                e.unit_health -= damage_3;
                                e.alert_display = true;
                                e.alert_text = "-100 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 280;
                                break;
                            case "E_MBTA":
							case "E_MBTB":
                                e.unit_health -= damage_1;
                                e.alert_display = true;
                                e.alert_text = "-50 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 280;
                                break;
                            case "E_LACA":
							case "E_LACB":
                                e.unit_health -= damage_2;
                                e.alert_display = true;
                                e.alert_text = "-80 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 280;
                                break;
                            case "E_LAVA":
							case "E_LAVB":
                                e.unit_health -= damage_1;
                                e.alert_display = true;
                                e.alert_text = "-50 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 280;
                                break;
                            case "E_LOGIA":
							case "E_LOGIB":
                                e.unit_health -= damage_2;
                                e.alert_display = true;
                                e.alert_text = "-80 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 280;
                                break;
                            case "E_DEPOT":
                            case "E_REPAIR":
                            case "E_TOW":
                            case "E_MORTAR":
                                e.unit_health -= damage_2;
                                e.alert_display = true;
                                e.alert_text = "-80 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 280;
                                break;
                        }
                    }
						else {
							with instance_create_layer(x, y, "GroundFX", obj_Crater) { 
								sprite_index = other.crater_index; 
								alarm[1] = random_range(600, 900);
							}
						}
    }
}


