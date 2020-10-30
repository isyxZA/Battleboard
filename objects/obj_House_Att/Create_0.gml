can_draw = true;

if PLAYER.player == "ONE" { p_one = true;}
	else { p_one = false; }
	
//Shader Setup
bright_x = shader_get_uniform(shd_shadows, "bright_x");
bright_y = shader_get_uniform(shd_shadows, "bright_y");
mask = -1;
