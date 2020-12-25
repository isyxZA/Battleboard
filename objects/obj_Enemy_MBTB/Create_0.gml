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
			my_sprite = spr_Tank_A2a; 
			my_turret = spr_Tank_A2a_Turret;
			my_icon   = spr_Tank_A2a_Icon;
			spot_mask = spr_Tank_A2a_Mask;
			crater_index = spr_Tank_Crater_US;
			break;
		case "RU":
			my_sprite = spr_Tank_B2a; 
			my_turret = spr_Tank_B2a_Turret;
			my_icon   = spr_Tank_B2a_Icon;
			spot_mask = spr_Tank_B2a_Mask;
			crater_index = spr_Tank_Crater_RU;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one = false;
		rot_adj = 90;
		txt_rot = 180;
		switch p_faction {
			case "US":
				my_sprite = spr_Tank_A1; 
				my_turret = spr_Tank_A1_Turret;
				my_icon   = spr_Tank_A1_Icon;
				spot_mask = spr_Tank_A1_Mask;
				crater_index = spr_Tank_Crater_US;
				break;
			case "RU":
				my_sprite = spr_Tank_B1; 
				my_turret = spr_Tank_B1_Turret;
				my_icon   = spr_Tank_B1_Icon;
				spot_mask = spr_Tank_B1_Mask;
				crater_index = spr_Tank_Crater_RU;
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

unit_type = "E_MBTB";
view_radius = global.cell_size*8;

my_speed = 3.6;

start_ap = 10;
action_points = 0;
ap_cost = 2;

action_range = view_radius;

cannon_ammo = 10;
cannon_max = 10;
shoot_cannon = false;
cannon_rate = 1;
cannon_cost = 4;

mg_ammo = 600;
mg_max = 600;
shoot_mg = false;
mg_rate = 20;
mg_cost = 2;

x_end = x;
y_end = y;
x_final = x;
y_final = y;
target_x = x;
target_y = y;
diag = false;

can_man = true;
is_manning = false;
manned_unit = noone;

turret_rot = 0;

ds_list_add(global.unit_list, id);//Add self to unit list
ds_list_add(global.enemyunit_list, id);//Add self to enemy unit list

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 2);
audio_emitter_position(emit, x, y, 0);

//Particles Setup
particle_tank0 = part_system_create();
particle_tank1 = part_system_create();
part_system_depth(particle_tank0, -5);
part_system_depth(particle_tank1, -7);
tank0_emitter = part_emitter_create(particle_tank0);
tank1_emitter = part_emitter_create(particle_tank1);

//Smoke particle
part1 = part_type_create();
part_type_sprite(part1, spr_Smoke_3, true, true, false);
part_type_size(part1, 0.5, 0.6, 0.03, 0.01);
part_type_scale(part1, 0.1, 0.1);
part_type_alpha2(part1,0.5,0);
part_type_speed(part1, .3, .4, -0.005, 0.01);
part_type_direction(part1, 160,80, 0, 2);
part_type_orientation(part1, 0, 359, 0, 0, true);
part_type_life(part1, 200, 220);

//Pixel particle
part2 = part_type_create();
//how it looks
part_type_sprite(part2, spr_Pixel, false, true, false);
part_type_size(part2, 0.5,0.5,0.05,0.01);
part_type_orientation(part2,0,359,0,0,true);
part_type_color3(part2,c_red,c_orange,c_silver);
part_type_alpha2(part2,1,0);
//how it moves
part_type_direction(part2,140,100,0,2);
part_type_speed(part2,1,1.5,-0.01,0);
part_type_blend(part2, true);
//how long it lasts
part_type_life(part2,20,25);

//Flame particle
part3 = part_type_create();
part_type_sprite(part3, spr_Fireball_01, false, false, true);
part_type_size(part3, 0.5, 0.5, 0.02, 0.02);
part_type_scale(part3, 0.4, 0.5);
part_type_alpha2(part3,0.5,0);
part_type_speed(part3, .3, .4, -0.002, 0);
part_type_direction(part3, 160,80, 0, 2);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_life(part3, 100, 120);


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

