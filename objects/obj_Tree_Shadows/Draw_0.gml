with obj_Trees {
	if can_draw == true {
		//Draw wind effect here
        //var_time_var+=0.05;
        //var_pos_x = x;
        //var_pos_y = y;
        //shader_set(shd_ripple);
        //shader_set_uniform_f(uni_time, var_time_var);
        //shader_set_uniform_f(uni_pos, var_pos_x, var_pos_y);
        //shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
        //shader_set_uniform_f(uni_wave_amount, var_wave_amount);
        //shader_set_uniform_f(uni_wave_distortion, var_wave_distortion );
        //shader_set_uniform_f(uni_wave_speed, var_wave_speed);
		if p_one == true { draw_sprite_ext(forest_shadow, 0, x-6, y+6, xscl+0.1, yscl+0.1, rot+30, c_black, my_alpha*0.8); }
			else { draw_sprite_ext(forest_shadow, 0, x+6, y-6, xscl+0.1, yscl+0.1, rot+30, c_black, my_alpha*0.8); }
		draw_sprite_ext(forest_cover , 0, x  , y  , xscl    , yscl    , rot+30, c_white, my_alpha);
		draw_sprite_ext(forest_cover , 0, x  , y  , xscl-0.2, yscl-0.2, rot   , c_white, my_alpha);
		//shader_reset();
	}
}

