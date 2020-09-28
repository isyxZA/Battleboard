image_speed = 1.5;
fuse = 0;
explode = false;
countdown = 2;
damage = round(random_range(75, 100));
timer_start = true;
can_damage = true;
can_draw = true;
start_countdown = false;
light_size = 0;
light_strength = 1;
damage_1 = 50;
damage_2 = 80;
damage_3 = 100;
play_effect = true;
fow1_scale = 0.5;
crater_index = spr_Crater;

if PLAYER.player == "ONE" { p_one = true; rot = 0; }
	else { p_one = false; rot = 180; }

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 4000, 0.75);
audio_emitter_position(emit, x, y, 0);


