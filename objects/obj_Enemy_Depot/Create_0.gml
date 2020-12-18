event_inherited();

if PLAYER.player == "ONE" { 
	p_one = true;
	rot = 180; 
	rot_adj = 270; 
	txt_rot = 0;
}
	else if PLAYER.player == "TWO" { 
		p_one = false;
		rot = 0; 
		rot_adj = 90; 
		txt_rot = 180;
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

unit_type = "E_DEPOT";
view_radius = global.cell_size*4;

my_speed = 0.75;

start_ap = 10;
action_points = 0;
ap_cost = 2;

action_range = 288;

parts_ammo = 0;
parts_max = 100;
shoot_parts = false;
parts_rate = 20;

ammunition_ammo = 0;
ammunition_max = 100;
shoot_ammunition = false;
ammunition_rate = 20;

//Infantry
rfl_supply_rate = 20;
rpg_supply_rate = 1;
flr_supply_rate = 1;
//Tank
mbtap_supply_rate = 1;
mbtmg_supply_rate = 20;
//BTR
lavhe_supply_rate = 4;
lavap_supply_rate = 4;
//Engineer
lacdpt_supply_rate = 10;
lacrpr_supply_rate = 10;
lactow_supply_rate = 10;
lacmtr_supply_rate = 10;
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
can_be_selected = false;

ds_list_add(global.unit_list, id);//Add self to unit list
ds_list_add(global.enemyunit_list, id);//Add self to enemy unit list

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 2);
audio_emitter_position(emit, x, y, 0);

