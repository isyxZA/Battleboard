with obj_House_Att {
	if can_draw == true {
		if p_one == true { draw_sprite_ext(sprite_index, 0, x-4, y+4, 1, 1, image_angle, c_black, 0.8); }
			else { draw_sprite_ext(sprite_index, 0, x+4, y-4, 1, 1, image_angle, c_black, 0.8); }
		shader_set(shd_shadows);
		mask = shader_get_sampler_index(shd_shadows, "mask");
		texture_set_stage(mask, sprite_get_texture(sprite_index, 0));
		shader_set_uniform_f(bright_x, 1);
		shader_set_uniform_f(bright_y, 1);
		draw_sprite_ext(sprite_index, 0, x, y, 1, 1, image_angle, c_white, 1); 
		shader_reset();
	}
}

