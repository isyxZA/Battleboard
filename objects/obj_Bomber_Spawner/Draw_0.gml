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
if p_one == true { draw_sprite_ext(my_shadow, 0, x-196, y+380, 1.1, 1.1, rot, c_black, 1); }
	else { draw_sprite_ext(my_shadow, 0, x+196, y-380, 1.1, 1.1, rot, c_black, 1); }
shader_reset();

draw_sprite_ext(my_sprite, 0, x, y, 1, 1, rot, c_white, 1);

