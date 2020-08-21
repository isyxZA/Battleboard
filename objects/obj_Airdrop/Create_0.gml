global.active_airdrop = true;
img = 0;
explode = false;
countdown = 3;
timer_start = true;
start_countdown = false;
target_depot = noone;
play_effect = true;
if PLAYER.player == "ONE" { p_one = true; rot = 0; }
	else { p_one = false; rot = 180; }
emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 0.75);
audio_emitter_position(emit, x, y, 0);


