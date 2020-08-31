//Visibilty area in fog of war
if light_size < size_target { light_size = lerp(light_size, size_target, 0.05); }
if light_strength != global.light_level+0.25 { light_strength = lerp(light_strength, global.light_level+0.25, 0.005); }

audio_emitter_position(emit, x, y, 0);

if path_position == 1 { 
    global.active_uav = false;
    obj_CONTROL.active_uav = false;
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





