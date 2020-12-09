event_inherited();

var p_side = PLAYER.player;
p_faction  = PLAYER.faction;

if p_side == "ONE" { 
	p_one = true;
	rot = 0; 
	rot_adj = 90; 
	txt_rot = 0;
	fmin = 45;
	fmax = 135;
}
	else if p_side == "TWO" { 
		p_one = false;
		rot = 180; 
		rot_adj = 270; 
		txt_rot = 180;
		fmin = 225;
		fmax = 315;
	}
crater_index = spr_Static_Crater;
my_inf = obj_INFA_Unit.my_sprite;
my_sprite = spr_Mortar_00;
mp_cost = 2;
var t = instance_place(x, y, obj_Game_Tile);
t.occupied = true;
t.move_rating = mp_cost;
my_tile   = t.tile_num;
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

unit_type = "MORTAR";

my_speed = 0.75;

start_ap = 10;
start_mp = 10;
action_points = 0;
move_points = 0;
ap_cost = 2;

action_range = 1440;

mortar_ammo = 0;
mortar_max = 100;
mortar_shot = 0;
shoot_mortar = false;
mortar_rate = 4;

rifle_ammo = 0;
rpg_ammo = 0;
flare_ammo = 0;

build_pos = 0;

can_be_manned = false;
is_manned = false;
can_be_selected = true;

fire_menu[0] = "Mortar";
fire_menu[1] = "Cancel";

ds_list_add(global.unit_list, id);//Add self to total unit list
ds_list_add(global.myunit_list, id);//Add self to my unit list
ds_list_add(global.mortar_list, id);

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000,1.5);
audio_emitter_position(emit, x, y, 0);

//Particles Setup
particle_mort0 = part_system_create();
particle_mort1 = part_system_create();
part_system_depth(particle_mort0, -5);
part_system_depth(particle_mort1, -7);
mort0_emitter = part_emitter_create(particle_mort0);
mort1_emitter = part_emitter_create(particle_mort1);

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