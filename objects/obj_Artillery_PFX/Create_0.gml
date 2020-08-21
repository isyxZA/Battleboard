particle_artillery0 = part_system_create();
particle_artillery1 = part_system_create();
part_system_depth(particle_artillery0, -12);
part_system_depth(particle_artillery1, -3);

//Fireball particle
part1 = part_type_create();
part_type_sprite(part1, spr_Explosion_02, true, true, false);
part_type_scale(part1, 1.5, 1.5);
//part_type_blend(part1, true);
part_type_life(part1, 180,180);

//Line particle
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
part_type_scale(part3, 0.8, 0.8);
part_type_size(part3, 0.1, 1, 0.0005, 0);
part_type_direction(part3, 0, 359, 0, 0);
part_type_speed(part3, 0.75, 2.75, -0.05, 0);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_alpha3(part3,0,0.1,0);
part_type_life(part3, 240, 260);

//Shrapnel particle
part4 = part_type_create();
//how it looks
part_type_sprite(part4, spr_Debris_00, false, true, true);
part_type_size(part4,0.2,0.4,0.01,0);
part_type_orientation(part4,0,360,0,0,0);
part_type_color2(part4,c_silver,c_orange);
part_type_alpha2(part4,1,0.5);
part_type_blend(part4,true);
//how it moves
part_type_direction(part4,0,360,0,0);
part_type_speed(part4,1,1.5,-0.01,0);
//how long it lasts
part_type_life(part4,40,50);

//Smoke particle
part6 = part_type_create();
part_type_sprite(part6, spr_Smoke_1, true, true, false);
part_type_size(part6, 0.5, 1, 0.008, 0);
part_type_scale(part6, 0.75, 0.75);
part_type_alpha2(part6, 0.1, 0);
part_type_color1(part6,c_silver);
part_type_speed(part6, .15, .25, -0.05, 0);
part_type_direction(part6, 0, 359, 0, 0);
part_type_orientation(part6, 0, 359, 0, 0, true);
part_type_life(part6, 200, 400);

part_type_step(part2, -2, part6);

explosion0_emitter = part_emitter_create(particle_artillery0);
explosion1_emitter = part_emitter_create(particle_artillery1);

//Artillery
explode_arty1 = false;
arty_x = 0;
arty_y = 0;





