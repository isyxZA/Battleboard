global.active_uav = true;
global.units_running += 1;
my_path = -1;
rot = 0;
light_size = 0;
light_strength = 1;
size_target = 12;
can_start = true;
view_radius = global.cell_size*6;
fow1_scale = 0.5;
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





