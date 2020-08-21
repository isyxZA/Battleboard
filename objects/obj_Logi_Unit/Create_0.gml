event_inherited();

var p_side    = PLAYER.player;
var p_faction = PLAYER.faction;

if p_side == "ONE" { 
	p_one   = true;
	rot_adj = 90;
	txt_rot = 0;
	switch p_faction {
		case "US":
			my_sprite = spr_Logi_A1;
			break;
		case "RU":
			my_sprite = spr_Logi_B1;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one   = false;
		rot_adj = 270;
		txt_rot = 180;
		switch p_faction {
			case "US":
				my_sprite = spr_Logi_A2;
				break;
			case "RU":
				my_sprite = spr_Logi_B2;
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

mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);

unit_type = "LOGI";
view_radius = global.cell_size*5;

my_speed = 3.9;

start_ap = 12;
start_mp = 12;
action_points = 0;
move_points = 0;
ap_cost = 4;
mp_cost = 2;

action_range = 136;

ammo_supply = 50;
ammo_max = 100;
shoot_ammo = false;
ammo_rate = 10;

building_supply = 50;
building_max = 100;
shoot_building = false;
building_rate = 10;

//Infantry
rifle_supply_rate = 20;
rpg_supply_rate = 1;
flare_supply_rate = 1;
//Tank
cannon_supply_rate = 1;
mg_supply_rate = 20;
//BTR
he_supply_rate = 4;
ap_supply_rate = 4;
//Engineer
depot_supply_rate = 10;
repair_supply_rate = 10;
tow_supply_rate = 10;
mortar_supply_rate = 10;
//Logi
ammo_supply_rate = 10;
building_supply_rate = 10;
//Depot
depotammo_supply_rate = 10;
depotparts_supply_rate = 10;
//Repair
repairS_supply_rate = 10;
repairmg_supply_rate = 20;
//TOW
towS_supply_rate = 1;
//MORTAR
mortarS_supply_rate = 4;

resupply_unit = noone;

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

ds_list_add(global.unit_list, id);//Add self to total unit list
ds_list_add(global.myunit_list, id);//Add self to my unit list
ds_list_add(global.logi_list, id);

fire_menu[0] = "Ammo";
fire_menu[1] = "Supply";
fire_menu[1] = "Cancel";

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);
audio_emitter_position(emit, x, y, 0);
audio_play_sound_on(emit, snd_DoorClose_02, false, 1);

with obj_Trees  { if !discovered { scr_DiscoveryCheck(); } }
with obj_Houses { if !discovered { scr_DiscoveryCheck(); } }

//Particles Setup
particle_logi0 = part_system_create();
particle_logi1 = part_system_create();
part_system_depth(particle_logi0, -5);
part_system_depth(particle_logi1, -7);
logi0_emitter = part_emitter_create(particle_logi0);
logi1_emitter = part_emitter_create(particle_logi1);

//Smoke particle
part1 = part_type_create();
part_type_sprite(part1, spr_Smoke_3, true, true, false);
part_type_size(part1, 0.4, 0.4, 0.03, 0.01);
part_type_scale(part1, 0.1, 0.1);
part_type_speed(part1, .2, .3, -0.0025, 0.01);
part_type_direction(part1, 220, 280, 0, 2);
part_type_orientation(part1, 0, 359, 0, 0, true);
part_type_life(part1, 180, 200);

//Pixel particle
part2 = part_type_create();
//how it looks
part_type_sprite(part2, spr_Pixel, false, true, false);
part_type_size(part2, 0.5,0.5,0.05,0.01);
part_type_orientation(part2,0,359,0,0,true);
part_type_color3(part2,c_red,c_orange,c_silver);
part_type_alpha2(part2,1,0);
//how it moves
part_type_direction(part2,180,0,0,2);
part_type_speed(part2,1,1.5,-0.01,0);
part_type_blend(part2, true);
//how long it lasts
part_type_life(part2,30,45);

//Flame particle
part3 = part_type_create();
part_type_sprite(part3, spr_Fireball_01, false, false, true);
part_type_size(part3, 0.5, 0.5, 0.01, 0.02);
part_type_scale(part3, 0.5, 0.5);
part_type_alpha2(part3,0.4,0);
part_type_speed(part3, .3, .4, -0.002, 0);
part_type_direction(part3, 180, 0, 0, 2);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_life(part3, 100, 140);

if PLAYER.net_status != "NONE" { alarm[10] = 2; }