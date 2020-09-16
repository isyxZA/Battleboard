event_inherited(); 

size_target = 9;

var p_side    = PLAYER.player;
var p_faction = PLAYER.faction;

if p_side == "ONE" {
	p_one = true;
	rot_adj = 90;
	txt_rot = 0;
	switch p_faction {
		case "US":
			my_sprite = spr_Tank_A1; 
			my_turret = spr_Tank_A1_Turret;
			my_icon   = spr_Tank_A1_Icon;
			break;
		case "RU":
			my_sprite = spr_Tank_B1; 
			my_turret = spr_Tank_B1_Turret;
			my_icon   = spr_Tank_B1_Icon;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one = false;
		rot_adj = 270; 
		txt_rot = 180;
		switch p_faction {
			case "US":
				my_sprite = spr_Tank_A2; 
				my_turret = spr_Tank_A2_Turret;
				my_icon   = spr_Tank_A2_Icon;
				break;
			case "RU":
				my_sprite = spr_Tank_B2; 
				my_turret = spr_Tank_B2_Turret;
				my_icon   = spr_Tank_B2_Icon;
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
shoot_mask.kind = 1;
shoot_mask.my_unit = id;

mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);

unit_type = "TANK";
view_radius = global.cell_size*6;

my_speed = 3.6;
fuel_count = 100;

start_ap = 12;
start_mp = 12;
action_points = 0;
move_points = 0;
//ap_cost = 2;
mp_cost = 2;

action_range = global.cell_size*8;

cannon_ammo = 12;
cannon_max = 12;
shoot_cannon = false;
cannon_rate = 1;
cannon_cost = 4;

mg_ammo = 100;
mg_max = 100;
shoot_mg = false;
mg_rate = 4;
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

ds_list_add(global.unit_list, id);//Add self to total unit list
ds_list_add(global.myunit_list, id);//Add self to my unit list
ds_list_add(global.tank_list, id);

fire_menu[0] = "Cannon";
fire_menu[1] = "Heavy MG";
fire_menu[2] = "Cancel";

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);
audio_emitter_position(emit, x, y, 0);
audio_play_sound_on(emit, snd_TankHatch, false, 1);

with obj_Trees  { if !discovered { scr_DiscoveryCheck(); } }
with obj_Houses { if !discovered { scr_DiscoveryCheck(); } }

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
part_type_direction(part1, 220, 280, 0, 2);
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
part_type_direction(part2,200,300,0,2);
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
part_type_direction(part3, 220, 280, 0, 2);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_life(part3, 100, 120);

if PLAYER.net_status != "NONE" { alarm[10] = 2; }

