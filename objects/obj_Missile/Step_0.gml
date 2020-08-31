if timer_start == true {
    timer_start = false;
    alarm[0] = global.tick_rate;
}

if explode == true {
    if play_effect == true { 
        play_effect = false;
        audio_play_sound_on(emit, snd_Explosion05, false, 10);
        var l = audio_sound_length(snd_Explosion05)*0.6;
        alarm[2] = room_speed*l; 
        with obj_Missile_PFX {
            if explode_missile1 == false {
                explode_missile1 = true;
                missile_x = other.x;
                missile_y= other.y;
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
            h.my_health -= damage_1;
            if h.my_health <= 0 { h.alarm[0] = 60; }
        }
            else if t!= noone { 
                t.my_health -= damage_1;
                if t.my_health <= 0 { t.alarm[0] = 60; }
            }
                else if u!= noone { 
                    if global.friendly_fire == false { global.friendly_fire = true; }
                    switch u.unit_type {
                        case "INFANTRY":
                            u.taking_damage = true;
                            u.unit_health -= damage_2;
                            u.alert_display = true;
                            u.alert_text = "-50 HP"; 
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
                            u.unit_health -= damage_2;
                            u.alert_display = true;
                            u.alert_text = "-50 HP"; 
                            u.alert_colour = c_red;
                            u.alarm[3] = global.tick_rate*2;
                            if u.unit_health <= 0 { u.alarm[5] = 60; }
                            break;
                    }
                }
                    else if e!= noone { 
                        switch e.unit_type {
                            case "E_INFANTRY":
                                e.unit_health -= damage_2;
                                e.alert_display = true;
                                e.alert_text = "-50 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 300;
                                break;
                            case "E_TANK":
                                e.unit_health -= damage_1;
                                e.alert_display = true;
                                e.alert_text = "-25 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 300;
                                break;
                            case "E_ENGINEER":
                                e.unit_health -= damage_2;
                                e.alert_display = true;
                                e.alert_text = "-50 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 300;
                                break;
                            case "E_BTR":
                                e.unit_health -= damage_1;
                                e.alert_display = true;
                                e.alert_text = "-25 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 300;
                                break;
                            case "E_LOGI":
                                e.unit_health -= damage_2;
                                e.alert_display = true;
                                e.alert_text = "-50 HP"; 
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
                                e.alert_text = "-50 HP"; 
                                e.alert_colour = c_red;
                                e.alarm[3] = global.tick_rate*2;
                                if e.unit_health <= 0 { e.alarm[5] = 60; }
                                e.is_visible = true;
                                e.alarm[1] = 300;
                                break;
                        }
                    }
    }
}


