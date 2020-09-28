my_path = -1;
rot = 0;
can_start = true;

var p_faction = PLAYER.opponent_faction;
switch p_faction {
	case "US":
		my_sprite  = spr_Bomber_B2;
		break;
	case "RU":
		my_sprite  = spr_Bomber_TU22;
		break;
}

var p_side = PLAYER.player;
if p_side == "ONE" { p_one = true; }
	else { p_one = false; }

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);





