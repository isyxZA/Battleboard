//Visibilty area in fog of war
if light_size < size_target { light_size = lerp(light_size, size_target, 0.05); }
if light_strength != global.light_level { light_strength = lerp(light_strength, global.light_level, 0.005); }

if can_start == true {
    can_start = false;
    alarm[0] = 10;
    path_start(my_path, 30, path_action_stop, 0);
    audio_emitter_velocity(emit, path_speed, -path_speed, 0);
    audio_play_sound_on(emit, snd_C130Engine, true, 0);
}

audio_emitter_position(emit, x, y, 0);

if path_position == 1 { 
    path_delete(my_path); 
    audio_emitter_free(emit);
    instance_destroy();
}
    else {
        var ptx1 = path_get_point_x(my_path, 0)
        var pty1 = path_get_point_y(my_path, 0)
        var ptx2 = path_get_point_x(my_path, 1)
        var pty2 = path_get_point_y(my_path, 1)
        rot = point_direction(ptx1, pty1, ptx2, pty2);
    }





