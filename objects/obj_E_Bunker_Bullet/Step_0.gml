if start_path == true {
    start_path = false;
    path_clear_points(my_path);
    path_add_point(my_path, x, y, s);
    path_add_point(my_path, x_to, y_to, s);
    path_set_closed(my_path, false);
    path_start(my_path, s, path_action_stop, 0);
    path_tracking = true;
    rot = point_direction(x, y, x_to, y_to);
}

if path_tracking == true {
    if path_position == 1 {
        path_tracking = false;
        path_speed = 0;
        explode = true;
        alarm[1] = 30;
    }
        else { }
}

if explode == true {
    if play_effect == true { 
        play_effect = false;
        audio_emitter_position(emit, x, y, 0);
        //audio_play_sound_on(emit, snd_Explosion08, false, 10);
        var l = audio_sound_length(snd_Explosion08);
        alarm[0] = room_speed*l;
		alarm[2] = 2;
    }
    if light_size < 1 { light_size = lerp(light_size, 1, 0.05); }
    if can_damage == true { 
        can_damage = false; 
        var u = instance_place(x, y, obj_Unit_Parent);
		if u != noone {
			ex_sprite = spr_HitMarker01;
		}
			else {
				ex_sprite = spr_HitMarker01;
			}
    }
}

