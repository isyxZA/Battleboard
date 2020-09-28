my_path = -1;
rot = 0;
light_size = 1.05;
light_strength = 1;
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
			my_exhaust = spr_F18_Exhaust;
			break;
		case "RU":
			my_sprite  = spr_MiG29;
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
				my_exhaust = spr_F18_Exhaust;
				break;
			case "RU":
				my_sprite  = spr_MiG29;
				my_exhaust = spr_MiG29_Exhaust;
				break;
		}
	}

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 1000, 1);





