my_path = -1;
rot = 0;
light_size = 0;
light_strength = 0;
size_target = 10;
can_start = true;
view_radius = global.cell_size*2;
fow1_scale = 0.5;
fow2_scale = 0.125;

var p_side    = PLAYER.player;
var p_faction = PLAYER.faction;

if p_side == "ONE" { 
	p_one = true;
	switch p_faction {
		case "US":
			my_sprite  = spr_C130;
			break;
		case "RU":
			my_sprite  = spr_IL76;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one = false;
		switch p_faction {
			case "US":
				my_sprite  = spr_C130;
				break;
			case "RU":
				my_sprite  = spr_IL76;
				break;
		}
	}

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);





