if keyboard_check_pressed(ord("8")) { explode_tow1 = true; tow_x = mouse_x; tow_y = mouse_y; }

//TOW explode effect emitter
if explode_tow1 == true {
    explode_tow1 = false;
    part_emitter_region(particle_tow0, explosion0_emitter, tow_x, tow_x, tow_y, tow_y, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(particle_tow0, explosion0_emitter, part1, 1);
    part_emitter_burst(particle_tow0, explosion0_emitter, part2, 8);
    part_emitter_region(particle_tow1, explosion1_emitter, tow_x, tow_x, tow_y, tow_y, ps_shape_diamond, ps_distr_invgaussian);
    part_emitter_burst(particle_tow1, explosion1_emitter, part3, 5);
    part_emitter_burst(particle_tow1, explosion1_emitter, part4, 16);
}

















