with obj_Houses {
	if can_draw == true {
		if p_one == true { draw_sprite_ext(my_house, img, x-6, y+6, 1, 1, image_angle, c_black, my_alpha*0.8); }
			else { draw_sprite_ext(my_house, img, x+6, y-6, 1, 1, image_angle, c_black, my_alpha*0.8); }
		mask = shader_get_sampler_index(shd_shadows, "mask");
		shader_set(shd_shadows);
		texture_set_stage(mask, sprite_get_texture(my_house, img));
		shader_set_uniform_f(bright_x, 0.5);
		shader_set_uniform_f(bright_y, 0.5);
		draw_sprite_ext(my_house, img, x, y, 1, 1, image_angle, c_white, my_alpha); 
		shader_reset();
	}
}

