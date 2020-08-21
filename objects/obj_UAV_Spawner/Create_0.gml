global.active_uav = true;
global.units_running += 1;
my_path = -1;
rot = 0;
light_size = 0;
light_strength = 0;
can_start = true;
view_radius = global.cell_size*6;
fow1_scale = 0.5;
fow2_scale = 0.125;
alarm[0] = 20;
alarm[1] = 200;

var p_side    = PLAYER.player;
var p_faction = PLAYER.faction;

if p_side == "ONE" { 
	p_one = true;
	switch p_faction {
		case "US":
			my_sprite  = spr_UAV;
			my_shadow  = spr_UAV_Shadow;
			break;
		case "RU":
			my_sprite  = spr_UAV_RU;
			my_shadow  = spr_UAV_RU_Shadow;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one = false;
		switch p_faction {
			case "US":
				my_sprite  = spr_UAV;
				my_shadow  = spr_UAV_Shadow;
				break;
			case "RU":
				my_sprite  = spr_UAV_RU;
				my_shadow  = spr_UAV_RU_Shadow;	
				break;
		}
	}

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);
audio_emitter_velocity(emit, path_speed, -path_speed, 0);
audio_play_sound_on(emit, snd_JetEngine01, true, 0);

uni_time = shader_get_uniform(shd_ripple,"time");
var_time_var = 0;
uni_pos = shader_get_uniform(shd_ripple,"pos");
var_pos_x = 0;
var_pos_y = 0;
uni_resolution = shader_get_uniform(shd_ripple,"resolution");
var_resolution_x = 1920;
var_resolution_y = 1080;
uni_wave_amount = shader_get_uniform(shd_ripple,"wave_amount");
var_wave_amount = 96; //higher = more waves
uni_wave_distortion = shader_get_uniform(shd_ripple,"wave_distortion");
var_wave_distortion = 500; //higher = less distortion
uni_wave_speed = shader_get_uniform(shd_ripple,"wave_speed");
var_wave_speed = 1; //higher = faster





