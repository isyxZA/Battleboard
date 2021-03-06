switch room {
    case rm_MainMenu:
		shader_set(shd_vignette_noise);
	    shader_set_uniform_f(uni_settings, 2, 1, 0.1, 1); //vignette inner circle size, vignette outter circle size, noise strength, noise enable (1 or 0 only).
	    shader_set_uniform_f(uni_vignette_colour, 148,145,120);//184,175,154);
	    draw_sprite_stretched(bg_Main, 0,0,0, room_width, room_height);
		shader_reset();
		draw_set_alpha(0.4);
		draw_sprite_stretched(bg_Main, 0,0,0, room_width, room_height);
		//draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
        break;
    case rm_Pause:
		shader_set(shd_vignette_noise);
	    shader_set_uniform_f(uni_settings, 2, 1, 0.1, 1); //vignette inner circle size, vignette outter circle size, noise strength, noise enable (1 or 0 only).
	    shader_set_uniform_f(uni_vignette_colour,148,140,104);
        draw_sprite_stretched(bg_Pause, 0,0,0, room_width, room_height);
		shader_reset();
        draw_set_alpha(0.3);
        draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(0.5);
        draw_roundrect_colour_ext(x, y, x+254, y+416, 4, 4, c_black, c_black, false);
        draw_set_alpha(1);
        break;
	case rm_Join:
		shader_set(shd_vignette_noise);
	    shader_set_uniform_f(uni_settings, 2, 1, 0.1, 1); //vignette inner circle size, vignette outter circle size, noise strength, noise enable (1 or 0 only).
	    shader_set_uniform_f(uni_vignette_colour,148,140,104);
        draw_sprite_stretched(bg_Setup, 0,0,0, room_width, room_height);
		shader_reset();
        draw_set_alpha(0.2);
        draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
        break;
	case rm_Host:
		shader_set(shd_vignette_noise);
	    shader_set_uniform_f(uni_settings, 2, 1, 0.1, 1); //vignette inner circle size, vignette outter circle size, noise strength, noise enable (1 or 0 only).
	    shader_set_uniform_f(uni_vignette_colour,148,140,104); 
        draw_sprite_stretched(bg_Setup, 0,0,0, room_width, room_height);
		shader_reset();
		draw_sprite_ext(spr_OptionsBG_1, 0, x, y, 1, 0.94, 0, c_white, 1);
		draw_set_alpha(0.2);
		draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(0.1);
		draw_roundrect_colour_ext(x+30, 190, x+368, 350, 4, 4, c_dkgray, c_dkgray, false);
        draw_roundrect_colour_ext(x+30, 465, x+368, 570, 4, 4, c_dkgray, c_dkgray, false);
		draw_set_alpha(1);
		draw_roundrect_colour_ext(x+30, 190, x+368, 350, 4, 4, c_dkgray, c_dkgray, true);
        draw_roundrect_colour_ext(x+30, 465, x+368, 570, 4, 4, c_dkgray, c_dkgray, true);
		draw_sprite_ext(spr_Menu_Button, 0, room_width*0.5, 64               , 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_Menu_Button, 0, room_width*0.5, room_height*0.175, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_Menu_Button, 0, room_width*0.5, room_height*0.43 , 1, 1, 0, c_white, 1);
		draw_set_valign(fa_middle);
        draw_set_halign(fa_center);
        draw_set_font(fnt_16);
        draw_text_colour_shadow(room_width*0.5, 64               , "Settings"   , c1, c1, c1, c1, 1, 330, c_black, 0.7); 
        draw_text_colour_shadow(room_width*0.5, room_height*0.175, "Server Type", c1, c1, c1, c1, 1, 330, c_black, 0.7); 
        draw_text_colour_shadow(room_width*0.5, room_height*0.43 , "Server Name", c1, c1, c1, c1, 1, 330, c_black, 0.7); 
        draw_set_font(fnt_12);
        break;
    case rm_Options:
		shader_set(shd_vignette_noise);
	    shader_set_uniform_f(uni_settings, 2, 1, 0.1, 1); //vignette inner circle size, vignette outter circle size, noise strength, noise enable (1 or 0 only).
	    shader_set_uniform_f(uni_vignette_colour,186,177,131);
        draw_sprite_stretched(bg_Options, 0,0,0, room_width, room_height);
		shader_reset();
        draw_set_alpha(0.3);
        draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
		draw_sprite_ext(spr_OptionsBG_1, 0, x, y, 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_OptionsBG_2, 0, x+488, y, 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_OptionsBG_1, 0, x+1336, y, 1, 1, 0, c_white, 1);
        draw_roundrect_colour_ext(x, y, x+391, y+959, 4, 4, c1, c_dkgray, true);
        draw_roundrect_colour_ext(x+488, y, x+1239, y+911, 4, 4, c1, c_dkgray, true);
        draw_roundrect_colour_ext(x+1336, y, x+1727, y+959, 4, 4, c1, c_dkgray, true);
        draw_sprite_ext(spr_Menu_Button, 0, room_width*0.5, 96, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_Menu_Button, 0, 292           , 96, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_Menu_Button, 0, 1628          , 96, 1, 1, 0, c_white, 1);
        draw_set_valign(fa_middle);
        draw_set_halign(fa_center);
        draw_set_font(fnt_16);
        draw_text_colour_shadow(room_width*0.5, 96, "Settings", c1, c1, c1, c1, 1, 330, c_black, 0.7); 
        draw_text_colour_shadow(292,  96, "Controls", c1, c1, c1, c1, 1, 330, c_black, 0.7); 
        draw_text_colour_shadow(1628, 96, "Hotkeys", c1, c1, c1, c1, 1, 330, c_black, 0.7); 
        draw_set_font(fnt_12);
        break;
    case rm_Setup:
		shader_set(shd_vignette_noise);
	    shader_set_uniform_f(uni_settings, 2, 1, 0.1, 1); //vignette inner circle size, vignette outter circle size, noise strength, noise enable (1 or 0 only).
	    shader_set_uniform_f(uni_vignette_colour,210,180,140); 
        draw_sprite_stretched(bg_Pause, 0,0,0, room_width, room_height);
		shader_reset();
        draw_set_alpha(0.3);
        draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
        break;
}


