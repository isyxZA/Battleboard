/// @description Connected Sockets.
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_text(4,16,"Server IP:" + string(global.server_IP));
if ds_list_size(global.clients) > 0 { draw_text(4, 32, "Opponent connected."); }
	else { draw_text(4, 32, "Waiting for opponent...."); }
if room == rm_Setup {
	if global.locked == true { draw_text(4, 48, "You are locked in."); }
		else { draw_text(4, 48, "Waiting for your lock..."); }
	if global.green_light == true { draw_text(4, 64, "Opponent locked in. Click 'Ready' to begin the game."); }
		else { draw_text(4, 64, "Waiting for opponent lock..."); }
}
draw_set_halign(fa_center);
draw_set_colour(c_black);