if keyboard_check_pressed(ord("7")) { explode_mortar1 = true; mortar_x = mouse_x; mortar_y = mouse_y; }

//Mortar effect emitter
if explode_mortar1 == true {
    explode_mortar1 = false;
	if burst_trigger == false { burst_trigger = true; alarm[0] = 26; }
	audio_emitter_position(emit, mortar_x+16, mortar_y-16, 0);
    audio_play_sound_on(emit, snd_Explosion01, false, 10);
    part_emitter_region(particle_mortar0, explosion0_emitter, mortar_x+16, mortar_x+16, mortar_y-16, mortar_y-16, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(particle_mortar0, explosion0_emitter, part1, 1);
    part_emitter_burst(particle_mortar0, explosion0_emitter, part2, 8);
    part_emitter_region(particle_mortar1, explosion1_emitter, mortar_x+16, mortar_x+16, mortar_y-16, mortar_y-16, ps_shape_diamond, ps_distr_invgaussian);
    part_emitter_burst(particle_mortar1, explosion1_emitter, part3, 8);
    part_emitter_burst(particle_mortar1, explosion1_emitter, part4, 16);
}

if burst_1 == true {
    burst_1 = false;
	audio_emitter_position(emit, mortar_x-20, mortar_y, 0);
    audio_play_sound_on(emit, snd_Explosion01, false, 10);
    part_emitter_region(particle_mortar0, explosion0_emitter, mortar_x-20, mortar_x-20, mortar_y, mortar_y, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(particle_mortar0, explosion0_emitter, part1, 1);
    part_emitter_burst(particle_mortar0, explosion0_emitter, part2, 8);
    part_emitter_region(particle_mortar1, explosion1_emitter, mortar_x-20, mortar_x-20, mortar_y, mortar_y, ps_shape_diamond, ps_distr_invgaussian);
    part_emitter_burst(particle_mortar1, explosion1_emitter, part3, 8);
    part_emitter_burst(particle_mortar1, explosion1_emitter, part4, 16);
}
if burst_2 == true {
    burst_2 = false;
	burst_trigger = false;
	audio_emitter_position(emit, mortar_x+8, mortar_y+20, 0);
    audio_play_sound_on(emit, snd_Explosion01, false, 10);
    part_emitter_region(particle_mortar0, explosion0_emitter, mortar_x+8, mortar_x+8, mortar_y+20, mortar_y+20, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(particle_mortar0, explosion0_emitter, part1, 1);
    part_emitter_burst(particle_mortar0, explosion0_emitter, part2, 8);
    part_emitter_region(particle_mortar1, explosion1_emitter, mortar_x+8, mortar_x+8, mortar_y+20, mortar_y+20, ps_shape_diamond, ps_distr_invgaussian);
    part_emitter_burst(particle_mortar1, explosion1_emitter, part3, 8);
    part_emitter_burst(particle_mortar1, explosion1_emitter, part4, 16);
}

















