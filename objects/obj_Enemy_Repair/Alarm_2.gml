timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {  
            switch weapon {
                case "MG":
					scr_TargetImpact_E();
                    shoot_mg = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_05;
                    alarm[4] = 10;
                    audio_play_sound_on(emit, snd_Rifles01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_E_Rifle_Bullet) {
                        impact_side = other.target_impact;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    break;
                case "REPAIR":
                    shoot_repair = true;
                    if manned_unit != noone {
                        with manned_unit { 
                            unit_health += other.repair_rate; 
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
                manned_unit.resupplying = false;
                switch weapon {
                    case "MG":
						scr_TargetImpact_E();
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_05;
                        alarm[4] = 10;
                        audio_play_sound_on(emit, snd_Rifles01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_E_Rifle_Bullet) {
                            impact_side = other.target_impact;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        break;
                    case "REPAIR":
                        if manned_unit != noone {
                            with manned_unit { 
                                unit_health += other.repair_rate; 
                            }
                        }
                        break;
                }
            }
    }

