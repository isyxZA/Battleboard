target_x = 0;
target_y = 0;
ship_x = 0;
ship_y = 0;
depot_x = 0;
depot_y = 0;

uav_x1 = 0;
uav_y1 = 0;
uav_x2 = 0;
uav_y2 = 0;

bomber_x1 = 0;
bomber_y1 = 0;
bomber_x2 = 0;
bomber_y2 = 0;

min_x = global.min_x;
min_y = global.min_y;
max_x = global.max_x;
max_y = global.max_y;

menu_anim = true;
menu_anim_count = 0;
menu_alpha = 0;
menu_scl = 0;
menu_anim_timer = 20;

target_option = "NOONE";

bomber_targeting    = false;
missile_targeting   = false;
uav_targeting       = false;
artillery_targeting = false;
airdrop_targeting   = false;
ilc_targeting       = false;
tlc_targeting       = false;
blc_targeting       = false;
elc_targeting       = false;
llc_targeting       = false;

draw_bomber = false;
draw_missile = false;
draw_uav = false;
draw_artillery = false;
draw_airdrop = false;
draw_ilc = false;
draw_tlc = false;
draw_blc = false;
draw_elc = false;
draw_llc = false;

confirm_menu = false;
target_rot = 0;
spawn_ship = noone;
airdrop_depot = noone;

command_menu[0] = "Confirm";
command_menu[1] = "Retarget";

reinforce_menu[0] = "Alpha";
reinforce_menu[1] = "Bravo";
reinforce_menu[2] = "Charlie";
reinforce_menu[3] = "Delta";
reinforce_menu[4] = "Echo";
reinforce_menu[5] = "Cancel";

alpha_exists = true;
bravo_exists = true;
charlie_exists = true;
delta_exists = true;
echo_exists = true;

confirm_list = 1;
menu_option = 0;
reinforce_squad = "NOONE";

deactivate = false;
active = false;

can_drop = false;

bomb_x1 = target_x;
bomb_y1 = target_y;
bomb_x2 = target_x;
bomb_y2 = target_y;
bomb_x3 = target_x;
bomb_y3 = target_y;
bomb_x4 = target_x;
bomb_y4 = target_y;
bomb_x5 = target_x;
bomb_y5 = target_y;
bomb_x6 = target_x;
bomb_y6 = target_y;
bomb_x7 = target_x;
bomb_y7 = target_y;
bomb_x8 = target_x;
bomb_y8 = target_y;
bomb_x9 = target_x;
bomb_y9 = target_y;
bomb_x10= target_x;
bomb_y10= target_y;

if PLAYER.player == "ONE" { 
	p_one = true; 
	txt_rot = 0;
}
	else { 
		p_one = false; 
		txt_rot = 180;
	}

if PLAYER.faction == "US" { s_uav = spr_UAV; }
	else { s_uav = spr_UAV_RU; }
