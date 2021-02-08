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
        image_index = 0;
        explode = true;
    }
        else { }
}

if explode == true {
    if play_effect == true { 
        play_effect = false;
        audio_emitter_position(emit, x, y, 0);
        audio_play_sound_on(emit, snd_Explosion01, false, 10);
        var l = audio_sound_length(snd_Explosion01);
        alarm[0] = room_speed*l;
		with obj_Infantry_PFX {
            if explode_rpg1 == false {
                explode_rpg1 = true;
                rpg_x = other.x;
                rpg_y = other.y;
            }
        }
    }
    if light_size < 1 { light_size = lerp(light_size, 1, 0.05); }
    if can_damage == true { 
        can_damage = false; 
        var h = instance_place(x, y, obj_Houses);
        var t = instance_place(x, y, obj_Trees);
        var u = instance_place(x, y, obj_Unit_Parent);
        var e = instance_place(x, y, obj_Enemy_Parent);
        
        if h!= noone { 
            h.my_health -= damage_alt;
            //if h.my_health <= 0 { h.alarm[0] = 60; }
        }
            else if t!= noone { 
                t.my_health -= damage_alt;
                //if t.my_health <= 0 { t.alarm[0] = 60; }
            }
                else if u!= noone { 
                    if global.friendly_fire == false { global.friendly_fire = true; }
                    switch u.unit_type {
                        case "INF_A":
						case "INF_B":
                            u.taking_damage = true;
                            u.unit_health -= damage_alt;
                            u.alert_display = true;
                            u.alert_text = "-10 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "MBT_A":
						case "MBT_B":
							switch impact_side {
								case "FRONT"://Rear
									armor_reduction = 0.1;
									break;
								case "REAR"://Front
									armor_reduction = 0.01;
									break;
								case "LSIDE":
								case "RSIDE":
									armor_reduction = 0.05;
									break;
								case "":
									armor_reduction = 0;
									break;
							}
							var dmg = damage_max*armor_reduction;
							var atxt = "-" + string(dmg) + " HP";
                            u.taking_damage = true;
                            u.unit_health -= dmg;
                            u.alert_display = true;
                            u.alert_text = atxt; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "LAC_A":
						case "LAC_B":
							switch impact_side {
								case "FRONT"://Rear
									armor_reduction = 0.2;
									break;
								case "REAR"://Front
									armor_reduction = 0.1;
									break;
								case "LSIDE":
								case "RSIDE":
									armor_reduction = 0.1;
									break;
								case "":
									armor_reduction = 0;
									break;
							}
							var dmg = damage_max*armor_reduction;
							var atxt = "-" + string(dmg) + " HP";
                            u.taking_damage = true;
                            u.unit_health -= dmg;
                            u.alert_display = true;
                            u.alert_text = atxt; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "LAV_A":
							switch impact_side {
								case "FRONT"://Rear
									armor_reduction = 0.1;
									break;
								case "REAR"://Front
									armor_reduction = 0.05;
									break;
								case "LSIDE":
								case "RSIDE":
									armor_reduction = 0.01;
									break;
								case "":
									armor_reduction = 0;
									break;
							}
							var dmg = damage_max*armor_reduction;
							var atxt = "-" + string(dmg) + " HP";
                            u.taking_damage = true;
                            u.unit_health -= dmg;
                            u.alert_display = true;
                            u.alert_text = atxt; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
						case "LAV_B":
							switch impact_side {
								case "FRONT"://Rear
									armor_reduction = 0.1;
									break;
								case "REAR"://Front
									armor_reduction = 0.01;
									break;
								case "LSIDE":
								case "RSIDE":
									armor_reduction = 0.05;
									break;
								case "":
									armor_reduction = 0;
									break;
							}
							var dmg = damage_max*armor_reduction;
							var atxt = "-" + string(dmg) + " HP";
                            u.taking_damage = true;
                            u.unit_health -= dmg;
                            u.alert_display = true;
                            u.alert_text = atxt; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "LOGI_A":
						case "LOGI_B":
							switch impact_side {
								case "FRONT"://Rear
									armor_reduction = 0.2;
									break;
								case "REAR"://Front
									armor_reduction = 0.1;
									break;
								case "LSIDE":
								case "RSIDE":
									armor_reduction = 0.2;
									break;
								case "":
									armor_reduction = 0;
									break;
							}
							var dmg = damage_max*armor_reduction;
							var atxt = "-" + string(dmg) + " HP";
                            u.taking_damage = true;
                            u.unit_health -= dmg;
                            u.alert_display = true;
                            u.alert_text = atxt; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                        case "DEPOT":
                        case "REPAIR":
                        case "TOW":
                        case "MORTAR":
                            u.taking_damage = true;
                            u.unit_health -= damage_alt;
                            u.alert_display = true;
                            u.alert_text = "-10 HP"; 
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
                                e.unit_health -= damage_alt;
                                e.alert_display = true;
                                e.alert_text = "-10 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                            case "E_MBTA":
							case "E_MBTB":
								switch impact_side {
									case "FRONT":
										armor_reduction = 0.01;
										break;
									case "REAR":
										armor_reduction = 0.1;
										break;
									case "LSIDE":
									case "RSIDE":
										armor_reduction = 0.05;
										break;
									case "":
										armor_reduction = 0;
										break;
								}
								var dmg = damage_max*armor_reduction;
								var atxt = "-" + string(dmg) + " HP";
                                e.unit_health -= dmg;
                                e.alert_display = true;
                                e.alert_text = atxt; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                            case "E_LACA":
							case "E_LACB":
								switch impact_side {
									case "FRONT":
										armor_reduction = 0.1;
										break;
									case "REAR":
										armor_reduction = 0.2;
										break;
									case "LSIDE":
									case "RSIDE":
										armor_reduction = 0.1;
										break;
									case "":
										armor_reduction = 0;
										break;
								}
								var dmg = damage_max*armor_reduction;
								var atxt = "-" + string(dmg) + " HP";
                                e.unit_health -= dmg;
                                e.alert_display = true;
                                e.alert_text = atxt; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                            case "E_LAVA":
								switch impact_side {
									case "FRONT":
										armor_reduction = 0.05;
										break;
									case "REAR":
										armor_reduction = 0.1;
										break;
									case "LSIDE":
									case "RSIDE":
										armor_reduction = 0.01;
										break;
									case "":
										armor_reduction = 0;
										break;
								}
								var dmg = damage_max*armor_reduction;
								var atxt = "-" + string(dmg) + " HP";
                                e.unit_health -= dmg;
                                e.alert_display = true;
                                e.alert_text = atxt; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
							case "E_LAVB":
								switch impact_side {
									case "FRONT":
										armor_reduction = 0.01;
										break;
									case "REAR":
										armor_reduction = 0.1;
										break;
									case "LSIDE":
									case "RSIDE":
										armor_reduction = 0.05;
										break;
									case "":
										armor_reduction = 0;
										break;
								}
								var dmg = damage_max*armor_reduction;
								var atxt = "-" + string(dmg) + " HP";
                                e.unit_health -= dmg;
                                e.alert_display = true;
                                e.alert_text = atxt; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                            case "E_LOGIA":
							case "E_LOGIB":
								switch impact_side {
									case "FRONT":
										armor_reduction = 0.1;
										break;
									case "REAR":
										armor_reduction = 0.2;
										break;
									case "LSIDE":
									case "RSIDE":
										armor_reduction = 0.2;
										break;
									case "":
										armor_reduction = 0;
										break;
								}
								var dmg = damage_max*armor_reduction;
								var atxt = "-" + string(dmg) + " HP";
                                e.unit_health -= dmg;
                                e.alert_display = true;
                                e.alert_text = atxt; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                            case "E_DEPOT":
                            case "E_REPAIR":
                            case "E_TOW":
                            case "E_MORTAR":
                                e.unit_health -= damage_alt;
                                e.alert_display = true;
                                e.alert_text = "-10 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                break;
                        }
                    }
    }
}


