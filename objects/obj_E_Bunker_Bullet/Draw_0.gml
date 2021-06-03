if can_draw == true {
    if explode == false { draw_sprite_ext(spr_Bullet01, 0, x, y, 1, 1, rot, c_white, 1); }
        else if explode == true {
            draw_sprite_ext(ex_sprite, img, x, y, 1, 1, rot, c_white, 1);
        }
}

