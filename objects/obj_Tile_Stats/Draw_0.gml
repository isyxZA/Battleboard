if global.highlight_move == true {
	with obj_Game_Tile {
		if (is_visible == true) && (my_colour == c_green) {
			if p_one == true {
				draw_sprite_ext(spr_Move_Icon  , 0, x+16, y, 0.7, 0.7, 0, c_silver, 1);
				draw_sprite_ext(spr_Height_Icon, 0, x+80, y, 0.7, 0.7, 0, c_silver, 1);
				draw_set_font(fnt_12);
				draw_set_color(c_silver);
				draw_text_transformed(x+16, y+32, string(move_rating)  , 1, 1, 0);
				draw_text_transformed(x+80, y+32, string(height_rating), 1, 1, 0);
				draw_set_color(c_black);
			}
				else {
					draw_sprite_ext(spr_Move_Icon  , 0, x+80, y+96, 0.7, 0.7, 180, c_silver, 1);
					draw_sprite_ext(spr_Height_Icon, 0, x+16, y+96, 0.7, 0.7, 180, c_silver, 1);
					draw_set_font(fnt_12);
					draw_set_color(c_silver);
					draw_text_transformed(x+80, y+64, string(move_rating)  , 1, 1, 180);
					draw_text_transformed(x+16, y+64, string(height_rating), 1, 1, 180);
					draw_set_color(c_black);
				}
		}
	}
}