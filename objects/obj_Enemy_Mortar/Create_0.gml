event_inherited();

if PLAYER.player == "ONE" { 
	p_one = true;
	rot = 180; 
	rot_adj = 270; 
	txt_rot = 0;
	fmin = 225;
	fmax = 315;
}
	else if PLAYER.player == "TWO" { 
		p_one = false;
		rot = 0; 
		rot_adj = 90; 
		txt_rot = 180;
		fmin = 45;
		fmax = 135;
	}

my_inf = obj_Enemy_INFA.my_sprite;
crater_index = spr_Static_Crater;
mp_cost = 2;
var t = instance_place(x, y, obj_Game_Tile);
my_tile = t.id;
t.occupied = true; 
t.move_rating = mp_cost;
my_tile_x = t.tile_x;
my_tile_y = t.tile_y;
x = my_tile_x;
y = my_tile_y;

shoot_mask = instance_create_layer(x, y, "Units", obj_Cant_Shoot);
shoot_mask.my_unit = id;

x_end = x;
y_end = y;
x_final = x;
y_final = y;
target_x = x;
target_y = y;
diag = true;

unit_type = "E_MORTAR";
view_radius = global.cell_size*4;

my_speed = 0.75;

start_ap = 10;
action_points = 0;
ap_cost = 2;

action_range = 1440;

mortar_ammo = 0;
mortar_max = 100;
shoot_mortar = false;
mortar_shot = 0;
mortar_rate = 4;

rifle_ammo = 0;
rpg_ammo = 0;
flare_ammo = 0;

build_pos = 0;

can_be_manned = false;
is_manned = false;
can_be_selected = false;

ds_list_add(global.unit_list, id);//Add self to unit list
ds_list_add(global.enemyunit_list, id);//Add self to enemy unit list

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 2);
audio_emitter_position(emit, x, y, 0);

if PLAYER.net_status == "NONE" {
	nav_grid  = global.inf_move_grid;
	
}
	else {
		nav_grid  = global.net_move_grid;
	}

