particle_btr0 = part_system_create();
particle_btr1 = part_system_create();
part_system_depth(particle_btr0, -15);
part_system_depth(particle_btr1, -3);

//Fireball particle
part1 = part_type_create();
part_type_sprite(part1, spr_Explosion_05, true, true, false);
part_type_scale(part1, 0.5, 0.6);
part_type_alpha2(part1, 1, 0);
part_type_blend(part1, true);
part_type_life(part1, 100,100);

//Line particle
part2 = part_type_create();
//how it looks
part_type_sprite(part2, spr_Pixel_Line, false, true, false);
part_type_size(part2,.1,.2,0,.005);
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
part_type_sprite(part3, spr_Smoke_1, true, true, false);
part_type_scale(part3, 1, 1);
part_type_size(part3, 1, 1.5, 0.0015, 0);
part_type_direction(part3, 0, 359, 0, 0);
part_type_speed(part3, 0.75, 1, -0.075, 0);
part_type_orientation(part3, 0, 359, 0, 0, true);
part_type_alpha3(part3,0,0.5,0);
part_type_life(part3, 200, 240);

//Shrapnel particle
part4 = part_type_create();
//how it looks
part_type_sprite(part4, spr_Debris_00, false, true, true);
part_type_size(part4,0.2,0.4,0.01,0);
part_type_orientation(part4,0,360,0,0,0);
part_type_color2(part4,c_silver,c_dkgray);
part_type_alpha2(part4,1,0.5);
part_type_blend(part4,true);
//how it moves
part_type_direction(part4,0,360,0,0);
part_type_speed(part4,0.5,1,-0.01,0);
//how long it lasts
part_type_life(part4,20,30);


//Fireball particle
part5 = part_type_create();
part_type_sprite(part5, spr_Explosion_06, true, true, false);
part_type_scale(part5, 0.7, 0.7);
part_type_alpha2(part5, 1, 0);
//part_type_blend(part5, true);
part_type_life(part5, 100,100);

//Line particle
part6 = part_type_create();
//how it looks
part_type_sprite(part6, spr_Pixel, false, true, false);
part_type_size(part6,.1,.2,0,.005);
part_type_orientation(part6,0,0,0,0,1);
part_type_color3(part6,c_white,c_orange,c_red);
part_type_alpha3(part6,1,.75,0);
//how it moves
part_type_direction(part6,0,360,0,0);
part_type_speed(part6,1,2,0,0);
part_type_gravity(part6,.01,270);
//how long it lasts
part_type_life(part6,40,50);

//Smoke particle
part7 = part_type_create();
part_type_sprite(part7, spr_Smoke_1, true, true, false);
part_type_scale(part7, 0.8, 0.8);
part_type_size(part7, 1, 1.5, 0.005, 0);
part_type_direction(part7, 0, 359, 0, 0);
part_type_speed(part7, 1, 1.5, -0.025, 0);
part_type_orientation(part7, 0, 359, 0, 0, true);
part_type_alpha3(part7,0,0.7,0);
part_type_life(part7, 260, 280);

//Shrapnel particle
part8 = part_type_create();
//how it looks
part_type_sprite(part8, spr_Debris_00, false, true, true);
part_type_size(part8,0.2,0.4,0.01,0);
part_type_orientation(part8,0,360,0,0,0);
part_type_color2(part8,c_silver,c_orange);
part_type_alpha2(part8,1,0.5);
part_type_blend(part8,true);
//how it moves
part_type_direction(part8,0,360,0,0);
part_type_speed(part8,0.5,1,-0.01,0);
//how long it lasts
part_type_life(part8,30,50);

explosion0_emitter = part_emitter_create(particle_btr0);
explosion1_emitter = part_emitter_create(particle_btr1);

//HE
explode_he1 = false;
he_x = 0;
he_y = 0;
burst_trigger = false;
burst_he1 = false;
burst_he2 = false;
burst_he3 = false;
burst_trigger1 = false;
burst_he1a = false;
burst_he2a = false;
burst_he3a = false;

//AP
explode_ap1 = false;
ap_x = 0;
ap_y = 0;

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 0.75);






