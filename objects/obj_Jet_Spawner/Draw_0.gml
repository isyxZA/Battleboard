if can_draw == true {
	if p_one == true { draw_sprite_ext(my_shadow, 0, x-196, y+380, 1.2, 1.2, rot, c_black, 1); }
		else { draw_sprite_ext(my_shadow, 0, x+196, y-380, 1.2, 1.2, rot, c_black, 1); }
	draw_sprite_ext(my_sprite, 0, x, y, 1, 1, rot, c_white, 1);
	if can_afterburn == true { draw_sprite_ext(my_exhaust, img, x, y, 1, 1, rot, c_white, 1); }
}

