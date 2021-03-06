event_inherited();

my_grid = global.inf_move_grid;

var p_side = PLAYER.player;
p_faction  = PLAYER.faction;

if p_side == "ONE" { 
	p_one = true;
	rot_adj = 90;
	txt_rot = 0;
	switch p_faction {
		case "US":
			my_sprite = spr_Infantry_A1a;
			my_mask   = spr_Infantry_A1a_Mask;
			break;
		case "RU":
			my_sprite = spr_Infantry_B1a;
			my_mask   = spr_Infantry_B1a_Mask;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one = false;
		rot_adj = 270; 
		txt_rot = 180;
		switch p_faction {
			case "US":
				my_sprite = spr_Infantry_A2a;
				my_mask   = spr_Infantry_A2a_Mask;
				break;
			case "RU":
				my_sprite = spr_Infantry_B2a;
				my_mask   = spr_Infantry_B2a_Mask;
				break;
		}
	}

var t = instance_place(x, y, obj_Game_Tile);
t.occupied = true;
mp_cost   = t.move_rating;
my_tile   = t.tile_num;
my_tile_x = t.tile_x;
my_tile_y = t.tile_y;
view_radius = (global.cell_size*4)+(t.height_rating*global.cell_size);
size_target = (5+t.height_rating)*1.5;//Light radius target size
x = my_tile_x;
y = my_tile_y;

shoot_mask = instance_create_layer(x, y, "Units", obj_Cant_Shoot);
shoot_mask.kind = 1;
shoot_mask.my_unit = id;

unit_type = "INF_B";
label = "Reconnaissance";

my_speed = 3.5;

start_ap = 8;
start_mp = 8;
action_points = 0;
move_points = 0;
ap_cost = 2;

action_range = global.cell_size*6;

rifle_ammo = 100;
rifle_max = 100;
shoot_rifle = false;
rifle_rate = 4;

rpg_ammo = 2;
rpg_max = 2;
shoot_rpg = false;
rpg_rate = 1;

flare_ammo = 4;
flare_max = 4;
shoot_flare = false;
flare_rate = 1;

x_end = x;
y_end = y;
x_final = x;
y_final = y;
target_x = x;
target_y = y;
diag = true;

spawn_check = false;
can_man = true;
is_manning = false;
manned_unit = noone;

ds_list_add(global.unit_list, id);//Add self to total unit list
ds_list_add(global.myunit_list, id);//Add self to my unit list
ds_list_add(global.infb_list, id);

my_colour = c_white;

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);
audio_emitter_position(emit, x, y, 0);

mp_grid_add_rectangle(global.move_grid, x-36, y-36, x+36, y+36);

with obj_Trees  { if !discovered { scr_DiscoveryCheck(); } }
with obj_Houses { if !discovered { scr_DiscoveryCheck(); } }

if PLAYER.net_status != "NONE" { alarm[10] = 2; }
