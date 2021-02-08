timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {  
            switch weapon {
                case "MG":
					scr_TargetImpact();
                    shoot_mg = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_05;
                    alarm[4] = 10;
                    audio_play_sound_on(emit, snd_BTR_HE01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_Rifle_Bullet) {
						impact_side = other.target_impact;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Repair OP Firing" { 
                            ds_list_delete(global.action_alert_list, i); 
                            break;
                        }
                    }
                    break;
                case "REPAIR":
                    shoot_repair = true;
                    if manned_unit != noone {
                        with manned_unit { 
                            unit_health += other.repair_rate; 
                            alert_display = true;
                            alert_text = "+10 Repair"; 
                            alert_colour = c_green;
                            alarm[3] = global.tick_rate*2;
                        }
                        alert_display = true;
                        alert_text = "-10 Supply"; 
                        alert_colour = c_orange;
                        alarm[3] = global.tick_rate*2;
                    }
                    //Switch off gui alert
                    var i;
                    for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                        var z = ds_list_find_value(global.action_alert_list, i);
                        if z == "Repairing" { 
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
                manned_unit.resupplying = false;
                switch weapon {
                    case "MG":
						scr_TargetImpact();
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_05;
                        alarm[4] = 10;
                        audio_play_sound_on(emit, snd_BTR_HE01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_Rifle_Bullet) {
							impact_side = other.target_impact;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Repair OP Firing" { 
                                ds_list_delete(global.action_alert_list, i); 
                                break;
                            }
                        }
                        break;
                    case "REPAIR":
                        if manned_unit != noone {
                            with manned_unit { 
                                unit_health += other.repair_rate; 
                                alert_display = true;
                                alert_text = "+10 Repair"; 
                                alert_colour = c_green;
                                alarm[3] = global.tick_rate*2;
                            }
                            alert_display = true;
                            alert_text = "-10 Supply"; 
                            alert_colour = c_orange;
                            alarm[3] = global.tick_rate*2;
                        }
                        //Switch off gui alert
                        var i;
                        for (i=0; i<ds_list_size(global.action_alert_list); i+=1){
                            var z = ds_list_find_value(global.action_alert_list, i);
                            if z == "Repairing" { 
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

