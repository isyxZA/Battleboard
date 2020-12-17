//Display and layout settings
v_space = 32;
t_space = 96;
s_space = 52;
xscale = 1;
yscale = 1;
my_colour = c_white;
t_colour = make_colour_rgb(97,108,122);
s_time = 12;
txt_a = 0;
tlist_a = 1;
ins_rot = 0;

//Mouse as cast to gui
gui_mx = device_mouse_x_to_gui(0);
gui_my = device_mouse_y_to_gui(0);

//Center points of gui
mid_x = display_get_gui_width()*0.5;
mid_y = display_get_gui_height()*0.5;

//UI surface and scaling setup
ui_topsurf = -1;
ui_botsurf = -1;
ui_ratio = global.ui_scale;
ui_width = 1344;
ui_height = 144;
ui_midx = ui_width*0.5;
ui_lx = ui_width*0.075;
ui_rx = ui_width*0.925;

s_dist = 36*ui_ratio;

//Top ui
ui_tx = (mid_x - (ui_width*ui_ratio)*0.5);//Surface anchor points x == (gui_width/2 - surface_width/2)
ui_ty = (display_get_gui_height()*0.001)-1;
ty_adj = -(ui_height*ui_ratio);
//Bot ui
ui_bx = ui_tx;//Surface anchor points x == (gui_width/2 - surface_width/2)
ui_by = display_get_gui_height()-(ui_height*ui_ratio);
by_adj = ui_height*ui_ratio;

//UI animation
y_target = 0;
ui_anim = false;

//Turn card timer sensors
tlist_adj = -t_space;
tlist_adj0 = 0;
tlist_adj1 = 0;
tlist_adj2 = 0;
tlist_adj3 = 0;
tlist_adj4 = 0;
tlist_adj5 = 0;
tlist_adj6 = 0;
tlist_adj7 = 0;
tlist_adj8 = 0;
tlist_adj9 = 0;
turn_id = "NOONE";
t_pos = -1;
t0_timer = 0;
t1_timer = 0;
t2_timer = 0;
t3_timer = 0;
t4_timer = 0;
t5_timer = 0;
t6_timer = 0;
t7_timer = 0;
t8_timer = 0;
t9_timer = 0;
t10_timer = 0;
t11_timer = 0;

squad_intel = false;

ty_1 = ui_height*0.16;
ty_0 = ui_height*0.55;
ty_2 = ui_height*0.86;

tx_0 = ui_width*0.825;
tx_1 = tx_0-(t_space);
tx_2 = tx_0-(2*t_space);
tx_3 = tx_0-(3*t_space);
tx_4 = tx_0-(4*t_space);
tx_5 = tx_0-(5*t_space);
tx_6 = tx_0-(6*t_space);
tx_7 = tx_0-(7*t_space);
tx_8 = tx_0-(8*t_space);
tx_9 = tx_0-(9*t_space);
tx_10 = tx_0-(10*t_space);
tx_11 = tx_0-(11*t_space);

//Insertion points for command cards
var i_space = t_space*0.5;
ix_1 = tx_0-i_space;
ix_2 = tx_1-i_space;
ix_3 = tx_2-i_space;
ix_4 = tx_3-i_space;
ix_5 = tx_4-i_space;
ix_6 = tx_5-i_space;
ix_7 = tx_6-i_space;
ix_8 = tx_7-i_space;
ix_9 = tx_8-i_space;
ins_1 = false;
ins_2 = false;
ins_3 = false;
ins_4 = false;
ins_5 = false;
ins_6 = false;
ins_7 = false;
ins_8 = false;
ins_9 = false;
ins_1_count = 0;
ins_2_count = 0;
ins_3_count = 0;
ins_4_count = 0;
ins_5_count = 0;
ins_6_count = 0;
ins_7_count = 0;
ins_8_count = 0;
ins_9_count = 0;


//Turn controls
active_turn = "NOONE";
can_endturn = false;
endturn_timer = 0;
draw_endturn = false;
game_over = false;
display_txt = "";
turn_timer = 0;
timer_count = 0;
can_count = true;
switching_turns = false;
my_turn_start = false;
landing = false;
pre_battle = true;
objective_amount = 3;
objectives_controlled = 0;
objectives_lost = 0;

//Alerts display
targeting_error = false;
navigation_error = false;
friendly_fire = false;
draw_apcost = false;
ap_cost = 0;
draw_cpcost = false;
cp_cost = 0;
draw_apreturn = false;

show_options = false;
temp_zlevel = 0;

//Track amount of destroyed units
lost_infantry = 0;
lost_tank = 0;
lost_engineer = 0;
lost_btr = 0;
lost_logi = 0;
lost_depot = 0;
lost_repair = 0;
lost_tow = 0;
lost_mortar = 0;

destroyed_infantry = 0;
destroyed_tank = 0;
destroyed_engineer = 0;
destroyed_btr = 0;
destroyed_logi = 0;
destroyed_depot = 0;
destroyed_repair = 0;
destroyed_tow = 0;
destroyed_mortar = 0;

//Command cards setup
by_1 = ui_height*0.145;
by_0 = ui_height*0.7;
by_2 = ui_height*0.91;

bx_0 = ui_width*0.14;
bx_1 = bx_0+(t_space);
bx_2 = bx_0+(2*t_space);
bx_3 = bx_0+(3*t_space);
bx_4 = bx_0+(4*t_space);
bx_5 = bx_0+(6*t_space);
bx_6 = bx_0+(7*t_space);
bx_7 = bx_0+(8*t_space);
bx_8 = bx_0+(9*t_space);
bx_9 = bx_0+(10*t_space);

draw_commandOL = false;
bomber_timer = 0;
missile_timer = 0;
uav_timer = 0;
artillery_timer = 0;
airdrop_timer = 0;
ilc_timer = 0;
tlc_timer = 0;
blc_timer = 0;
elc_timer = 0;
llc_timer = 0;
active_bomber = false;
active_missile = false;
active_uav = false;
active_artillery = false;
active_airdrop = false;
active_ilc = false;
active_tlc = false;
active_blc = false;
active_elc = false;
active_llc = false;
command_targeting = false;
bomber_targeting = false;
missile_targeting = false;
uav_targeting = false;
artillery_targeting = false;
airdrop_targeting = false;
ilc_targeting = false;
tlc_targeting = false;
blc_targeting = false;
elc_targeting = false;
llc_targeting = false;

enemy_controller = -1;
p_faction = PLAYER.faction;
o_faction = PLAYER.opponent_faction;
if p_faction == "US" { p_flag = spr_Flag_US_sml; }
	else if p_faction == "RU" { p_flag = spr_Flag_RU_sml; }
if o_faction == "US" { o_flag = spr_Flag_US_sml; }
	else if o_faction == "RU" { o_flag = spr_Flag_RU_sml; }










