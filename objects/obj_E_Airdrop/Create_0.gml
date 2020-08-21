image_speed = 1.25;
explode = false;
countdown = 3;
timer_start = true;
target_depot = noone;
play_effect = true;

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 0.75);
audio_emitter_position(emit, x, y, 0);



