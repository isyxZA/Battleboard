event_inherited();
path_delete(my_path);

size_target = 14;

var p_faction = PLAYER.faction;
if PLAYER.player == "ONE" { 
	p_one = true;
	rot = 0; 
	txt_rot = rot;
	v_spacing = 78;
	switch p_faction {
		case "US":
			u_spriteA = spr_Engineer_A1;
			u_spriteB = spr_Engineer_A1a;
			break;
		case "RU":
			u_spriteA = spr_Engineer_B1;
			u_spriteB = spr_Engineer_A1a;
			break;
	}
}
	else if PLAYER.player == "TWO" {
		p_one = false;
		rot = 180; 
		txt_rot = rot;
		v_spacing = -78;
		switch p_faction {
			case "US":
				u_spriteA = spr_Engineer_A2;
				u_spriteB = spr_Engineer_A2a;
				break;
			case "RU":
				u_spriteA = spr_Engineer_B2;
				u_spriteB = spr_Engineer_B2a;
				break;
		} 
	}

unit_type = "LANDINGCRAFT";
y_to = 0;
can_move = true;
view_radius = global.cell_size*8;
unit_drag = false;
can_place = false;
depleted = false;
mx = 0;
my = 0;
my_unit = -1;
ship_type = "LAC";
unit_list = ds_list_create();

var i;
for (i=0; i<ds_list_size(global.temp_engineer); i+=1) {
	var v = ds_list_find_value(global.temp_engineer, i);
	switch v {
		case "LAC_A":
			unit_list[| i] = u_spriteA;
			break;
		case "LAC_B":
			unit_list[| i] = u_spriteB;
			break;
	}
}
ds_list_clear(global.temp_engineer);

xscale = 0.8;
yscale = 0.8;
s = random_range(0.7,1);

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