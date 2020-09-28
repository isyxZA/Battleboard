my_path = -1;
rot = 0;
can_start = true;

var p_side    = PLAYER.player;
var p_faction = PLAYER.opponent_faction;

if p_side == "ONE" { 
	p_one = true;
	switch p_faction {
		case "US":
			my_sprite  = spr_UAV;
			break;
		case "RU":
			my_sprite  = spr_UAV_RU;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one = false;
		switch p_faction {
			case "US":
				my_sprite  = spr_UAV;
				break;
			case "RU":
				my_sprite  = spr_UAV_RU;
				break;
		}
	}

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);
audio_emitter_velocity(emit, path_speed, -path_speed, 0);
audio_play_sound_on(emit, snd_JetEngine01, true, 0);





