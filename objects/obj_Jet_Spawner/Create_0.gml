my_path = -1;
rot = 0;
light_size = 0;
light_strength = 0;
can_start = false;
can_draw = false;
can_afterburn = true;
view_radius = global.cell_size;
fow1_scale = 0.5;
fow2_scale = 0.125;
img = 0;
alarm[3] = 4;

var p_side    = PLAYER.player;
var p_faction = PLAYER.faction;

if p_side == "ONE" { 
	p_one = true;
	rot_adj = 180;
	switch p_faction {
		case "US":
			my_sprite  = spr_F18;
			my_shadow  = spr_F18_Shadow;
			my_exhaust = spr_F18_Exhaust;
			break;
		case "RU":
			my_sprite  = spr_MiG29;
			my_shadow  = spr_MiG29_Shadow;
			my_exhaust = spr_MiG29_Exhaust;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one = false;
		rot_adj = 180; 
		switch p_faction {
			case "US":
				my_sprite  = spr_F18;
				my_shadow  = spr_F18_Shadow;
				my_exhaust = spr_F18_Exhaust;
				break;
			case "RU":
				my_sprite  = spr_MiG29;
				my_shadow  = spr_MiG29_Shadow;
				my_exhaust = spr_MiG29_Exhaust;
				break;
		}
	}

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 1000, 1);

uni_time = shader_get_uniform(shd_ripple,"time");
var_time_var = 0;
uni_pos = shader_get_uniform(shd_ripple,"pos");
var_pos_x = 0;
var_pos_y = 0;
uni_resolution = shader_get_uniform(shd_ripple,"resolution");
var_resolution_x = 1920;
var_resolution_y = 1080;
uni_wave_amount = shader_get_uniform(shd_ripple,"wave_amount");
var_wave_amount = 32; //higher = more waves
uni_wave_distortion = shader_get_uniform(shd_ripple,"wave_distortion");
var_wave_distortion = 400; //higher = less distortion
uni_wave_speed = shader_get_uniform(shd_ripple,"wave_speed");
var_wave_speed = 0.6; //higher = faster





