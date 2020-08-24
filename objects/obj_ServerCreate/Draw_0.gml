/// @description Draw input box
draw_set_font(fnt_14);
draw_set_color(c_white);
draw_set_halign(fa_center);
if global.server_name == "" { draw_text(room_width*0.5, 700, "Enter a server name."); }
	else { draw_text(room_width*0.5, 700, string(global.server_name)); }
if global.server_IP == "" { draw_text(room_width*0.5, 740, "Choose a server type."); }
	else { draw_text(room_width*0.5, 740, string(global.server_IP)); }
if global.net_type == "" { draw_text(room_width*0.5, 780, "---"); }
	else { draw_text(room_width*0.5, 780, string(global.net_type)); }
draw_text(room_width*0.5, 820, string(global.server_port));
draw_set_font(fnt_12);
draw_set_color(c_black);

draw_set_valign(fa_top);
scr_input_box_Draw(true,true,c_black,c_white,c_gray,c_ltgray,c_black,c_dkgray,make_colour_rgb(37,168,250),string_height(displayText),1);
draw_set_valign(fa_middle);
	
	