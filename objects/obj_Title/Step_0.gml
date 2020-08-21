if draw_0 == true {
	if anim_count < anim_timer { 
        s_width = ease_out_quad(anim_count, 0, s_target, anim_timer);
		a       = ease_out_quad(anim_count, 0, 1       , anim_timer);
        anim_count ++; 
    }
		else { draw_0 = false; }
	clamp(a,0,1);
	x_pos = x-(s_width*0.5);
}



