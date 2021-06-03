target_x = x + random_range(-128, 128);
if p_one == true { target_y = y + random_range(700, 900); }
	else { target_y = y - random_range(700, 900) }
draw_flash = true;
alarm[4] = 22;
audio_play_sound_on(emit, snd_TankMG01, false, 10);
with instance_create_layer(x, y, "ParticleFX", obj_E_Bunker_Bullet) {
    x_to = other.target_x;
    y_to = other.target_y;
}
bullet_count = 0;
alarm[5] = 4;
alarm[3] = random_range(60, 120);
