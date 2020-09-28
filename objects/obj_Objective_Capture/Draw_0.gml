//draw_text(x, y-64, string(capture_pos));
if p_one == true {
	draw_sprite_pos(pone_flag, 0, x-x_ref,y-y_ref,  flag_x,y-y_ref ,  flag_x,y+y_ref ,  x-x_ref,y+y_ref, 1 );
	draw_sprite_pos(ptwo_flag, 0, flag_x,y-y_ref ,  x+x_ref,y-y_ref,  x+x_ref,y+y_ref,  flag_x,y+y_ref , 1 );
}
	else {
		draw_sprite_pos(pone_flag, 0, x+x_ref,y+y_ref,  flag_x,y+y_ref ,  flag_x,y-y_ref ,  x+x_ref,y-y_ref, 1 );
		draw_sprite_pos(ptwo_flag, 0, flag_x,y+y_ref ,  x-x_ref,y+y_ref,  x-x_ref,y-y_ref,  flag_x,y-y_ref , 1 );
	}
