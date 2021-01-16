draw_self();

if is_checked == true { draw_sprite_ext(spr_Checkmark, 0, x, y-8, scl, scl, 0, c_white, 1); }

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_18); 
draw_text_colour_shadow(x+48, y-64, "VSync", c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
draw_text_colour_shadow(x+48, y-44, "-----", c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
draw_set_font(fnt_12);
draw_text_colour_shadow(x, y+32, "ON", c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);


