with obj_Ground_Att {
	if can_draw == true {
		if p_one == true { draw_sprite_ext(sprite_index, 0, x-3, y+3, 1, 1, image_angle, c_black, 0.8); }
			else { draw_sprite_ext(sprite_index, 0, x+3, y-3, 1, 1, image_angle, c_black, 0.8); }
		mask = shader_get_sampler_index(shd_shadows, "mask");
		shader_set(shd_shadows);
		texture_set_stage(mask, sprite_get_texture(sprite_index, 0));
		shader_set_uniform_f(bright_x, 0.5);
		shader_set_uniform_f(bright_y, 0.5);
		draw_sprite_ext(sprite_index, 0, x, y, 1, 1, image_angle, c_white, 1); 
		shader_reset();
	}
}

with obj_Shrubbery {
	if can_draw == true {
		if p_one == true { draw_sprite_ext(sprite_index, 0, x-3, y+3, 1, 1, image_angle, c_black, 0.8); }
			else { draw_sprite_ext(sprite_index, 0, x+3, y-3, 1, 1, image_angle, c_black, 0.8); }
		draw_sprite_ext(sprite_index, 0, x, y, 1, 1, image_angle, c_white, 1); 
	}
}

