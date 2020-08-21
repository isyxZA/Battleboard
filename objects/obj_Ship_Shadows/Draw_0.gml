with obj_Unit_Parent {
    if unit_type == "LANDINGCRAFT" {
        var ss;
        if ship_type == "Infantry" { ss = spr_SLC_Shadow; }
            else { ss = spr_VLC_Shadow; }
        var_time_var+=0.05;
        var_pos_x = x;
        var_pos_y = y;
        shader_set(shd_ripple);
        shader_set_uniform_f(uni_time, var_time_var);
        shader_set_uniform_f(uni_pos, var_pos_x, var_pos_y);
        shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
        shader_set_uniform_f(uni_wave_amount, var_wave_amount);
        shader_set_uniform_f(uni_wave_distortion, var_wave_distortion );
        shader_set_uniform_f(uni_wave_speed, var_wave_speed);
        if p_one == true { draw_sprite_ext(ss, 0, x-6, y+8, 1.1, 1, rot, c_black, 0.3); }
			else { draw_sprite_ext(ss, 0, x+6, y-8, 1.1, 1, rot, c_black, 0.3); }
        shader_reset();
    }
}

