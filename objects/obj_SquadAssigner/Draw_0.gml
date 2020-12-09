draw_self();
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_14);
draw_text_colour_shadow(x, y+200, string(my_squad), c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
var sl_len = ds_list_size(squad_list);
draw_text_colour_shadow(x, y+230, string(sl_len), c_white, t_colour, t_colour, t_colour, 1, 300, c_black, 0.6);
draw_set_font(fnt_12);
   
if active == true { draw_sprite_ext(sprite_index, 0, x, y, 1.1, 1.1, 0, c_white, 1); }

if slot1_full == true { draw_sprite_ext(slot1_sprite, 0, x, slot_y1, 0.8, 0.8, 0, c_white, 1); }
    else { draw_sprite_ext(spr_Dropdown_Empty, 0, x, slot_y1, 1, 1, 0, c_white, 0.5); }
if slot2_full == true { draw_sprite_ext(slot2_sprite, 0, x, slot_y2, 0.8, 0.8, 0, c_white, 1); }
    else { draw_sprite_ext(spr_Dropdown_Empty, 0, x, slot_y2, 1, 1, 0, c_white, 0.5); }
if slot3_full == true { draw_sprite_ext(slot3_sprite, 0, x, slot_y3, 0.8, 0.8, 0, c_white, 1); }
    else { draw_sprite_ext(spr_Dropdown_Empty, 0, x, slot_y3, 1, 1, 0, c_white, 0.5); }
if slot4_full == true { draw_sprite_ext(slot4_sprite, 0, x, slot_y4, 0.8, 0.8, 0, c_white, 1); }
    else { draw_sprite_ext(spr_Dropdown_Empty, 0, x, slot_y4, 1, 1, 0, c_white, 0.5); }
if slot5_full == true { draw_sprite_ext(slot5_sprite, 0, x, slot_y5, 0.8, 0.8, 0, c_white, 1); }
    else { draw_sprite_ext(spr_Dropdown_Empty, 0, x, slot_y5, 1, 1, 0, c_white, 0.5); }
if slot6_full == true { draw_sprite_ext(slot6_sprite, 0, x, slot_y6, 0.8, 0.8, 0, c_white, 1); }
    else { draw_sprite_ext(spr_Dropdown_Empty, 0, x, slot_y6, 1, 1, 0, c_white, 0.5); }


