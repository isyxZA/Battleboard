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
			my_sprite = spr_BTR_A2; 
			my_turret = spr_BTR_A2_Turret;
			my_icon   = spr_BTR_A2_Icon;
			spot_mask = spr_BTR_A2_Mask;
			break;
		case "RU":
			my_sprite = spr_BTR_B2; 
			my_turret = spr_BTR_B2_Turret;
			my_icon   = spr_BTR_B2_Icon;
			spot_mask = spr_BTR_B2_Mask;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one = false;
		rot_adj = 90;
		txt_rot = 180;
		switch p_faction {
			case "US":
				my_sprite = spr_BTR_A1; 
				my_turret = spr_BTR_A1_Turret;
				my_icon   = spr_BTR_A1_Icon;
				spot_mask = spr_BTR_A1_Mask;
				break;
			case "RU":
				my_sprite = spr_BTR_B1; 
				my_turret = spr_BTR_B1_Turret;
				my_icon   = spr_BTR_B1_Icon;
				spot_mask = spr_BTR_B1_Mask;
				break;
		}
	}

var t = instance_place(x, y, obj_Game_Tile);
my_tile = t.id;
t.occupied = true; 
my_tile_x = t.tile_x;
my_tile_y = t.tile_y;
x = my_tile_x;
y = my_tile_y;

shoot_mask = instance_create_layer(x, y, "Units", obj_Cant_Shoot);
shoot_mask.my_unit = id;

mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);

unit_type = "E_BTR";
view_radius = global.cell_size*7;

my_speed = 3.8;
fuel_count = 100;
unit_health = 100;

start_ap = 12;
action_points = 0;
ap_cost = 4;
mp_cost = 2;

action_range = view_radius;

he_ammo = 80;
he_max = 80;
shoot_he = false;
he_rate = 4;

ap_ammo = 80;
ap_max = 80;
shoot_ap = false;
ap_rate = 4;

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

turret_rot = 0;

ds_list_add(global.unit_list, id);//Add self to unit list
ds_list_add(global.enemyunit_list, id);//Add self to enemy unit list

fire_menu[0] = "HE";
fire_menu[1] = "AP";
fire_menu[2] = "Cancel";

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 2);
audio_emitter_position(emit, x, y, 0);

//Particles Setup
particle_btr0 = part_system_create();
particle_btr1 = part_system_create();
part_system_depth(particle_btr0, -5);
part_system_depth(particle_btr1, -7);
btr0_emitter = part_emitter_create(particle_btr0);
btr1_emitter = part_emitter_create(particle_btr1);

//Smoke particle
part1 = part_type_create();
part_type_sprite(part1, spr_Smoke_3, true, true, false);
part_type_size(part1, 0.3, 0.4, 0.03, 0.01);
part_type_scale(part1, 0.1, 0.1);
part_type_alpha2(part1,0.5,0);
part_type_speed(part1, .3, .3, -0.001, 0.005);
part_type_direction(part1, 135, 45, 0, 2);
part_type_orientation(part1, 0, 359, 0, 0, true);
part_type_life(part1, 200, 220);

//Pixel particle
part2 = part_type_create();
//how it looks
part_type_sprite(part2, spr_Pixel, false, true, false);
part_type_size(part2, 0.6,0.6,0.05,0.05);
part_type_orientation(part2,0,359,0,0,true);
part_type_color3(part2,c_red,c_orange,c_silver);
part_type_alpha2(part2,1,0);
//how it moves
part_type_direction(part2,135, 45,0,2);
part_type_speed(part2,1,1.5,-0.01,0);
part_type_blend(part2, true);
//how long it lasts
part_type_life(part2,20,30);

//Flame particle
part3 = part_type_create();
part_type_sprite(part3, spr_Fireball_01, false, false, true);
part_type_size(part3, 0.25, 0.25, 0.02, 0.02);
part_type_scale(part3, 0.4, 0.5);
part_type_alpha2(part3,0.5,0);
part_type_speed(part3, .25, .25, -0.001, 0);
part_type_direction(part3, 135, 45, 0, 2);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_life(part3, 80, 100);

if PLAYER.net_status == "NONE" {
	nav_grid  = global.move_grid;
	
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

