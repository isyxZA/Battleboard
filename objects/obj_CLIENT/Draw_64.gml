/// @description Draw ping.
if global.clientConnected >= 0 {
	draw_set_halign(fa_left);
	draw_set_colour(c_green);
	draw_text(4,12,"Ping:"+string(ping)+"ms");
	draw_set_halign(fa_center);
	draw_set_colour(c_black);
}
	else { 
		draw_set_halign(fa_left);
		draw_set_colour(c_red);
		draw_text(4,24,"No Connection!");
		draw_set_halign(fa_center);
		draw_set_colour(c_black);
	}