event_inherited();
path_delete(my_path);

var p_faction = PLAYER.faction;
if PLAYER.player == "ONE" { 
	p_one = true;
	rot = 0; 
	txt_rot = rot;
	v_spacing = 78;
	switch p_faction {
		case "US":
			u_sprite = spr_BTR_A1_Icon;
			break;
		case "RU":
			u_sprite = spr_BTR_B1_Icon;
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
				u_sprite = spr_BTR_A2_Icon;
				break;
			case "RU":
				u_sprite = spr_BTR_B2_Icon;
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
my_unit = obj_BTR_Unit;
ship_type = "BTR";

unit_list[| 0] = u_sprite;
unit_list[| 1] = u_sprite;
unit_list[| 2] = u_sprite;

xscale = 0.8;
yscale = 0.8;
s = random_range(0.7,1);

uni_time = shader_get_uniform(shd_ripple,"time");
var_time_var = 0;
uni_pos = shader_get_uniform(shd_ripple,"pos");
var_pos_x = 0;
var_pos_y = 0;
uni_resolution = shader_get_uniform(shd_ripple,"resolution");
var_resolution_x = 1920;
var_resolution_y = 1080;
uni_wave_amount = shader_get_uniform(shd_ripple,"wave_amount");
var_wave_amount = 24; //higher = more waves
uni_wave_distortion = shader_get_uniform(shd_ripple,"wave_distortion");
var_wave_distortion = 700; //higher = less distortion
uni_wave_speed = shader_get_uniform(shd_ripple,"wave_speed");
var_wave_speed = 0.6; //higher = faster

alarm[1] = 300;


