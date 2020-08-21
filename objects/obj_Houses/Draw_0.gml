if (discovered == true) && (can_draw == true) {
    if my_tile != -1 {
        if (my_tile.is_visible == true) && (global.selected_LC == true) && (global.supply_ship == noone) {
            draw_sprite_ext(my_house, img, x  , y  , 0.75, 0.75, 0, my_tile.my_colour, my_alpha); 
        }
            else {
                draw_sprite_ext(my_house, img, x, y, 0.75, 0.75, 0, c_white, my_alpha); 
            }
    }
}

