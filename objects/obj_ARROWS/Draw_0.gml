draw_sprite_ext(sprite_index, 0, ax, ay, as, as, rot, c_white, a);
draw_set_font(fnt_48);
draw_set_color(c_silver);
draw_set_halign(fa_center);
draw_set_alpha(a);
var a1 = a-0.4;
draw_text_transformed_shadow(x, y+adj, txt, 1, 1, rot, 4, rot1, c_black, a1);
draw_set_font(fnt_12);
draw_set_alpha(1);