timer_count -= 1;

if timer_count > 0 { timer_start = true; }
    else if timer_count <= 0 {
        if shoot_amount > 0 {  
            switch weapon {
                case "CANNON":
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_01;
                    alarm[4] = 10;
                    alarm[7] = 10;
                    shoot_cannon = true;
                    audio_play_sound_on(emit, snd_TankCannon01, false, 10);
                    with instance_create_layer(x, y, "ParticleFX", obj_ET_C_Bullet) {
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    break;
                case "MG":
                    draw_flash = true;
                    flash_index = spr_Muzzle_Flash_05;
                    alarm[4] = 10;
                    audio_play_sound_on(emit, snd_TankMG01, false, 10);
                    shoot_mg = true;
                    with instance_create_layer(x, y, "ParticleFX", obj_ET_MG_Bullet) {
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
                    case "CANNON":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_01;
                        alarm[4] = 10;
                        alarm[7] = 10;
                        audio_play_sound_on(emit, snd_TankCannon01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_ET_C_Bullet) {
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        break;
                    case "MG":
                        draw_flash = true;
                        flash_index = spr_Muzzle_Flash_05;
                        alarm[4] = 10;
                        audio_play_sound_on(emit, snd_TankMG01, false, 10);
                        with instance_create_layer(x, y, "ParticleFX", obj_ET_MG_Bullet) {
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        break;
                    default:
                        break;
                }
            }
    }

