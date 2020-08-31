event_inherited();
view_range = 0;
view_radius = global.cell_size*view_range;
light_size = 0;
light_strength = 0;

s = 60;
a = 0;
timer_start = false;

flare_timer = global.tick_rate*16;

fade_out = false;

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 0.75);
audio_emitter_position(emit, x, y, 0);

