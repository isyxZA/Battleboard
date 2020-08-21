if discovered == true {
    if can_draw == true {
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
    }
}

