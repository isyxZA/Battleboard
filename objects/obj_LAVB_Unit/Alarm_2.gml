timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
		scr_TargetImpact();
        if shoot_amount > 0 {  
            switch weapon {
                case "HE":
                    shoot_he = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_02;
                    alarm[4] = 22;
                    alarm[7] = 22;
                    audio_play_sound_on(emit, snd_BTR_HE01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_HE_Bullet) {
                        unit_parent = other.id;
						impact_side = other.target_impact;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "APC Firing HE" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "AP":
                    shoot_ap = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_03;
                    alarm[4] = 14;
                    alarm[7] = 14;
                    audio_play_sound_on(emit, snd_BTR_AP01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_AP_Bullet) {
                        unit_parent = other.id;
						impact_side = other.target_impact;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "APC Firing AP" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
				case "MG":
                    shoot_mg = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_05;
                    alarm[4] = 14;
                    alarm[7] = 14;
                    audio_play_sound_on(emit, snd_TankMG01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_Tank_MG_Bullet) {
                        unit_parent = other.id;
						impact_side = other.target_impact;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "APC Firing MG" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
				case "SQD":
                    shoot_sqd = true;
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "APC Deploying Squad" { 
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
                    case "HE":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_02;
                        alarm[4] = 22;
                        alarm[7] = 22;
                        audio_play_sound_on(emit, snd_BTR_HE01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_HE_Bullet) {
                            unit_parent = other.id;
							impact_side = other.target_impact;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "APC Firing HE" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "AP":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_03;
                        alarm[4] = 16;
                        alarm[7] = 16;
                        audio_play_sound_on(emit, snd_BTR_AP01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_AP_Bullet) {
                            unit_parent = other.id;
							impact_side = other.target_impact;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "APC Firing AP" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
					case "MG":
	                    draw_flash = true;
	                    flash_index = spr_Muzzle_Flash_05;
	                    alarm[4] = 14;
	                    alarm[7] = 14;
	                    audio_play_sound_on(emit, snd_TankMG01, false, 10);
	                    with instance_create_layer(x, y, "ParticleFX", obj_Tank_MG_Bullet) {
	                        unit_parent = other.id;
							impact_side = other.target_impact;
	                        x_to = other.target_x;
	                        y_to = other.target_y;
	                    }
	                    //Switch off gui alert
	                    var i;
	                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
	                        var z = ds_list_find_value(global.action_alert_list, i);
	                        if z == "APC Firing MG" { 
	                            ds_list_delete(global.action_alert_list, i); 
	                            break;
	                        }
	                    }
	                    break;
					case "SQD":
	                    //Switch off gui alert
	                    var i;
	                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
	                        var z = ds_list_find_value(global.action_alert_list, i);
	                        if z == "APC Deploying Squad" { 
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

