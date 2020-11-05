if global.grid_display == true {
	var s_pos0   = 1440;
	var gap0     = 96;
	var squares0 = 41;
	var ii = 0;
	for(ii=0; ii<squares0; ii+=1) {
	    //Vertical Lines
	    draw_sprite_ext(spr_GridLine_V_a, 0, s_pos0+(gap0*ii), s_pos0, 2, 8, 0, c_black, 0.5);
	    //Horizontal Lines
	    draw_sprite_ext(spr_GridLine_H_a, 0, s_pos0, s_pos0+(gap0*ii), 8, 2, 0, c_black, 0.5);
	}
}

if global.highlight_move == true {
	with obj_Game_Tile {
		if is_visible == true {
			if p_one == true {
				draw_sprite_ext(spr_Move_Icon  , 0, x+16, y, 0.7, 0.7, 0, c_silver, 1);
				draw_sprite_ext(spr_Height_Icon, 0, x+80, y, 0.7, 0.7, 0, c_silver, 1);
				draw_set_color(c_silver);
				draw_text_transformed(x+16, y+32, string(move_rating)  , 1, 1, 0);
				draw_text_transformed(x+80, y+32, string(height_rating), 1, 1, 0);
				draw_set_color(c_black);
			}
				else {
					draw_sprite_ext(spr_Move_Icon  , 0, x+80, y+96, 0.7, 0.7, 180, c_silver, 1);
					draw_sprite_ext(spr_Height_Icon, 0, x+16, y+96, 0.7, 0.7, 180, c_silver, 1);
					draw_set_color(c_silver);
					draw_text_transformed(x+80, y+64, string(move_rating)  , 1, 1, 180);
					draw_text_transformed(x+16, y+64, string(height_rating), 1, 1, 180);
					draw_set_color(c_black);
				}
		}
	}
}