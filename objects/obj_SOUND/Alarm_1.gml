if room == rm_MainMenu || room == rm_Credits {
    if main_start == true {
        main_start = false;
        audio_play_sound(s, 0, false);
        l = audio_sound_length(s);
        alarm[1] = (room_speed*l)*1.25;
    }
        else {
            s = choose(snd_MainMenu_01, snd_MainMenu_02);
            audio_play_sound(s, 0, false);
            l = audio_sound_length(s);
            alarm[1] = (room_speed*l)*1.25;
        }
}
    else if room == rm_Options {
        if global.temp_room == rm_MainMenu {
            s = choose(snd_MainMenu_01, snd_MainMenu_02);
            audio_play_sound(s, 0, false);
            l = audio_sound_length(s);
            alarm[1] = (room_speed*l)*1.25;
        }
    }

