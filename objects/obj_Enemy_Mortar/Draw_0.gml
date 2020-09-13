if build_pos == 2 {
	draw_sprite_ext(spr_Mortar_00, 0, x, y, 1, 1, rot, c_white, 1);
	draw_sprite_ext(spr_Mortar_01, 0, x, y, 1, 1, rot, c_white, 1);
	draw_sprite_ext(spr_Mortar_02, 0, x, y, 1, 1, rot, c_white, 1);  
}
 else if build_pos == 1 {
    draw_sprite_ext(spr_Mortar_00, 0, x, y, 1, 1, rot, c_white, 1);
    draw_sprite_ext(spr_Mortar_01, 0, x, y, 1, 1, rot, c_white, 1);
    draw_sprite_ext(spr_Mortar_02, 0, x, y, 1, 1, rot, c_white, 0.4);
 }
    else if build_pos == 0 {
        draw_sprite_ext(spr_Mortar_00, 0, x, y, 1, 1, rot, c_white, 1);
        draw_sprite_ext(spr_Mortar_01, 0, x, y, 1, 1, rot, c_white, 0.4);
    }
