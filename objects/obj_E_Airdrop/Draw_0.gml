if explode == false { 
    draw_sprite_ext(spr_Airdrop_Green, 0, x, y, 1, 1, 0, c_white, 1); 
    if global.my_turn == true {
        draw_sprite_ext(spr_Dot_Orange, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_colour(c_white);
        draw_set_font(fnt_12);
        draw_text(x, y, string_hash_to_newline(string(countdown)));
        draw_set_colour(c_black);
    }
}
    else if explode == true {
        draw_sprite_ext(spr_Smoke_1, image_index, x, y, 1, 1, 0, c_white, 1);
    }

