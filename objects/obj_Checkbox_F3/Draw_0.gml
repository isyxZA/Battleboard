draw_self();

if is_checked == true { draw_sprite_ext(spr_Checkmark, 0, x, y-8, scl, scl, 0, c_white, 1); }

draw_set_color(c_white);
draw_set_font(fnt_12);
draw_set_halign(fa_center);
draw_text(x, y+32, "3");
draw_set_colour(c_black);

