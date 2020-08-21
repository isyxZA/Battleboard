if keyboard_check_pressed(ord("6")) { explode_rpg1 = true; rpg_x = mouse_x; rpg_y = mouse_y; }

//Bomb effect emitter
if explode_rpg1 == true {
    explode_rpg1 = false;
    part_emitter_region(particle_infantry0, explosion0_emitter, rpg_x, rpg_x, rpg_y, rpg_y, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(particle_infantry0, explosion0_emitter, part1, 1);
    part_emitter_burst(particle_infantry0, explosion0_emitter, part2, 4);
    part_emitter_region(particle_infantry1, explosion1_emitter, rpg_x, rpg_x, rpg_y, rpg_y, ps_shape_diamond, ps_distr_invgaussian);
    part_emitter_burst(particle_infantry1, explosion1_emitter, part3, 2);
    part_emitter_burst(particle_infantry1, explosion1_emitter, part4, 24);
}
























