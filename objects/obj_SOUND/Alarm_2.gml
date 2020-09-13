if global.victory == false && global.defeat == false {
    if room == rm_TEST || room == rm_Forest || room == rm_Options || room == rm_Pause {
        if game_start == true {
            game_start = false;
            audio_play_sound(s, 0, false);
            l = audio_sound_length(s);
            alarm[2] = (room_speed*l)*choose(4,6);
        }
            else {
                s = choose(snd_Drumbeat_Song, snd_Drumbeat_Song_01, snd_Drumbeat_Short_02,
                                snd_Drumbeat_Long_01, snd_Drumbeat_Long_02, snd_Drumbeat_Long_03, 
                                    snd_Drumbeat_British, snd_Drumbeat_Slavic, snd_Drumbeat_Japanese_01, snd_Drumbeat_Japanese_02,
                                        snd_Drumbeat_African_01, snd_Drumbeat_CivilWar_01);
                audio_play_sound(s, 0, false);
                l = audio_sound_length(s);
                if s == snd_Drumbeat_Song || s == snd_Drumbeat_Song_01 { alarm[2] = (room_speed*l)*choose(1.2,1.3,1.4); }
                    else { alarm[2] = (room_speed*l)*choose(2,3,4); }
            }
    }
}


