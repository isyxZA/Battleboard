image_speed = 1.25;
explode = false;
countdown = 3;
can_damage = true;
timer_start = true;
light_size = 0;
light_strength = 1;
damage_1 = 25;
damage_2 = 50;
damage_3 = 100;
play_effect = true;
fow1_scale = 0.5;
emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 0.75);
audio_emitter_position(emit, x, y, 0);


