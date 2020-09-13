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
                    with instance_create_layer(x, y, "Flares", obj_E_Mortar_Bullet) {
                        unit_parent = other.id;
                        x_to = other.target_x;
                        y_to = other.target_y;
                    }
                    break;
            }
        }
            else { 
                timer_start = false;
                alarm[8] = 500;
                action_confirmed = false;
                switch weapon {
                    case "MORTAR":
                        instance_create_layer(x, y, "ParticleFX", obj_Smoke_1);
                        audio_play_sound_on(emit, snd_Mortar01, false, 10);
                        with instance_create_layer(x, y, "Flares", obj_E_Mortar_Bullet) {
                            unit_parent = other.id;
                            x_to = other.target_x;
                            y_to = other.target_y;
                        }
                        break;
                }
            }
    }


