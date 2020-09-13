switch room {
    case rm_MainMenu:  
        if main_start == true && first_play == false {
            first_play = true;
            s = snd_MainMenu_01;
            alarm[1] = 110;
        }
        break;
    case rm_TEST:
	case rm_Forest:
        if game_start == true {
            audio_play_sound(choose(snd_scape06, snd_scape07, snd_scape10), 10, false);
            s = snd_Drumbeat_Short_01;
            alarm[2] = 10;
            alarm[4] = random_range(1000, 2000);
        }
        break;
}

