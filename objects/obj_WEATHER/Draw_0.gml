if rise_alpha > 0 {
	draw_sprite_stretched_ext(
		bg_Hue, 0, 
		camera_get_view_x(view), camera_get_view_y(view),
		camera_get_view_width(view), camera_get_view_height(view),
		rise_colour, rise_alpha
	);
}

if set_alpha > 0 {
	draw_sprite_stretched_ext(
		bg_Hue, 0, 
		camera_get_view_x(view), camera_get_view_y(view),
		camera_get_view_width(view), camera_get_view_height(view),
		set_colour, set_alpha
	);
}

if n_alpha > 0 {
	draw_sprite_stretched_ext(
		bg_Hue, 0, 
		camera_get_view_x(view), camera_get_view_y(view),
		camera_get_view_width(view), camera_get_view_height(view),
		n_colour, n_alpha
	);
}