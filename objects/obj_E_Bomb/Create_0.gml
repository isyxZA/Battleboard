image_speed = 1.25;
explode = false;
countdown = 3;
damage = round(random_range(75, 100));
timer_start = true;
can_damage = true;
start_countdown = false;
light_size = 0;
light_strength = 0;
damage_1 = 50;
damage_2 = 80;
damage_3 = 100;
play_effect = true;

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 0.75);
audio_emitter_position(emit, x, y, 0);


