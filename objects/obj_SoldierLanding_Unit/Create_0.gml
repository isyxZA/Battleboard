event_inherited();
path_delete(my_path);

size_target = 14;

if PLAYER.player == "ONE" { 
	p_one = true;
	rot = 0; 
	txt_rot = rot;
	v_spacing = 44; 
}
	else if PLAYER.player == "TWO" { 
		p_one = false;
		rot = 180; 
		txt_rot = rot;
		v_spacing = -44; 
	}

unit_type = "LANDINGCRAFT";
can_move = true;
unit_list = ds_list_create();
view_radius = global.cell_size*8;
unit_drag = false;
can_place = false;
depleted = false;
mx = 0;
my = 0;
ship_type = "Infantry";

if global.game_turn == 0 {
    my_unit = -1;
}
    else {
		var p_faction = PLAYER.faction;
		if PLAYER.player == "ONE" { 
			switch p_faction {
				case "US":
					u_sprite = spr_Infantry_A1;
					break;
				case "RU":
					u_sprite = spr_Infantry_B1;
					break;
			}
		}
			else if PLAYER.player == "TWO" { 
				switch p_faction {
					case "US":
						u_sprite = spr_Infantry_A2;
						break;
					case "RU":
						u_sprite = spr_Infantry_B2;
						break;
				} 
			}
        my_unit = obj_Soldier_Unit;
        unit_list[| 0] = u_sprite;
        unit_list[| 1] = u_sprite;
        unit_list[| 2] = u_sprite;
        unit_list[| 3] = u_sprite;
        unit_list[| 4] = u_sprite;
        unit_list[| 5] = u_sprite;
    }


xscale = 0.8;
yscale = 0.8;
s = random_range(0.4,0.6);

emit = audio_emitter_create();;
audio_emitter_falloff(emit, 200, 2000, 2);
audio_emitter_position(emit, x, y, 0);

alarm[1] = 300;


