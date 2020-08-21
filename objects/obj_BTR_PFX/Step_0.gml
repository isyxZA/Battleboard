if keyboard_check_pressed(ord("4")) { explode_he1 = true; he_x = mouse_x; he_y = mouse_y; }
if keyboard_check_pressed(ord("5")) { explode_ap1 = true; ap_x = mouse_x; ap_y = mouse_y; }

//HE effect emitter
if explode_he1 == true {
    explode_he1 = false;
	if burst_trigger == false { burst_trigger = true; alarm[0] = 12; }
		else if burst_trigger1 == false { burst_trigger1 = true; alarm[3] = 12; }
	audio_emitter_position(emit, he_x-16, he_y+24, 0);
	audio_play_sound_on(emit, snd_Explosion08, false, 10);
    part_emitter_region(particle_btr0, explosion0_emitter, he_x-16, he_x-16, he_y+24, he_y+24, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_btr0, explosion0_emitter, part1, 1);
	//Line
    part_emitter_burst(particle_btr0, explosion0_emitter, part2, 12);
    part_emitter_region(particle_btr1, explosion1_emitter, he_x-16, he_x-16, he_y+24, he_y+24, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_btr1, explosion1_emitter, part3, 10);
	//Shrapnel
    part_emitter_burst(particle_btr1, explosion1_emitter, part4, 6);
}

if burst_he1 == true {
	burst_he1 = false;
	audio_emitter_position(emit, he_x+24, he_y+24, 0);
	audio_play_sound_on(emit, snd_Explosion08, false, 10);
	part_emitter_region(particle_btr0, explosion0_emitter, he_x+24, he_x+24, he_y+24, he_y+24, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_btr0, explosion0_emitter, part1, 1);
	//Line
    part_emitter_burst(particle_btr0, explosion0_emitter, part2, 12);
    part_emitter_region(particle_btr1, explosion1_emitter, he_x+24, he_x+24, he_y+24, he_y+24, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_btr1, explosion1_emitter, part3, 10);
	//Shrapnel
    part_emitter_burst(particle_btr1, explosion1_emitter, part4, 6);
}
if burst_he2 == true {
	burst_he2 = false;
	audio_emitter_position(emit, he_x+12, he_y-24, 0);
	audio_play_sound_on(emit, snd_Explosion08, false, 10);
	part_emitter_region(particle_btr0, explosion0_emitter, he_x+12, he_x+12, he_y-24, he_y-24, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_btr0, explosion0_emitter, part1, 1);
	//Line
    part_emitter_burst(particle_btr0, explosion0_emitter, part2, 12);
    part_emitter_region(particle_btr1, explosion1_emitter, he_x+12, he_x+12, he_y-24, he_y-24, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_btr1, explosion1_emitter, part3, 10);
	//Shrapnel
    part_emitter_burst(particle_btr1, explosion1_emitter, part4, 6);
}
if burst_he3 == true {
	burst_he3 = false;
	burst_trigger = false;
	audio_emitter_position(emit, he_x-14, he_y-24, 0);
	audio_play_sound_on(emit, snd_Explosion08, false, 10);
	part_emitter_region(particle_btr0, explosion0_emitter, he_x-14, he_x-14, he_y-24, he_y-24, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_btr0, explosion0_emitter, part1, 1);
	//Line
    part_emitter_burst(particle_btr0, explosion0_emitter, part2, 12);
    part_emitter_region(particle_btr1, explosion1_emitter, he_x-14, he_x-14, he_y-24, he_y-24, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_btr1, explosion1_emitter, part3, 10);
	//Shrapnel
    part_emitter_burst(particle_btr1, explosion1_emitter, part4, 6);
}
if burst_he1a == true {
	burst_he1a = false;
	audio_emitter_position(emit, he_x+24, he_y+24, 0);
	audio_play_sound_on(emit, snd_Explosion08, false, 10);
	part_emitter_region(particle_btr0, explosion0_emitter, he_x+24, he_x+24, he_y+24, he_y+24, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_btr0, explosion0_emitter, part1, 1);
	//Line
    part_emitter_burst(particle_btr0, explosion0_emitter, part2, 12);
    part_emitter_region(particle_btr1, explosion1_emitter, he_x+24, he_x+24, he_y+24, he_y+24, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_btr1, explosion1_emitter, part3, 10);
	//Shrapnel
    part_emitter_burst(particle_btr1, explosion1_emitter, part4, 6);
}
if burst_he2a == true {
	burst_he2a = false;
	audio_emitter_position(emit, he_x+12, he_y-24, 0);
	audio_play_sound_on(emit, snd_Explosion08, false, 10);
	part_emitter_region(particle_btr0, explosion0_emitter, he_x+12, he_x+12, he_y-24, he_y-24, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_btr0, explosion0_emitter, part1, 1);
	//Line
    part_emitter_burst(particle_btr0, explosion0_emitter, part2, 12);
    part_emitter_region(particle_btr1, explosion1_emitter, he_x+12, he_x+12, he_y-24, he_y-24, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_btr1, explosion1_emitter, part3, 10);
	//Shrapnel
    part_emitter_burst(particle_btr1, explosion1_emitter, part4, 6);
}
if burst_he3a == true {
	burst_he3a = false;
	burst_trigger1 = false;
	audio_emitter_position(emit, he_x-14, he_y-24, 0);
	audio_play_sound_on(emit, snd_Explosion08, false, 10);
	part_emitter_region(particle_btr0, explosion0_emitter, he_x-14, he_x-14, he_y-24, he_y-24, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_btr0, explosion0_emitter, part1, 1);
	//Line
    part_emitter_burst(particle_btr0, explosion0_emitter, part2, 12);
    part_emitter_region(particle_btr1, explosion1_emitter, he_x-14, he_x-14, he_y-24, he_y-24, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_btr1, explosion1_emitter, part3, 10);
	//Shrapnel
    part_emitter_burst(particle_btr1, explosion1_emitter, part4, 6);
}

//AP effect emitter
if explode_ap1 == true {
    explode_ap1 = false;
    part_emitter_region(particle_btr0, explosion0_emitter, ap_x, ap_x, ap_y, ap_y, ps_shape_ellipse, ps_distr_gaussian);
	//Fireball
    part_emitter_burst(particle_btr0, explosion0_emitter, part5, 1);
	//Line
    part_emitter_burst(particle_btr0, explosion0_emitter, part6, 4);
    part_emitter_region(particle_btr1, explosion1_emitter, ap_x, ap_x, ap_y, ap_y, ps_shape_ellipse, ps_distr_invgaussian);
	//Smoke
    part_emitter_burst(particle_btr1, explosion1_emitter, part7, 6);
	//Shrapnel
    part_emitter_burst(particle_btr1, explosion1_emitter, part8, 24);
}








