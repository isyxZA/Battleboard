timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
		scr_TargetImpact();
        if shoot_amount > 0 {  
            switch weapon {
                case "RIFLE":
                    shoot_rifle = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_04;
                    alarm[4] = 10;
                    audio_play_sound_on(emit, snd_Rifles01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_Rifle_Bullet) {
                        unit_parent = other.id;
						impact_side = other.target_impact;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Infantry Firing Rifles" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "RPG":
                    shoot_rpg = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_05;
                    alarm[4] = 10;
                    alarm[7] = 10;
                    audio_play_sound_on(emit, snd_RPG01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_RPG_Bullet) {
                        unit_parent = other.id;
						impact_side = other.target_impact;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Infantry Firing RPG" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "FLARE":
                    shoot_flare = true;
                    alarm[7] = 10;
                    audio_play_sound_on(emit, snd_Flare01, false, 10);
                    with instance_create_layer(x, y, "Flares", obj_Flare_Bullet) {
                        unit_parent = other.id;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Infantry Firing Flare" { 
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
                alarm[8] = 200;
                action_confirmed = false;
                switch weapon {
                    case "RIFLE":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_04;
                        alarm[4] = 10;
                        audio_play_sound_on(emit, snd_Rifles01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_Rifle_Bullet) {
                            unit_parent = other.id;
							impact_side = other.target_impact;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Infantry Firing Rifles" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "RPG":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_05;
                        alarm[4] = 10;
                        alarm[7] = 10;
                        audio_play_sound_on(emit, snd_RPG01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_RPG_Bullet) {
                            unit_parent = other.id;
							impact_side = other.target_impact;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Infantry Firing RPG" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "FLARE":
                        alarm[7] = 10;
                        audio_play_sound_on(emit, snd_Flare01, false, 10);
                        with instance_create_layer(x, y, "Flares", obj_Flare_Bullet) {
                            unit_parent = other.id;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Infantry Firing Flare" { 
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

