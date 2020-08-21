var rs = choose(snd_radio_01, snd_radio_02, snd_radio_03, snd_radio_04, snd_radio_05);
audio_play_sound(rs, 0, false);
l = audio_sound_length(rs);
alarm[4] = (room_speed*l)*choose(2,3,4,6);

