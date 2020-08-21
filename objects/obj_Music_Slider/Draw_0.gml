//draw sprite
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, 1);

//and values
draw_set_color(c_white);
draw_set_font(fnt_12);
draw_set_halign(fa_center);
if percentage == default_ref { draw_text(x, y-48, string_hash_to_newline("Default")); }
    else if percentage == 0 { draw_text(x, y-48, string_hash_to_newline("Off")); }
        else { draw_text(x, y-48, string_hash_to_newline(string(percentage))); }
draw_set_color(c_black);


