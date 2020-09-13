audio_play_sound_on(emit, snd_Mortar01, false, 10);
mortar_shot += 1;
if mortar_shot >= 2 { mortar_shot = 0; }
	else { alarm[7] = 32; }
