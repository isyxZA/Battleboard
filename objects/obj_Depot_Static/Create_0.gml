event_inherited();

my_grid = global.inf_move_grid;

var p_side = PLAYER.player;
p_faction  = PLAYER.faction;

if p_side == "ONE" { 
	p_one = true;
	rot = 0; 
	rot_adj = 90; 
	txt_rot = 0;
}
	else if p_side == "TWO" { 
		p_one = false;
		rot = 180; 
		rot_adj = 270; 
		txt_rot = 180;
	}
crater_index = spr_Static_Crater;
spawn_unit = -1;
my_inf = obj_INFA_Unit.my_sprite;
my_mask = obj_INFA_Unit.my_mask;
my_sprite = spr_Depot_00;
mp_cost = 2;
var t = instance_place(x, y, obj_Game_Tile);
t.occupied = true;
t.move_rating = mp_cost;
occupy_switch = true;
my_tile   = t.id;
my_tile_x = t.tile_x;
my_tile_y = t.tile_y;
view_radius = (global.cell_size*4)+(t.height_rating*global.cell_size);
size_target = (4+t.height_rating)*1.5;//Light radius target size
x = my_tile_x;
y = my_tile_y;

shoot_mask = instance_create_layer(x, y, "Units", obj_Cant_Shoot);

x_end = x;
y_end = y;
x_final = x;
y_final = y;
target_x = x;
target_y = y;
diag = true;

unit_type = "DEPOT";
label = "Depot";
view_radius = global.cell_size*4;

my_speed = 0.75;

start_ap = 10;
start_mp = 10;
action_points = 0;
move_points = 0;
ap_cost = 2;

action_range = 288;

parts_ammo = 0;
parts_max = 200;
shoot_parts = false;
parts_rate = 20;

ammunition_ammo = 0;
ammunition_max = 200;
shoot_ammunition = false;
ammunition_rate = 20;

//Infantry
rfl_supply_rate = 20;
rpg_supply_rate = 1;
flr_supply_rate = 1;
//Tank
mbtap_supply_rate = 1;
mbtmg_supply_rate = 20;
//LAV
lavhe_supply_rate = 4;
lavap_supply_rate = 4;
lavmg_supply_rate = 20;
lavat_supply_rate = 1;
//LAC
lacdpt_supply_rate = 10;
lacrpr_supply_rate = 10;
lactow_supply_rate = 10;
lacmtr_supply_rate = 10;
lactow2_supply_rate = 1;
//Logi
logiamo_supply_rate = 10;
logibld_supply_rate = 10;
//Depot
depotamo_supply_rate = 10;
depotbld_supply_rate = 10;
//Repair
repairS_supply_rate = 10;
repairmg_supply_rate = 20;
//TOW
towS_supply_rate = 1;
//MORTAR
mortarS_supply_rate = 4;

rifle_ammo = 0;
rpg_ammo = 0;
flare_ammo = 0;

build_pos = 0;

can_be_manned = false;
is_manned = false;
can_be_selected = true;

ds_list_add(global.unit_list, id);//Add self to total unit list
ds_list_add(global.myunit_list, id);//Add self to my unit list
ds_list_add(global.depot_list, id);

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);
audio_emitter_position(emit, x, y, 0);

//Particles Setup
particle_dep0 = part_system_create();
particle_dep1 = part_system_create();
part_system_depth(particle_dep0, -5);
part_system_depth(particle_dep1, -7);
dep0_emitter = part_emitter_create(particle_dep0);
dep1_emitter = part_emitter_create(particle_dep1);

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