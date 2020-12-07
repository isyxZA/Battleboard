timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {  
            switch weapon {
                case "CANNON":
                    audio_play_sound_on(emit, snd_TankCannon01, false, 10);
                    shoot_cannon = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_01;
                    alarm[4] = 10;
                    alarm[7] = 10;
                    with instance_create_layer(x, y, "ParticleFX", obj_Tank_Cannon_Bullet) {
                        unit_parent = other.id;
                        x_to = unit_parent.target_x;
                        y_to = unit_parent.target_y;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Tank Firing Cannon" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "MG":
                    shoot_mg = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_05;
                    alarm[4] = 22;
                    audio_play_sound_on(emit, snd_TankMG01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_Tank_MG_Bullet) {
                        unit_parent = other.id;
                        x_to = unit_parent.target_x;
                        y_to = unit_parent.target_y;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Tank Firing MG" { 
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
                    case "CANNON":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_01;
                        alarm[4] = 10;
                        alarm[7] = 10;
                        audio_play_sound_on(emit, snd_TankCannon01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_Tank_Cannon_Bullet) {
                            unit_parent = other.id;
	                        x_to = unit_parent.target_x;
	                        y_to = unit_parent.target_y;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Tank Firing Cannon" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "MG":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_05;
                        alarm[4] = 22;
                        audio_play_sound_on(emit, snd_TankMG01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_Tank_MG_Bullet) {
                            unit_parent = other.id;
	                        x_to = unit_parent.target_x;
	                        y_to = unit_parent.target_y;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Tank Firing MG" { 
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

