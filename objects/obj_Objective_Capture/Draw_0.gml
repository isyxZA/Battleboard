//draw_text(x, y-64, string(capture_pos));
if p_one == true {
	draw_sprite_pos(pone_flag, 0, x-x_ref,y-y_ref,  flag_x,y-y_ref ,  flag_x,y+y_ref ,  x-x_ref,y+y_ref, 1 );
	draw_sprite_pos(ptwo_flag, 0, flag_x,y-y_ref ,  x+x_ref,y-y_ref,  x+x_ref,y+y_ref,  flag_x,y+y_ref , 1 );
}
	else {
		draw_sprite_pos(pone_flag, 0, x+x_ref,y+y_ref,  flag_x,y+y_ref ,  flag_x,y-y_ref ,  x+x_ref,y-y_ref, 1 );
		draw_sprite_pos(ptwo_flag, 0, flag_x,y+y_ref ,  x-x_ref,y+y_ref,  x-x_ref,y-y_ref,  flag_x,y-y_ref , 1 );
	}

if capture_pos >= 10 { draw_sprite_ext(spr_Objective_Gold, 0, x, y, 1.5, 1.5, rot, c_white, 1);  }
	else if capture_pos <= -10 { draw_sprite_ext(spr_Objective_Red, 0, x, y, 1.5, 1.5, rot, c_white, 1); }
		else { draw_sprite_ext(spr_Objective_Silver, 0, x, y, 1.5, 1.5, rot, c_white, 1); }
		
if status_txt != "" {
	draw_sprite_ext(spr_Alert_Box01, 0, x, y, 1, 1, 0, c_white, 1);
	draw_set_font(fnt_14);
	draw_set_halign(fa_center);
	draw_set_color(c_silver);
	draw_text_transformed(x, y, status_txt, 1, 1, rot);
	draw_set_font(fnt_12);
	draw_set_color(c_black);
}
