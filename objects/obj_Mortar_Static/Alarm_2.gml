timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {  
            switch weapon {
                case "MORTAR":
                    shoot_mortar = true;
                    instance_create_layer(x, y, "ParticleFX", obj_Smoke_1);
                    audio_play_sound_on(emit, snd_Mortar01, false, 10);
					alarm[7] = 32;
                    with instance_create_layer(x, y, "Flares", obj_Mortar_Bullet) {
                        unit_parent = other.id;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Firing Mortars" { 
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
                //global.units_running -= 1;
                alarm[8] = 500;
                action_confirmed = false;
                switch weapon {
                    case "MORTAR":
                        instance_create_layer(x, y, "ParticleFX", obj_Smoke_1);
                        audio_play_sound_on(emit, snd_Mortar01, false, 10);
                        with instance_create_layer(x, y, "Flares", obj_Mortar_Bullet) {
                            unit_parent = other.id;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Firing Mortars" { 
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

