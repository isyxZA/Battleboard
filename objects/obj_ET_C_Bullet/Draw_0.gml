if can_draw == true {
    if explode == false { draw_sprite_ext(spr_Bullet01, 0, x, y, 1, 1, rot, c_white, 1); }
        else if explode == true {
            var mx = x+lengthdir_x(40, rot);
            var my = y+lengthdir_y(40, rot);
            draw_sprite_ext(spr_Explosion_01, img, mx, my, 1, 1, rot, c_white, 1);
        }
}

