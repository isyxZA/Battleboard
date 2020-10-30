with obj_Trees {
	if can_draw == true {
		if p_one == true { draw_sprite_ext(forest_shadow, 0, x-6, y+6, xscl+0.1, yscl+0.1, rot+30, c_black, my_alpha*0.8); }
			else { draw_sprite_ext(forest_shadow, 0, x+6, y-6, xscl+0.1, yscl+0.1, rot+30, c_black, my_alpha*0.8); }
		draw_sprite_ext(forest_cover , 0, x  , y  , xscl    , yscl    , rot+30, c_white, my_alpha);
		draw_sprite_ext(forest_cover , 0, x  , y  , xscl-0.2, yscl-0.2, rot   , c_white, my_alpha);
	}
}

