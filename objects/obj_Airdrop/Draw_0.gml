if explode == false { 
    draw_sprite_ext(spr_Airdrop_Green, 0, x, y, 1, 1, rot, c_white, 1); 
    if global.my_turn == true {
        draw_sprite_ext(spr_Dot_Orange, 0, x, y, 1, 1, 0, c_white, 1);
        if start_countdown = true { 
            draw_set_colour(c_white);
            draw_set_font(fnt_12);
            if p_one == true { draw_text_transformed(x, y, string(countdown), 1, 1, rot); }
				else { draw_text_transformed(x+2, y, string(countdown), 1, 1, rot); }
            draw_set_colour(c_black);
        }
    }
}
    else if explode == true {
        draw_sprite_ext(spr_Smoke_1, img, x, y, 1, 1, 0, c_white, 1);
    }

