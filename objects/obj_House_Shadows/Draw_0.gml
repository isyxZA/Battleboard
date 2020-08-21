
with obj_Trees {
	if discovered == true {
	    if can_draw == true {
			shader_set(shd_saturation);
			shader_set_uniform_f(sat_uni, sat_level);
	        if my_tile != -1 {
	            if p_one == true { draw_sprite_ext(forest_shadow, 0, x-6, y+6, xscl+0.1, yscl+0.1, rot+30, c_black, my_alpha*0.8); }
					else { draw_sprite_ext(forest_shadow, 0, x+6, y-6, xscl+0.1, yscl+0.1, rot+30, c_black, my_alpha*0.8); }
	            if (my_tile.is_visible == true) && (global.selected_LC == true) && (global.supply_ship == noone) {
	                draw_sprite_ext(forest_cover , 0, x  , y  , xscl    , yscl    , rot+30, my_tile.my_colour, my_alpha);
	                draw_sprite_ext(forest_cover , 0, x  , y  , xscl-0.2, yscl-0.2, rot   , my_tile.my_colour, my_alpha);
	            }
	                else {
	                    draw_sprite_ext(forest_cover , 0, x  , y  , xscl    , yscl    , rot+30, c_white, my_alpha);
	                    draw_sprite_ext(forest_cover , 0, x  , y  , xscl-0.2, yscl-0.2, rot   , c_white, my_alpha);
	                }
	        }
			shader_reset();
	    }
	}
}

with obj_Houses {
	if (discovered == true) && (can_draw == true) {
	    if my_tile != -1 {
			shader_set(shd_saturation);
			shader_set_uniform_f(sat_uni, sat_level);
			if p_one == true { draw_sprite_ext(my_house, img, x-6, y+6, 1, 1, 0, c_black, my_alpha*0.8); }
				else { draw_sprite_ext(my_house, img, x+6, y-6, 1, 1, 0, c_black, my_alpha*0.8); }
			if (my_tile.is_visible == true) && (global.selected_LC == true) && (global.supply_ship == noone) {
	            draw_sprite_ext(my_house, img, x  , y  , 1, 1, 0, my_tile.my_colour, my_alpha); 
	        }
	            else {
	                draw_sprite_ext(my_house, img, x, y, 1, 1, 0, c_white, my_alpha); 
	            }
			shader_reset();
	    }
	}
}

