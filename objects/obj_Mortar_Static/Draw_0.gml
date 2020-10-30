if build_pos == 2 {
    if global.my_turn == true || global.waiting == true {
        if selected {
            if global.vis_mask == true { draw_sprite_ext(spr_Octagon_Green, 0, x, y, 1, 1, 0, c_white, 1); }
		    draw_sprite_ext(spr_Mortar_00, 0, x, y, 1, 1, rot, c_white, 1);
			draw_sprite_ext(spr_Mortar_01, 0, x, y, 1, 1, rot, c_white, 1);
	        draw_sprite_ext(spr_Mortar_02, 0, x, y, 1, 1, rot, c_white, 1); 
            if global.nav_select == true {
                //Draw icon to show potential waypoint location 
                draw_sprite_ext(my_inf, 0, x_end, y_end, 0.75, 0.75, 0, c_white, 0.75);
            }
                //If selected and not selecting a path
                else if global.nav_select == false {
                    //Nav menu is up (CONFIRM, CANCEL)
                    if global.nav_menu == true {
                        //Draw icon at current waypoint location 
                        if p_one == true { draw_sprite_ext(my_inf, 0, x_end-4, y_end+2, 0.8, 0.8, 0, c_black, 0.5); }
							else { draw_sprite_ext(my_inf, 0, x_end+4, y_end-2, 0.8, 0.8, 0, c_black, 0.5); } 
                        draw_sprite_ext(my_inf, 0, x_end, y_end, 0.75, 0.75, 0, c_white, 1);
                    }
                }
        }
            else {
                if action_confirmed == true { if global.vis_mask == true { draw_sprite_ext(spr_Octagon_Orange, 0, x, y, 1, 1, 0, c_white, 1); } }
                    else { if global.vis_mask == true { draw_sprite_ext(spr_Octagon_Gray, 0, x, y, 1, 1, 0, c_white, 1); } }
		        draw_sprite_ext(spr_Mortar_00, 0, x, y, 1, 1, rot, c_white, 1);
				draw_sprite_ext(spr_Mortar_01, 0, x, y, 1, 1, rot, c_white, 1);
	            draw_sprite_ext(spr_Mortar_02, 0, x, y, 1, 1, rot, c_white, 1); 
            }
    }
        else {
            if global.vis_mask == true { 
                if taking_damage == false { draw_sprite_ext(spr_Octagon_Gray, 0, x, y, 1, 1, 0, c_white, 1); } 
                    else { draw_sprite_ext(spr_Octagon_Red, 0, x, y, 1, 1, 0, c_white, 1); }
            }
		    draw_sprite_ext(spr_Mortar_00, 0, x, y, 1, 1, rot, c_white, 1);
			draw_sprite_ext(spr_Mortar_01, 0, x, y, 1, 1, rot, c_white, 1);
	        draw_sprite_ext(spr_Mortar_02, 0, x, y, 1, 1, rot, c_white, 1); 
        }
}
 else if build_pos == 1 {
    if global.vis_mask == true { draw_sprite_ext(spr_Octagon_Gray, 0, x, y, 1, 1, 0, c_white, 1); }
    draw_sprite_ext(spr_Mortar_00, 0, x, y, 1, 1, rot, c_white, 1);
    draw_sprite_ext(spr_Mortar_01, 0, x, y, 1, 1, rot, c_white, 1);
    draw_sprite_ext(spr_Mortar_02, 0, x, y, 1, 1, rot, c_white, 0.4);
 }
    else if build_pos == 0 {
        if global.vis_mask == true { draw_sprite_ext(spr_Octagon_Gray, 0, x, y, 1, 1, 0, c_white, 1); }
        draw_sprite_ext(spr_Mortar_00, 0, x, y, 1, 1, rot, c_white, 1);
        draw_sprite_ext(spr_Mortar_01, 0, x, y, 1, 1, rot, c_white, 0.4);
    }

draw_set_halign(fa_center);
scr_DrawSquad(my_squad);

