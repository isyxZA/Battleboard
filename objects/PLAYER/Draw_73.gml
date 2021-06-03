if room == rm_MainMenu {
	draw_sprite_ext(spr_Alert_Box03, 0, -40, 220, 2.5, 2.2, 45, c_black, 0.3);
	draw_sprite_ext(spr_Alert_Box03, 0, -40, 220, 2.5, 2, 45, c_white, 1);
	draw_set_font(fnt_16);
	draw_set_color(c_silver);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	var ver = string(GM_version);
	draw_text_transformed_shadow(75, 85, string_hash_to_newline("DEMO"), 1, 1, 45, 2, 245, c_black, 1);
	draw_text_transformed_shadow(100, 100, string_hash_to_newline("Version " + ver + "  "), 1, 1, 45, 2, 245, c_black, 1);
	draw_set_color(c_black);
	draw_set_font(fnt_12);
	draw_sprite_ext(spr_Alert_Box03, 0, 1866, 968, 1, 2.4, 270, c_black, 0.7);
	draw_sprite_ext(spr_Alert_Box03, 0, 1866, 970, 1, 2.3, 270, c_white, 1);
	draw_sprite_ext(spr_Yellow_House, 0,1899, 1066, 0.5, 0.5, 0, c_white, 1);
}

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





