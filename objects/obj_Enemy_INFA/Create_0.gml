event_inherited();

var p_side    = PLAYER.player;
var p_faction = PLAYER.opponent_faction;

//Inverse of player
if p_side == "ONE" {
	p_one = true;
	rot_adj = 270; 
	txt_rot = 0;
	switch p_faction {
		case "US":
			my_sprite = spr_Infantry_A2;
			spot_mask = spr_Infantry_A2_Mask;
			break;
		case "RU":
			my_sprite = spr_Infantry_B2;
			spot_mask = spr_Infantry_B2_Mask;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one = false;
		rot_adj = 90;
		txt_rot = 180;
		switch p_faction {
			case "US":
				my_sprite = spr_Infantry_A1;
				spot_mask = spr_Infantry_A1_Mask;
				break;
			case "RU":
				my_sprite = spr_Infantry_B1;
				spot_mask = spr_Infantry_B1_Mask;
				break;
		}
	}

var t = instance_place(x, y, obj_Game_Tile);
my_tile = t.id;
t.occupied = true; 
mp_cost   = t.move_rating;
my_tile_x = t.tile_x;
my_tile_y = t.tile_y;
x = my_tile_x;
y = my_tile_y;

shoot_mask = instance_create_layer(x, y, "Units", obj_Cant_Shoot);
shoot_mask.my_unit = id;

mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);

unit_type = "E_INFA";
view_radius = global.cell_size*5;

my_speed = 3.5;

start_ap = 8;
action_points = 0;
ap_cost = 2;

action_range = view_radius;

rifle_ammo = 100;
rifle_max = 100;
shoot_rifle = false;
rifle_rate = 4;

rpg_ammo = 1;
rpg_max = 1;
shoot_rpg = false;
rpg_rate = 1;

flare_ammo = 2;
flare_max = 2;
shoot_flare = false;
flare_rate = 1;

x_end = x;
y_end = y;
x_final = x;
y_final = y;
target_x = x;
target_y = y;
diag = true;

can_man = true;
is_manning = false;
manned_unit = noone;

ds_list_add(global.unit_list, id);//Add self to unit list
ds_list_add(global.enemyunit_list, id);//Add self to enemy unit list

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 2);
audio_emitter_position(emit, x, y, 0);

if PLAYER.net_status == "NONE" {
	nav_grid  = global.inf_move_grid;
	
	var la = ds_list_size(global.squad_1);
	var lb = ds_list_size(global.squad_2);
	var lc = ds_list_size(global.squad_3);
	var ld = ds_list_size(global.squad_4);
	var le = ds_list_size(global.squad_5);
	//Assign to a squad
	if global.game_turn == 0 {
		if la<6 { ds_list_add(global.squad_1, id); my_squad = "E_1"; }
		    else if lb<6 { ds_list_add(global.squad_2, id); my_squad = "E_2"; }
		        else if lc<6 { ds_list_add(global.squad_3, id); my_squad = "E_3"; }
		            else if ld<6 { ds_list_add(global.squad_4, id); my_squad = "E_4"; }
		                else if le<6 { ds_list_add(global.squad_5, id); my_squad = "E_5"; }
		                    else { ds_list_add(global.squad_1, id); my_squad = "E_1"; }
	}
		else {
			if la<9 { ds_list_add(global.squad_1, id); my_squad = "E_1"; }
			    else if lb<9 { ds_list_add(global.squad_2, id); my_squad = "E_2"; }
			        else if lc<9 { ds_list_add(global.squad_3, id); my_squad = "E_3"; }
			            else if ld<9 { ds_list_add(global.squad_4, id); my_squad = "E_4"; }
			                else if le<9 { ds_list_add(global.squad_5, id); my_squad = "E_5"; }
			                    else { ds_list_add(global.squad_1, id); my_squad = "E_1"; }
		}
}
	else {
		nav_grid  = global.net_move_grid;
	}

