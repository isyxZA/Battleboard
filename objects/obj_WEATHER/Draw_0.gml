if p_one == true {
	draw_sprite_stretched_ext(
		bg_Hue, 0, 
		camera_get_view_x(view), camera_get_view_y(view),
		camera_get_view_width(view), camera_get_view_height(view),
		n_colour, n_alpha
	);
}
	else {
		draw_sprite_stretched_ext(
			bg_Hue, 0, 
			camera_get_view_x(view)-camera_get_view_width(view), camera_get_view_y(view)+camera_get_view_height(view),
			camera_get_view_width(view), camera_get_view_height(view),
			n_colour, n_alpha
		);
	}