if global.grid_display == true {
	var s_pos0   = 1440;
	var gap0     = 96;
	var squares0 = 41;
	var ii = 0;
	for(ii=0; ii<squares0; ii+=1) {
	    //Vertical Lines
	    draw_sprite_ext(spr_GridLine_V_a, 0, s_pos0+(gap0*ii), s_pos0, 3, 8, 0, c_white, 0.4);
	    //Horizontal Lines
	    draw_sprite_ext(spr_GridLine_H_a, 0, s_pos0, s_pos0+(gap0*ii), 8, 3, 0, c_white, 0.4);
	}
}

