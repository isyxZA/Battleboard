bullet_count += 1;

if bullet_count < 5 {
	with instance_create_layer(x, y, "ParticleFX", obj_E_Bunker_Bullet) {
	    x_to = other.target_x;
	    y_to = other.target_y;
	}
	alarm[5] = 4;
}
