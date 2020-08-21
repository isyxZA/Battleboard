//If a landing ship is selected
if global.selected_LC == true {
    with obj_Game_Tile {
        if is_visible == true {
            if global.supply_ship == noone {
                if my_colour == c_red || occupied == true { }
                    else { draw_sprite(spr_Tile_Outline_Green, 0, x, y); }
            }
                else { if my_colour == c_green { draw_sprite(spr_Tile_Outline_Orange, 0, x, y); } }
        }
    }
}
    else if global.highlight_shoot == true { 
        with obj_Game_Tile {
            if is_visible == true { if my_colour == c_green { draw_sprite(spr_Tile_Outline_Red, 0, x, y); } }
        }
    }
        else if global.highlight_supply == true { 
            with obj_Game_Tile {
                if is_visible == true { if my_colour == c_green { draw_sprite(spr_Tile_Outline_Orange, 0, x, y); } }
            }
        }
            else if global.highlight_move == true { 
                with obj_Game_Tile {
                    if is_visible == true { if occupied == false && my_colour == c_green { draw_sprite(spr_Tile_Outline_Green, 0, x, y); } }
                }
            }
