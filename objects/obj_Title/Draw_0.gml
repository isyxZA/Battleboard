draw_sprite_stretched_ext(spr_Text_BG1, 0, x_pos, y_pos, s_width, s_height, c_white, a);
draw_sprite_ext(spr_Title, 0, x, y, 0.9, 0.9, 0, c_white, a);
gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_flare_star_3, 0, x, y, 2+a, 2+a, 0, c_white, 1.2-a);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);







