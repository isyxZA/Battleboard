draw_self();
draw_sprite_part(spr_Slider_Fill, 0, 0, 0,sw,sh,sx, sy);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_18);  
draw_text_colour_shadow(x, y-80, "Effects Volume", c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
draw_set_font(fnt_12);

