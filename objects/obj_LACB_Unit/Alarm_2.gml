timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {  
            switch weapon {
                case "TOW":
                    shoot_tow = true;
					draw_flash = true;
                    flash_index = spr_Muzzle_Flash_01;
                    alarm[4] = 10;
                    alarm[7] = 10;
                    audio_play_sound_on(emit, snd_TOW01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_TOW_Bullet) {
                        unit_parent = other.id;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "LAC Firing TOW" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                default:
                    break;
            }
        }
            else { 
                timer_start = false;
                alarm[8] = 60;
                action_confirmed = false;
                switch weapon {
                    case "TOW":
						draw_flash  = true;
                        flash_index = spr_Muzzle_Flash_01;
                        alarm[4] = 10;
                        alarm[7] = 10;
                        audio_play_sound_on(emit, snd_TOW01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_TOW_Bullet) {
                            unit_parent = other.id;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "LAC Firing TOW" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    default:
                        break;
                }
            }
    }

