particle_bomber0 = part_system_create();
particle_bomber1 = part_system_create();
part_system_depth(particle_bomber0, -15);
part_system_depth(particle_bomber1, -3);

//Fireball particle
part1 = part_type_create();
part_type_sprite(part1, spr_Explosion_09, true, true, false);
part_type_scale(part1, 1, 1);
part_type_alpha2(part1, 1, 0);
part_type_blend(part1, true);
part_type_life(part1, 120,120);

//Pixel particle
part2 = part_type_create();
//how it looks
part_type_sprite(part2, spr_Pixel, false, true, false);
part_type_size(part2, 2,4,0.005,0);
part_type_orientation(part2,0,359,0,0,true);
part_type_color3(part2,c_gray,c_dkgray,c_black);
part_type_alpha2(part2,1,0.2);
//how it moves
part_type_direction(part2,0,360,0,0);
part_type_speed(part2,1,2,-0.001,0);
//how long it lasts
part_type_life(part2,20,60);

//Smoke particle
part3 = part_type_create();
part_type_sprite(part3, spr_Smoke_3, true, true, false);
part_type_size(part3, 0.5, 1, 0, 0);
part_type_scale(part3, 0.5, 0.5);
part_type_color1(part3,c_gray);
part_type_alpha3(part3, 0.1, 1, 0.1);
part_type_speed(part3, 1.75, 2.25, -0.05, 0);
part_type_direction(part3, 0, 359, 0, 0);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_life(part3, 260, 280);

//Shrapnel particle
part4 = part_type_create();
//how it looks
part_type_sprite(part4, spr_Debris_00, false, true, true);
part_type_size(part4,0.2,0.4,0.01,0);
part_type_orientation(part4,0,360,0,0.1,true);
part_type_color3(part4,c_red,c_silver,c_black);
part_type_alpha2(part4,1,0.1);
part_type_blend(part4,true);
//how it moves
part_type_direction(part4,0,360,0,0);
part_type_speed(part4,0.5,1,-0.01,0);
//how long it lasts
part_type_life(part4,60,200);

//Smoke particle
part5 = part_type_create();
part_type_sprite(part5, spr_Smoke_3, true, true, false);
part_type_size(part5, 0.5, 1, 0.005, 0);
part_type_scale(part5, 0.5, 0.5);
part_type_alpha2(part5, 0.1, 0);
part_type_speed(part5, .75, .95, -0.0725, 0);
part_type_direction(part5, 0, 359, 0, 0);
part_type_orientation(part5, 0, 359, 0, 0, true);
part_type_life(part5, 100, 120);

//Smoke particle
part6 = part_type_create();
part_type_sprite(part6, spr_Smoke_1, true, true, false);
part_type_size(part6, 0.75, 1, 0.0175, 0.01);
part_type_scale(part6, 1, 1);
part_type_color1(part6,c_dkgray);
part_type_alpha2(part6, 0.1, 0);
part_type_speed(part6, .15, .25, -0.05, 0);
part_type_direction(part6, 0, 359, 0, 0);
part_type_orientation(part6, 0, 359, 0, 0, true);
part_type_life(part6, 200, 280);

//part_type_death(part1, 6, part5);
part_type_step(part4, -2, part6);

explosion0_emitter = part_emitter_create(particle_bomber0);
explosion1_emitter = part_emitter_create(particle_bomber1);

//Bomber
explode_bomb1 = false;
bomb_x = 0;
bomb_y = 0;






