rot = point_direction(x, y, x_to, y_to);

if start_path == true {
    start_path = false;
    path_clear_points(my_path);
    path_add_point(my_path, x, y, s);
    path_add_point(my_path, x_to, y_to, s);
    path_set_closed(my_path, false);
    path_start(my_path, s, path_action_stop, 0);
    path_tracking = true;
}

if path_tracking == true {
    path_speed -= 1;
    if path_position == 1 {
        path_tracking = false;
        path_speed = 0;
        timer_start = true;
        explode = true;
        view_range = 2;
        alarm[2] = 60;
    }
        else { }
}

if timer_start == true {
    timer_start = false;
    alarm[0] = flare_timer;
}

if explode == true {
    if fade_out == false {
        if light_size < 24 { light_size = lerp(light_size, 24, 0.001); }
        if light_strength < 1 { light_strength = lerp(light_strength, 1, 0.01); }
    }
        else if fade_out == true {
            if light_size > 0 { light_size = lerp(light_size, 0, 0.01); }
            if light_strength > 0 { light_strength = lerp(light_strength, 0, 0.001); }
        }
}


