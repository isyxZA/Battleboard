if PLAYER.player == "ONE" {
	rot = 0;
}
	else {
		rot = 180;
	}
	
var c = instance_place(x, y, obj_Crater);
if c != noone { with c { instance_destroy(); } }

//alarm[0] = 4;
