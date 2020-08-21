if discovered == true {
    if can_light == true {
        if light_strength < light_target  { light_strength = lerp(light_strength, light_target , 0.025); }
    }
    if can_draw == true {
        if (alpha_count < alpha_duration) {
            alpha_count ++;
            my_alpha = ease_in_quint(alpha_count, 0, 1, alpha_duration);
        }
    }
}

