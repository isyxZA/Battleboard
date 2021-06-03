if draw_flash == true { 
	var dir = point_direction(x, y, target_x, target_y);
	var xdir = lengthdir_x(40, dir);
	var ydir = lengthdir_y(40, dir);
	gpu_set_blendmode(bm_max);
	draw_sprite_ext(flash_index, 0, x+xdir, y+ydir, 1, 1, dir, c_white, 1);
	gpu_set_blendmode(bm_normal); 
}
