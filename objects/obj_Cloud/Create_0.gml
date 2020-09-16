sprite_index = choose(spr_Cloud_1, spr_Cloud_2, spr_Cloud_3, spr_Cloud_4);

cloud_aref = 0.75;
cloud_a1   = cloud_aref;
cloud_a2   = cloud_a1-global.light_level;
shadow_a   = cloud_a1-0.5;
cloud_posx = 0;
cloud_posy = 0;

scale = random_range(0.8, 1.2);
adjx = (sprite_get_width(sprite_index)*0.5)*scale;
adjy = (sprite_get_height(sprite_index)*1)*scale;

if PLAYER.player == "ONE" { p_one = true; cloud_dir  = 20; }
	else { p_one = false; cloud_dir  = 20; }
	
x = cloud_posx;
y = cloud_posy;

