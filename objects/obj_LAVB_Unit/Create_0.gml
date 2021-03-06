event_inherited();

my_grid = global.move_grid;

var p_side = PLAYER.player;
p_faction  = PLAYER.faction;

if p_side == "ONE" { 
	p_one   = true;
	rot_adj = 90;
	txt_rot = 0;
	switch p_faction {
		case "US":
			my_sprite = spr_BTR_A1a; 
			my_turret = spr_BTR_A1a_Turret;
			my_armor  = spr_BTR_A1a_Armor;
			my_turret_armor  = spr_BTR_A1a_Turret_Armor;
			my_icon   = spr_BTR_A1a_Icon;
			my_mask   = spr_BTR_A1a_Mask;
			crater_index = spr_BTR_Crater_US;
			label = "M1126 Stryker APC";
			break;
		case "RU":
			my_sprite = spr_BTR_B1a; 
			my_turret = spr_BTR_B1a_Turret;
			my_armor  = spr_BTR_B1a_Armor;
			my_turret_armor  = spr_BTR_B1a_Turret_Armor;
			my_icon   = spr_BTR_B1a_Icon;
			my_mask   = spr_BTR_B1a_Mask;
			crater_index = spr_BTR_Crater_RU;
			label = "BTR-80 APC";
			break;
	}
}
	else if p_side == "TWO" { 
		p_one   = false;
		rot_adj = 270; 
		txt_rot = 180;
		switch p_faction {
			case "US":
				my_sprite = spr_BTR_A2a; 
				my_turret = spr_BTR_A2a_Turret;
				my_armor  = spr_BTR_A2a_Armor;
				my_turret_armor  = spr_BTR_A2a_Turret_Armor;
				my_icon   = spr_BTR_A2a_Icon;
				my_mask   = spr_BTR_A2a_Mask;
				crater_index = spr_BTR_Crater_US;
				label = "M1126 Stryker APC";
				break;
			case "RU":
				my_sprite = spr_BTR_B2a; 
				my_turret = spr_BTR_B2a_Turret;
				my_armor  = spr_BTR_B2a_Armor;
				my_turret_armor  = spr_BTR_B2a_Turret_Armor;
				my_icon   = spr_BTR_B2a_Icon;
				my_mask   = spr_BTR_B2a_Mask;
				crater_index = spr_BTR_Crater_RU;
				label = "BTR-80 APC";
				break;
		}
	}

var t = instance_place(x, y, obj_Game_Tile);
t.occupied = true;
mp_cost   = t.move_rating;
my_tile   = t.tile_num;
my_tile_x = t.tile_x;
my_tile_y = t.tile_y;
view_radius = (global.cell_size*6)+(t.height_rating*global.cell_size);
size_target = (6+t.height_rating)*1.5;//Light radius target size
x = my_tile_x;
y = my_tile_y;

shoot_mask = instance_create_layer(x, y, "Units", obj_Cant_Shoot);
shoot_mask.kind = 1;
shoot_mask.my_unit = id;

mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);

unit_type = "LAV_B";

my_speed = 3.8;
fuel_count = 100;

start_ap = 12;
start_mp = 12;
action_points = 0;
move_points = 0;

action_range = global.cell_size*7;

he_ammo = 40;
he_max = 40;
shoot_he = false;
he_rate = 8;
he_cost = 4;

ap_ammo = 40;
ap_max = 40;
shoot_ap = false;
ap_rate = 8;
ap_cost = 4;

mg_ammo = 600;
mg_max = 600;
shoot_mg = false;
mg_rate = 12;
mg_cost = 2;

sqd_ammo  = 0;
sqd_max   = 4;
shoot_sqd = false;
sqd_rate  = 1;
sqd_cost  = 2;

sqd_unit    = "NOONE";
sqd_squad   = "NOONE";
sqd_ap      = 0;
sqd_health  = 0;
sqd_rflamo  = 0;
sqd_rpgamo  = 0;
sqd_flramo  = 0;
//Squads being transported
unit_list   = ds_list_create();
squad_list  = ds_list_create();
ap_list     = ds_list_create();
health_list = ds_list_create();
rflamo_list = ds_list_create();
rpgamo_list = ds_list_create();
flramo_list = ds_list_create();
add_squad = false;

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

ds_list_add(global.unit_list, id);//Add self to total unit list
ds_list_add(global.myunit_list, id);//Add self to my unit list
ds_list_add(global.lavb_list, id);

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);
audio_emitter_position(emit, x, y, 0);

with obj_Trees  { if !discovered { scr_DiscoveryCheck(); } }
with obj_Houses { if !discovered { scr_DiscoveryCheck(); } }

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

if PLAYER.net_status != "NONE" { alarm[10] = 2; }

