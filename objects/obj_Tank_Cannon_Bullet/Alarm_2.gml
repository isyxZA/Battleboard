if img > (sprite_get_number(spr_Explosion_01)-1) { 
	explode = false; 
	can_draw = false; 
}
	else {
		img++;
		alarm[2] = 2;
	}
