with obj_Houses {
	if can_draw == true {
		shader_set(shd_saturation);
		shader_set_uniform_f(sat_uni, sat_level);
		if p_one == true { draw_sprite_ext(my_house, img, x-6, y+6, 1, 1, image_angle, c_black, my_alpha*0.8); }
			else { draw_sprite_ext(my_house, img, x+6, y-6, 1, 1, image_angle, c_black, my_alpha*0.8); }
		draw_sprite_ext(my_house, img, x, y, 1, 1, image_angle, c_white, my_alpha); 
		shader_reset();
	}
}

