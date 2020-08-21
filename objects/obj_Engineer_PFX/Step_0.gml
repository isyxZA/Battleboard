//Bomb effect emitter
if explode_bomb1 == true {
    explode_bomb1 = false;
    part_emitter_region(particle_engineer0, explosion0_emitter, bomb_x, bomb_x, bomb_y, bomb_y, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(particle_engineer0, explosion0_emitter, part1, 1);
    part_emitter_burst(particle_engineer0, explosion0_emitter, part2, 3);
    part_emitter_region(particle_engineer1, explosion1_emitter, bomb_x, bomb_x, bomb_y, bomb_y, ps_shape_diamond, ps_distr_invgaussian);
    part_emitter_burst(particle_engineer1, explosion1_emitter, part3, 32);
    part_emitter_burst(particle_engineer1, explosion1_emitter, part4, 16);
}
if explode_bomb2 == true {
    explode_bomb2 = false;
    part_emitter_region(particle_engineer0, explosion0_emitter, bomb_x, bomb_x, bomb_y, bomb_y, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(particle_engineer0, explosion0_emitter, part1, 1);
    part_emitter_burst(particle_engineer0, explosion0_emitter, part2, 3);
    part_emitter_region(particle_engineer1, explosion1_emitter, bomb_x, bomb_x, bomb_y, bomb_y, ps_shape_diamond, ps_distr_invgaussian);
    part_emitter_burst(particle_engineer1, explosion1_emitter, part3, 32);
    part_emitter_burst(particle_engineer1, explosion1_emitter, part4, 16);
}


















