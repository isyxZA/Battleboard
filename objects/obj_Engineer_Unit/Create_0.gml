event_inherited();

var p_side    = PLAYER.player;
var p_faction = PLAYER.faction;

if p_side == "ONE" { 
	p_one = true;
	rot_adj = 90;
	txt_rot = 0;
	switch p_faction {
		case "US":
			my_sprite = spr_Engineer_A1;
			break;
		case "RU":
			my_sprite = spr_Engineer_B1;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one = false;
		rot_adj = 270; 
		txt_rot = 180;
		switch p_faction {
			case "US":
				my_sprite = spr_Engineer_A2;
				break;
			case "RU":
				my_sprite = spr_Engineer_B2;
				break;
		}
	}

var t = instance_place(x, y, obj_Game_Tile);
t.occupied = true;
my_tile   = t.tile_num;
my_tile_x = t.tile_x;
my_tile_y = t.tile_y;
x = my_tile_x;
y = my_tile_y;

shoot_mask = instance_create_layer(x, y, "Units", obj_Cant_Shoot);
shoot_mask.kind = 2;
shoot_mask.my_unit = id;

mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);

unit_type = "ENGINEER";
view_radius = global.cell_size*4;

my_speed = 3.7;

start_ap = 10;
start_mp = 10;
action_points = 0;
move_points = 0;
ap_cost = 10;
mp_cost = 2;

action_range = 136;

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

ds_list_add(global.unit_list, id);//Add self to total unit list
ds_list_add(global.myunit_list, id);//Add self to my unit list
ds_list_add(global.engineer_list, id);

depot_supply = 1;
depot_max = 1;
shoot_depot = false;
depot_rate = 1;

repair_supply = 1;
repair_max = 1;
shoot_repair = false;
repair_rate = 1;

tow_supply = 1;
tow_max = 1;
shoot_tow = false;
tow_rate = 1;

mortar_supply = 1;
mortar_max = 1;
shoot_mortar = false;
mortar_rate = 1;

fire_menu[0] = "Depot";
fire_menu[1] = "Repair";
fire_menu[2] = "TOW";
fire_menu[3] = "Mortar"
fire_menu[4] = "Cancel";

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);
audio_emitter_position(emit, x, y, 0);
audio_play_sound_on(emit, snd_DoorClose_01, false, 1);

with obj_Trees  { if !discovered { scr_DiscoveryCheck(); } }
with obj_Houses { if !discovered { scr_DiscoveryCheck(); } }

//Particles Setup
particle_eng0 = part_system_create();
particle_eng1 = part_system_create();
part_system_depth(particle_eng0, -5);
part_system_depth(particle_eng1, -7);
eng0_emitter = part_emitter_create(particle_eng0);
eng1_emitter = part_emitter_create(particle_eng1);

//Smoke particle
part1 = part_type_create();
part_type_sprite(part1, spr_Smoke_3, true, true, false);
part_type_size(part1, 0.3, 0.4, 0.03, 0.01);
part_type_scale(part1, 0.1, 0.1);
part_type_alpha2(part1,0.5,0);
part_type_speed(part1, .1, .2, -0.001, 0.005);
part_type_direction(part1, 135, 45, 0, 2);
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
part_type_direction(part2,135, 45,0,2);
part_type_speed(part2,1,1.5,-0.01,0);
part_type_blend(part2, true);
//how long it lasts
part_type_life(part2,10,15);

//Flame particle
part3 = part_type_create();
part_type_sprite(part3, spr_Fireball_01, false, false, true);
part_type_size(part3, 0.25, 0.25, 0.02, 0.02);
part_type_scale(part3, 0.4, 0.5);
part_type_alpha2(part3,0.5,0);
part_type_speed(part3, .2, .3, -0.001, 0);
part_type_direction(part3, 135, 45, 0, 2);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_life(part3, 60, 80);

if PLAYER.net_status != "NONE" { alarm[10] = 2; }
