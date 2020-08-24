event_inherited();
path_delete(my_path);

var p_faction = PLAYER.faction;
if PLAYER.player == "ONE" { 
	p_one = true;
	rot = 0; 
	txt_rot = rot;
	v_spacing = 64;
	switch p_faction {
		case "US":
			u_sprite = spr_Tank_A1_Icon;
			break;
		case "RU":
			u_sprite = spr_Tank_B1_Icon;
			break;
	}
}
	else if PLAYER.player == "TWO" {
		p_one = false;
		rot = 180; 
		txt_rot = rot;
		v_spacing = -64;
		switch p_faction {
			case "US":
				u_sprite = spr_Tank_A2_Icon;
				break;
			case "RU":
				u_sprite = spr_Tank_B2_Icon;
				break;
		} 
	}

unit_type = "LANDINGCRAFT";
y_to = 0;
can_move = true;
unit_list = ds_list_create();
view_radius = global.cell_size*8;
unit_drag = false;
can_place = false;
depleted = false;
mx = 0;
my = 0;
my_unit = obj_Tank_Unit;
ship_type = "Tank";

unit_list[| 0] = u_sprite;
unit_list[| 1] = u_sprite;
unit_list[| 2] = u_sprite;

xscale = 0.8;
yscale = 0.8;
s = random_range(0.7,1);

alarm[1] = 300;


