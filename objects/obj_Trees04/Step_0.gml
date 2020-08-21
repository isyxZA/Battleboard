if discovered == true {
    if can_light == true {
        if light_strength < light_target  { light_strength = lerp(light_strength, light_target , 0.025); }
    }
    if can_draw == true {
        if (alpha_count < alpha_duration) {
            alpha_count ++;
            my_alpha = ease_in_quint(alpha_count, 0, 1, alpha_duration);
        }
        
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

}

