draw_set_alpha(a);
draw_rectangle_colour(
	camera_get_view_x(cam), camera_get_view_y(cam), 
	camera_get_view_x(cam)+camera_get_view_width(cam), 
	camera_get_view_y(cam)+camera_get_view_height(cam), 
	c_black, c_black, c_black, c_black, false
);
draw_set_alpha(1);
if at_width == true {
	var camw = camera_get_view_width(cam);
	draw_sprite_ext(spr_OptionsBG_1, 0, x+96  , y+72, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_OptionsBG_2, 0, x+584 , y+72, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_OptionsBG_1, 0, x+1432, y+72, 1, 1, 0, c_white, 1);
	draw_roundrect_colour_ext(x+96  , y+72, x+487 , y+1031, 4, 4, c1, c_dkgray, true);
	draw_roundrect_colour_ext(x+584 , y+72, x+1335, y+983 , 4, 4, c1, c_dkgray, true);
	draw_roundrect_colour_ext(x+1432, y+72, x+1823, y+1031, 4, 4, c1, c_dkgray, true);
	draw_sprite_ext(spr_Menu_Button, 0, x+(camw*0.5), y+72, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_Menu_Button, 0, x+292       , y+72, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_Menu_Button, 0, x+1628      , y+72, 1, 1, 0, c_white, 1);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(fnt_16);
	draw_text_colour_shadow(x+(camw*0.5), y+72, "Settings", c1, c1, c1, c1, 1, 330, c_black, 0.7); 
	draw_text_colour_shadow(x+292       , y+72, "Controls", c1, c1, c1, c1, 1, 330, c_black, 0.7); 
	draw_text_colour_shadow(x+1628      , y+72, "Hotkeys" , c1, c1, c1, c1, 1, 330, c_black, 0.7); 
	draw_set_font(fnt_12);
}

		
