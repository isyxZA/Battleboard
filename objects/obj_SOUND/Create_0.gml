//audio_falloff_set_model(audio_falloff_linear_distance);
audio_falloff_set_model(audio_falloff_linear_distance);

audio_group_load(Effects);
audio_group_load(Soundscape);
audio_group_load(Music);
audio_group_set_gain(Music, 0.5, 0);
audio_group_set_gain(Effects, global.effects_level, 0);
audio_master_gain(0);

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 0.75);

first_play = false;
main_start = true;
game_start = false;
fade_out = false;
fade_in = true;
menu_cue = false;

g = 0;
s = -1;
ss = -1;
l = 0;

alarm[3] = 40;


