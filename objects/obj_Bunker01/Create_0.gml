event_inherited();

my_house = sprite_index;

can_shoot = false;
flash_index = spr_Muzzle_Flash_05;
draw_flash = false;
target_x = x;
target_y = y;
bullet_count = 0;

emit = audio_emitter_create();
audio_emitter_falloff(emit, 200, 2000, 1.5);
audio_emitter_position(emit, x, y, 0);

//if p_one == true { alarm[3] = random_range(100, 300); }



