ss = choose(snd_scape01,snd_scape02,snd_scape03,snd_scape04,snd_scape05,snd_scape06,snd_scape07,snd_scape08,snd_scape09,snd_scape10);
if room == rm_ALPHA || room == rm_BRAVO { 
    var ex = obj_CAMERA.x+round(random_range(-1800, 1800));
    var ey = obj_CAMERA.y+round(random_range(-800, -1800));
    audio_emitter_position(emit, ex, ey, 0);
    audio_play_sound_on(emit, ss, false, 10);
    alarm[3] = random_range(100,1000); 
}
    else if (room == rm_Setup) || (room == rm_Options) || (room == rm_Pause) { 
        audio_play_sound(ss, 1, false);
        alarm[3] = random_range(800,1200); 
    }
        else if room == rm_MainMenu {
            if main_start == true {
                audio_play_sound(choose(snd_scape09, snd_scape10), 1, false);
            }
                else { audio_play_sound(ss, 1, false); }
            alarm[3] = random_range(60,600); 
        }

