my_path = -1;
rot = 0;
light_size = 0;
light_strength = 0;
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
			my_shadow  = spr_C130_Shadow;
			break;
		case "RU":
			my_sprite  = spr_IL76;
			my_shadow  = spr_IL76_Shadow;
			break;
	}
}
	else if p_side == "TWO" { 
		p_one = false;
		switch p_faction {
			case "US":
				my_sprite  = spr_C130;
				my_shadow  = spr_C130_Shadow;
				break;
			case "RU":
				my_sprite  = spr_IL76;
				my_shadow  = spr_IL76_Shadow;
				break;
		}
	}

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);





