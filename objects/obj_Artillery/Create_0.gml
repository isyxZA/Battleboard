image_speed = 1.25;
explode = false;
countdown = 3;
can_damage = true;
can_draw =true;
timer_start = true;
light_size = 0;
light_strength = 1;
damage_1 = 50;
damage_2 = 75;
damage_3 = 100;
play_effect = true;
fow1_scale = 0.5;
crater_index = spr_Crater;
if PLAYER.player == "ONE" { p_one = true; rot = 0; }
	else { p_one = false; rot = 180; }
emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 4000, 0.75);
audio_emitter_position(emit, x, y, 0);
global.artillery_count += 1;



