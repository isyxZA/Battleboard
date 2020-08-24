event_inherited();
path_delete(my_path);

if PLAYER.player == "ONE" { 
	p_one = true;
	rot = 0;  
	txt_rot = rot;
}
	else if PLAYER.player == "TWO" {
		p_one = false;
		rot = 180;
		txt_rot = rot;
	}

unit_type = "LANDINGCRAFT";

can_move = true;
unit_list = ds_list_create();
view_radius = global.cell_size*8;
action_range = view_radius;
unit_drag = false;
can_place = false;
depleted = false;
supply_display = false;
ship_type = "Supply";

start_ap = 10;
action_points = 0;
ap_cost = 2;

parts_ammo = 500;
shoot_parts = false;
parts_rate = 10;

ammunition_ammo = 500;
shoot_ammunition = false;
ammunition_rate = 10;

//Logi
ammo_supply_rate = 10;
building_supply_rate = 10;
//Depot
depotammo_supply_rate = 10;
depotparts_supply_rate = 10;

resupply_unit = noone;

mx = x;
my = y;

if global.game_turn == 0 {
    my_unit = -1;
	if PLAYER.player == "ONE" { v_spacing = 60; }
		else if PLAYER.player == "TWO" { v_spacing = -60; }
}
    else {
		var p_faction = PLAYER.faction;
        my_unit = obj_Logi_Unit;
		if PLAYER.player == "ONE" { 
			switch p_faction {
				case "US":
					u_sprite = spr_Logi_A1;
					break;
				case "RU":
					u_sprite = spr_Logi_B1;
					break;
			}
			v_spacing = 82; 
		}
			else if PLAYER.player == "TWO" { 
				switch p_faction {
					case "US":
						u_sprite = spr_Logi_A2;
						break;
					case "RU":
						u_sprite = spr_Logi_B2;
						break;
				} 
				v_spacing = -82; 
			}
        unit_list[| 0] = u_sprite;
        unit_list[| 1] = u_sprite;
    }

s = random_range(0.5,0.7);
xscale = 0.8;
yscale = 0.8;

emit = audio_emitter_create();
audio_emitter_falloff(emit, 100, 1000, 2);
audio_emitter_position(emit, x, y, 0);
audio_play_sound_on(emit, snd_IdleShip01, true, 1);

alarm[1] = 300;


