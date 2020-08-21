particle_infantry0 = part_system_create();
particle_infantry1 = part_system_create();
part_system_depth(particle_infantry0, -12);
part_system_depth(particle_infantry1, -3);

//Fireball particle
part1 = part_type_create();
part_type_sprite(part1, spr_Explosion_07, true, true, false);
part_type_scale(part1, 0.7, 0.7);
part_type_alpha2(part1, 1, 0);
//part_type_blend(part1, true);
part_type_life(part1, 60, 60);

//Line particle
part2 = part_type_create();
//how it looks
part_type_sprite(part2, spr_Pixel_Line, false, true, false);
part_type_size(part2,.1,.2,0.001,.005);
part_type_orientation(part2,0,0,0,0,1);
part_type_color3(part2,c_white,c_orange,c_red);
part_type_alpha3(part2,1,.75,0);
//how it moves
part_type_direction(part2,0,360,0,0);
part_type_speed(part2,1,2,0,0);
part_type_gravity(part2,.01,270);
//how long it lasts
part_type_life(part2,40,50);

//Smoke particle
part3 = part_type_create();
part_type_sprite(part3, spr_Smoke_3, true, true, false);
part_type_scale(part3, 0.8, 0.8);
part_type_size(part3, 0.5, 0.5, 0.002, 0);
part_type_direction(part3, 0, 359, 0, 0);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_alpha3(part3,0.2,1,0);
part_type_life(part3, 180, 200);

//Shrapnel particle
part4 = part_type_create();
//how it looks
part_type_sprite(part4, spr_Debris_00, false, true, true);
part_type_size(part4,0.2,0.4,0.01,0);
part_type_orientation(part4,0,360,0,0.1,true);
part_type_color3(part4,c_silver,c_orange,c_dkgray);
part_type_alpha2(part4,1,0.1);
part_type_blend(part4,true);
//how it moves
part_type_direction(part4,0,360,0,0);
part_type_speed(part4,0.5,1,-0.01,0);
//how long it lasts
part_type_life(part4,40,50);

explosion0_emitter = part_emitter_create(particle_infantry0);
explosion1_emitter = part_emitter_create(particle_infantry1);

//RPG
explode_rpg1 = false;
rpg_x = 0;
rpg_y = 0;







