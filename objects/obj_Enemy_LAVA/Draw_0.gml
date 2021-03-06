if is_visible == true {
	draw_set_font(fnt_12);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var xx;
	var yy;
    if nav_confirmed == true {
        var pa = max(0.5, path_position);
		xx = x_final;
		if p_one == true  { yy = y_final+38; }
			else if p_one == false { yy = y_final-38; }
        draw_sprite_ext(my_sprite, 0, x_final, y_final, scl, scl, rot, my_colour, pa);
        draw_sprite_ext(my_turret, 0, x_final, y_final, scl, scl, turret_rot, my_colour, pa);
    }
        else {
			xx = x;
			if p_one == true  { yy = y+38; }
				else if p_one == false { yy = y-38; }
			mask = shader_get_sampler_index(shd_shadows, "mask");
			shader_set(shd_shadows);
			texture_set_stage(mask, sprite_get_texture(my_sprite, 0));
			shader_set_uniform_f(bright_x, 0.5);
			shader_set_uniform_f(bright_y, 0.5);
	        draw_sprite_ext(my_sprite, 0, x, y, scl, scl, rot, my_colour, my_alpha);
			texture_set_stage(mask, sprite_get_texture(my_turret, 0));
	        draw_sprite_ext(my_turret, 0, x, y, scl, scl, turret_rot, my_colour, my_alpha);
			shader_reset();
        }
	
	//draw_set_colour(c_red);
	//draw_text_transformed_shadow(xx, yy, string(my_squad), 1, 1, txt_rot, 2, 245, c_black, 1);

	if action_confirmed == true {
	    draw_set_colour(c_white); 
	    draw_text_transformed_shadow(x, y, string(timer_count), 1, 1, txt_rot, 2, 245, c_black, 1);
	}
	draw_set_colour(c_black);
}
