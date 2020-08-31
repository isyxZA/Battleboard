sprite_index = choose(spr_Cloud_1, spr_Cloud_2, spr_Cloud_3, spr_Cloud_4);
adjx = sprite_get_width(sprite_index)*0.25;
adjy = sprite_get_height(sprite_index)*1.25;


cloud_aref  = 0.7;
cloud_a1 = cloud_aref;
cloud_a2 = cloud_a1-global.light_level;
shadow_a   = 0.3;
cloud_posx = 0;
cloud_posy = 0;

if PLAYER.player == "ONE" { p_one = true; cloud_dir  = 20; }
	else { p_one = false; cloud_dir  = 20; }
	
x = cloud_posx;
y = cloud_posy;

