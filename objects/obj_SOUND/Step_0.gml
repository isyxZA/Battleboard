if fade_out == true {
    if g>0.2 { g-=0.01; } else { fade_out = false; }
    audio_master_gain(g);
}
    else if fade_in == true {
        if g<1 { g+=0.01; } else { fade_in = false; }
        audio_master_gain(g);
    }
      
if menu_cue == true {
    menu_cue = false;
    audio_play_sound(snd_Gunshot01, 1, false); 
}



