draw_sprite_stretched_ext(bg_Main, 0, x_pos-1, y_pos-1, s_width+2, s_height+2, c_dkgray, a-0.4);
draw_sprite_stretched_ext(bg_Main, 0, x_pos, y_pos, s_width, s_height, c_black, a);
draw_sprite_stretched_ext(spr_Text_BG1, 0, x_pos, y_pos, s_width, s_height, c_white, a);
draw_sprite_ext(spr_Title, 0, x, y, 0.9, 0.9, 0, c_white, a);
gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_flare_star_3, 0, x, y, 2+a, 2+a, 0, c_white, 1.1-a);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);







