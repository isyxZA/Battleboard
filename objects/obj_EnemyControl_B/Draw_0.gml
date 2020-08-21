/*
draw_sprite_ext(spr_VehicleLandingCraft, 0, x-768, y-64, 1, 1, 180, c_white, 1);
draw_sprite_ext(spr_VehicleLandingCraft, 0, x-576, y-32, 1, 1, 180, c_white, 1);
draw_sprite_ext(spr_VehicleLandingCraft, 0, x-384, y, 1, 1, 180, c_white, 1);
draw_sprite_ext(spr_SoldierLandingCraft, 0, x-192, y+32, 1, 1, 180, c_white, 1);
draw_sprite_ext(spr_VehicleLandingCraft, 0, x    , y+64, 1, 1, 180, c_white, 1);
draw_sprite_ext(spr_SoldierLandingCraft, 0, x+192, y+32, 1, 1, 180, c_white, 1);
draw_sprite_ext(spr_VehicleLandingCraft, 0, x+384, y, 1, 1, 180, c_white, 1);
draw_sprite_ext(spr_VehicleLandingCraft, 0, x+576, y-32, 1, 1, 180, c_white, 1);
draw_sprite_ext(spr_VehicleLandingCraft, 0, x+768, y-64, 1, 1, 180, c_white, 1);
*/

if global.debug == true {
	draw_set_font(fnt_14);
	draw_set_colour(c_white); 
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y-144, string_hash_to_newline(string(state)));
	draw_text(x, y-120, string_hash_to_newline("Idle Actives: " + string(idle_count)));
	var s0 = ds_list_size(global.enemyunit_list);
	draw_text(x, y-96, string_hash_to_newline("Unit List: " + string(s0)));
	var s1 = ds_list_size(global.squad_1);
	var ss1;
	if squad_1_active == true { ss1 = "Active"; } else { ss1 = "Idle"; }
	draw_text(x, y-72, string_hash_to_newline("Squad 1: " + string(s1) + " " + string(ss1)));
	var s2 = ds_list_size(global.squad_2);
	var ss2;
	if squad_2_active == true { ss2 = "Active"; } else { ss2 = "Idle"; }
	draw_text(x, y-48, string_hash_to_newline("Squad 2: " + string(s2) + " " + string(ss2)));
	var s3 = ds_list_size(global.squad_3);
	var ss3;
	if squad_3_active == true { ss3 = "Active"; } else { ss3 = "Idle"; }
	draw_text(x, y-24, string_hash_to_newline("Squad 3: " + string(s3)+ " " + string(ss3)));
	var s4 = ds_list_size(global.squad_4);
	var ss4;
	if squad_4_active == true { ss4 = "Active"; } else { ss4 = "Idle"; }
	draw_text(x, y, string_hash_to_newline("Squad 4: " + string(s4) + " " + string(ss4)));
	var s5 = ds_list_size(global.squad_5);
	var ss5;
	if squad_5_active == true { ss5 = "Active"; } else { ss5 = "Idle"; }
	draw_text(x, y+24, string_hash_to_newline("Squad 5: " + string(s5) + " " + string(ss5)));
	var s6 = global.enemyunits_running;
	draw_text(x, y+48, string_hash_to_newline("Units Running: " + string(s6)));
	var s7;
	if active == true { s7 = "TRUE"; } else { s7 = "FALSE"; }
	draw_text(x, y+72, string_hash_to_newline("Active: " + string(s7)));
	var s8 = string(turn_ap);
	draw_text(x, y+96, string_hash_to_newline("AP: " + string(s8)));
	var s9 = string(ds_list_size(tile_list));
	draw_text(x, y+120, string_hash_to_newline("Spawn Tiles: " + string(s9)));
	var s10 = string(ds_list_size(global.tile_list));
	draw_text(x, y+144, string_hash_to_newline("Board Tiles: " + string(s10)));
	
	with obj_Enemy_Parent { 
		draw_sprite(spr_Moving_02, 0, x_final, y_final)
		draw_text(x_final, y_final, string_hash_to_newline(string(my_squad))); 
	}
	
	draw_set_font(fnt_12);
	draw_set_colour(c_black); 
}





