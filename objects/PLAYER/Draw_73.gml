//Room change transition
if t_a > 0 {
	draw_set_alpha(t_a);
	if room != rm_ALPHA && room != rm_BRAVO { 
		draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false); 
	}
		else {
			var cam = obj_CAMERA.my_camera;
			draw_rectangle_colour(camera_get_view_x(cam), camera_get_view_y(cam), 
								  camera_get_view_x(cam)+camera_get_view_width(cam), camera_get_view_y(cam)+camera_get_view_height(cam), 
								  c_black, c_black, c_black, c_black, false);
		}
	draw_set_alpha(1);
}

/*
if room == rm_ALPHA || room == rm_BRAVO {
	if global.debug == true {
		with obj_Game_Tile { if occupied == true { draw_text(tile_x, tile_y, "Occupied"); } }
		//draw_set_alpha(0.1);
		//mp_grid_draw(global.inf_move_grid);
		//draw_set_alpha(1);
	}
}
*/





