if can_draw == true {
    if fade_in == true {
        xscl = ease_inout_sine(anim_count, xscl_start, xscl_change, anim_duration);
        yscl = ease_inout_sine(anim_count, yscl_start, -yscl_change, anim_duration);
    } 
        else {
            xscl = ease_inout_sine(anim_count, xscl_start, -xscl_change, anim_duration);
            yscl = ease_inout_sine(anim_count, yscl_start, yscl_change, anim_duration);
        }
            
    anim_count++;
        
    if (anim_count > anim_duration) {
        anim_count = 0;
        xscl_start = xscl;
        yscl_start = yscl;
        if fade_in  == true { fade_in = false; } 
            else { fade_in = true; }
    }
}

