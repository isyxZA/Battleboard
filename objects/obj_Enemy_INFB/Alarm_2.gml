timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
		scr_TargetImpact_E();
        if shoot_amount > 0 {  
            switch weapon {
                case "RIFLE":
                    shoot_rifle = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_04;
                    alarm[4] = 10;
                    audio_play_sound_on(emit, snd_Rifles01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_E_Rifle_Bullet) {
						impact_side = other.target_impact;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    break;
                case "RPG":
                    shoot_rpg = true;
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_05;
                    alarm[4] = 10;
                    alarm[7] = 10;
                    audio_play_sound_on(emit, snd_RPG01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_E_GL_Bullet) {
						impact_side = other.target_impact;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    break;
                case "FLARE":
                    shoot_flare = true;
                    alarm[7] = 10;
                    audio_play_sound_on(emit, snd_Flare01, false, 10);
                    with instance_create_layer(x, y, "Flares", obj_Flare_Bullet) {
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
                //global.enemyunits_running -= 1;
                alarm[8] = 200;
                action_confirmed = false;
                switch weapon {
                    case "RIFLE":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_04;
                        alarm[4] = 10;
                        audio_play_sound_on(emit, snd_Rifles01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_E_Rifle_Bullet) {
							impact_side = other.target_impact;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        break;
                    case "RPG":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_05;
                        alarm[4] = 10;
                        alarm[7] = 10;
                        audio_play_sound_on(emit, snd_RPG01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_E_GL_Bullet) {
							impact_side = other.target_impact;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        break;
                    case "FLARE":
                        alarm[7] = 10;
                        audio_play_sound_on(emit, snd_Flare01, false, 10);
                        with instance_create_layer(x, y, "Flares", obj_Flare_Bullet) {
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        break;
                    default:
                        break;
                }
            }
    }

