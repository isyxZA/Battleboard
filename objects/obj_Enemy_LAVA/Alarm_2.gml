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
                    alarm[4] = 10;
                    alarm[7] = 10;
                    shoot_he = true;
                    audio_play_sound_on(emit, snd_BTR_HE01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_E_HE_Bullet) {
						impact_side = other.target_impact;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    break;
                case "AP":
                    shoot_ap = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_03;
                    alarm[4] = 10;
                    alarm[7] = 10;
                    audio_play_sound_on(emit, snd_BTR_AP01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_E_AP_Bullet) {
						impact_side = other.target_impact;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    break;
				case "MG":
					shoot_mg = true;
	                draw_flash = true;
	                flash_index = spr_Muzzle_Flash_05;
	                alarm[4] = 10;
	                alarm[7] = 10;
	                shoot_he = true;
	                audio_play_sound_on(emit, snd_TankMG01, false, 10);
	                with instance_create_layer(x, y, "ParticleFX", obj_ET_MG_Bullet) {
						impact_side = other.target_impact;
	                    x_to = other.target_x;
	                    y_to = other.target_y;
	                }
	                break;
	            case "TOW":
	                shoot_tow = true;
	                draw_flash = true;
	                flash_index = spr_Muzzle_Flash_01;
	                alarm[4] = 10;
	                alarm[7] = 10;
	                audio_play_sound_on(emit, snd_TOW01, false, 10);
	                with instance_create_layer(x, y, "ParticleFX", obj_E_TOW_Bullet) {
						impact_side = other.target_impact;
	                    x_to = other.target_x;
	                    y_to = other.target_y;
	                }
	                break;
                default:
                    break;
            }
        }
            else { 
                timer_start = false;
                alarm[8] = 200;
                action_confirmed = false;
                switch weapon {
                    case "HE":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_02;
                        alarm[4] = 10;
                        alarm[7] = 10;
                        audio_play_sound_on(emit, snd_BTR_HE01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_E_HE_Bullet) {
							impact_side = other.target_impact;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        break;
                    case "AP":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_03;
                        alarm[4] = 10;
                        alarm[7] = 10;
                        audio_play_sound_on(emit, snd_BTR_AP01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_E_AP_Bullet) {
							impact_side = other.target_impact;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        break;
					case "MG":
		                draw_flash = true;
		                flash_index = spr_Muzzle_Flash_05;
		                alarm[4] = 10;
		                alarm[7] = 10;
		                shoot_he = true;
		                audio_play_sound_on(emit, snd_TankMG01, false, 10);
		                with instance_create_layer(x, y, "ParticleFX", obj_ET_MG_Bullet) {
							impact_side = other.target_impact;
		                    x_to = other.target_x;
		                    y_to = other.target_y;
		                }
		                break;
		            case "TOW":
		                draw_flash = true;
		                flash_index = spr_Muzzle_Flash_01;
		                alarm[4] = 10;
		                alarm[7] = 10;
		                audio_play_sound_on(emit, snd_TOW01, false, 10);
		                with instance_create_layer(x, y, "ParticleFX", obj_E_TOW_Bullet) {
							impact_side = other.target_impact;
		                    x_to = other.target_x;
		                    y_to = other.target_y;
		                }
		                break;
                    default:
                        break;
                }
            }
    }

