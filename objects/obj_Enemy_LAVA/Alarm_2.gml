timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {  
            switch weapon {
                case "HE":
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_02;
                    alarm[4] = 10;
                    alarm[7] = 10;
                    shoot_he = true;
                    audio_play_sound_on(emit, snd_BTR_HE01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_E_HE_Bullet) {
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
                    case "HE":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_02;
                        alarm[4] = 10;
                        alarm[7] = 10;
                        audio_play_sound_on(emit, snd_BTR_HE01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_E_HE_Bullet) {
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
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        break;
                    default:
                        break;
                }
            }
    }

