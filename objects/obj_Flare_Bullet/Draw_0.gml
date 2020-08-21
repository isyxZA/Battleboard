if explode == false { draw_sprite_ext(spr_Bullet01, 0, x, y, 1, 1, rot, c_white, 1); }
    else if explode == true {
        if fade_out == true {  if a > 0.01 { a -= 0.001; } }
            else  { if a < 0.9 { a += 0.01; } }
        gpu_set_blendmode(bm_add);
        draw_sprite_ext(spr_Flare_Yellow, 0, x, y, random_range(0.25,0.35), random_range(0.25, 0.35), 0, c_white, a);
        gpu_set_blendmode(bm_normal);
        draw_sprite_ext(spr_Flare_Shadow, 0, x-4, y+24, random_range(0.85,1), random_range(0.9,1), 0, c_black, a);
    }

