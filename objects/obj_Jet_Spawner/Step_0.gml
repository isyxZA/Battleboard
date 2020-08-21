if can_start == true {
    can_start = false;
    //alarm[0] = 10; //Visibility checking
    path_start(my_path, 60, path_action_stop, 0);
    audio_emitter_velocity(emit, path_speed, -path_speed, 0);
    audio_play_sound_on(emit, snd_JetEngine02, false, 1);
	
}

audio_emitter_position(emit, x, y, 0);

if path_position == 1 { 
    path_delete(my_path); 
    audio_emitter_free(emit);
    instance_destroy();
}
    else {
		if path_get_number(my_path) > 2 {
			if path_position < 0.15 {
		        var ptx1 = path_get_point_x(my_path, 0);
		        var pty1 = path_get_point_y(my_path, 0);
		        var ptx2 = path_get_point_x(my_path, 1);
		        var pty2 = path_get_point_y(my_path, 1);
			}
				else {
					var ptx1 = path_get_point_x(my_path, 1);
			        var pty1 = path_get_point_y(my_path, 1);
			        var ptx2 = path_get_point_x(my_path, 2);
			        var pty2 = path_get_point_y(my_path, 2);
				}
		}
			else {
				var ptx1 = path_get_point_x(my_path, 0);
		        var pty1 = path_get_point_y(my_path, 0);
		        var ptx2 = path_get_point_x(my_path, 1);
		        var pty2 = path_get_point_y(my_path, 1);
			}
		var d = point_direction(ptx1, pty1, ptx2, pty2)-rot_adj;
	    if rot != d { rot += (sin(degtorad(rot-d))*2); }
    }





