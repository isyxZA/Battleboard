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

//Particles Setup
particle_ship0 = part_system_create();
part_system_depth(particle_ship0, 2);
ship0_emitter = part_emitter_create(particle_ship0);

//Foam particle
part1 = part_type_create();
part_type_sprite(part1, spr_Wake_1, true, true, false);
part_type_size(part1, 0.5, 0.5, 0.003, 0.002);
part_type_scale(part1, 1, 1);
part_type_alpha3(part1,0,0.2,0);
part_type_speed(part1, 0.4, 0.6, 0, 0.02);
if p_one == true { part_type_direction(part1, 260, 280, 0, 1); }
	else { part_type_direction(part1, 85, 95, 0, 1); }
part_type_orientation(part1, 0, 359, 0, 0, true);
part_type_life(part1, 60, 300);