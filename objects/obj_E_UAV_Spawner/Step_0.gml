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





