my_squad = "";
temp_sprite = -1;
temp_cost = 0;
squad_list = -1;
lpos = -1;
lcheck = false;
place_unit = "";
t_colour = make_colour_rgb(169,169,169);
open_slots = 6;
can_activate = false;
active = false;
v_space = 32;
auto_assign = false;
clear = false;
//selector = -1;

slot_y1 = y-14;
slot_y2 = slot_y1+v_space;
slot_y3 = slot_y1+(v_space*2);
slot_y4 = slot_y1+(v_space*3);
slot_y5 = slot_y1+(v_space*4);
slot_y6 = slot_y1+(v_space*5);

slot1_full = false;
slot2_full = false;
slot3_full = false;
slot4_full = false;
slot5_full = false;
slot6_full = false;

slot1_sprite = spr_Dropdown_Empty;
slot2_sprite = spr_Dropdown_Empty;
slot3_sprite = spr_Dropdown_Empty;
slot4_sprite = spr_Dropdown_Empty;
slot5_sprite = spr_Dropdown_Empty;
slot6_sprite = spr_Dropdown_Empty;

