objective_cap =0 ;
capture_pos = 0; //Add for player one, subtract for player two
capture_radius = 480;

status_txt = "";

highlight_obj = false;

x_ref = sprite_get_width(spr_Flag_Neutral_sml)*0.5;
y_ref = sprite_get_height(spr_Flag_Neutral_sml)*0.5;
flag_x = x;

pone_flag = obj_CONTROL.p_flag;
ptwo_flag = obj_CONTROL.o_flag;

pone_units = 0;
ptwo_units = 0;

can_count = false;

if PLAYER.player == "ONE" { p_one = true; rot = 0; txt_adj = -32; }
	else { p_one = false; rot = 180; txt_adj = 32; }