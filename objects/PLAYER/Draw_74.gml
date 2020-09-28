display_set_gui_size(surface_get_width(application_surface), surface_get_height(application_surface));

if room != rm_ALPHA && room != rm_BRAVO {
	draw_set_font(fnt_14);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_right);
	var ver = string(GM_version);
	draw_text_colour(1920, 1070, string_hash_to_newline(" v" + ver + "  "), c_silver, c_gray, c_gray, c_gray, 1);
	draw_set_font(fnt_12);
	draw_set_halign(fa_center);
}
