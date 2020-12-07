if timer_start == true {
    timer_start = false;
    alarm[0] = global.tick_rate;
}

if explode == true {
    if play_effect == true { 
        play_effect = false;
        audio_play_sound_on(emit, snd_Explosion06, false, 10);
        var l = audio_sound_length(snd_Explosion06);
        alarm[2] = room_speed*l; 
        with obj_Artillery_PFX {
            if explode_arty1 == false {
                explode_arty1 = true;
                arty_x = other.x;
                arty_y= other.y;
            }
        }
    }
    if light_size < 1.5 { light_size = lerp(light_size, 1.5, 0.05); }
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
                        case "INF_A":
						case "INF_B":
                            u.taking_damage = true;
                            u.unit_health -= damage_2;
                            u.alert_display = true;
                            u.alert_text = "-75 HP"; 
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
                            u.unit_health -= damage_3;
                            u.alert_display = true;
                            u.alert_text = "-100 HP"; 
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
                            u.alert_text = "-75 HP"; 
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
                            u.alert_text = "-75 HP"; 
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
                                e.unit_health -= damage_2;
                                e.alert_display = true;
                                e.alert_text = "-75 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 300;
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
                                e.alarm[1] = 300;
                                break;
                            case "E_LACA":
							case "E_LACB":
                                e.unit_health -= damage_3;
                                e.alert_display = true;
                                e.alert_text = "-100 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 300;
                                break;
                            case "E_LAVA":
							case "E_LAVB":
                                e.unit_health -= damage_1;
                                e.alert_display = true;
                                e.alert_text = "-75 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 300;
                                break;
                            case "E_LOGIA":
							case "E_LOGIB":
                                e.unit_health -= damage_2;
                                e.alert_display = true;
                                e.alert_text = "-75 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 300;
                                break;
                            case "E_DEPOT":
                            case "E_REPAIR":
                            case "E_TOW":
                            case "E_MORTAR":
                                e.unit_health -= damage_2;
                                e.alert_display = true;
                                e.alert_text = "-75 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 300;
                                break;
                        }
                    }
						else {
							with instance_create_layer(x, y, "GroundFX", obj_Crater) { sprite_index = other.crater_index; }
						}
    }
}


