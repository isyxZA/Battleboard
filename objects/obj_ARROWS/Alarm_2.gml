if a > 0 { 
	if PLAYER.player == "ONE" { ay -= 6; } else { ay += 6; }
	a  -= 0.0125;
	as += 0.0025;
	alarm[2] = 2;
}
	else { instance_destroy(); }
