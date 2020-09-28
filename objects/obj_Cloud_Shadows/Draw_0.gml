with obj_Cloud {
	if p_one == true { draw_sprite_ext(sprite_index, 0, x-adjx, y+adjy, scale, scale, rot+cloud_dir, c_black, shadow_a); }
		else { draw_sprite_ext(sprite_index, 0, x+adjx, y-adjy, scale, scale, rot+cloud_dir, c_black, shadow_a); }
}
