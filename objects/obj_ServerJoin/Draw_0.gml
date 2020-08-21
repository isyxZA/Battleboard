draw_set_font(fnt_14);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(4, 16, string(global.server_name));
draw_text(4, 32, string(global.server_IP));
draw_text(4, 48, string(global.server_port));

if !ds_list_empty(server_list) {
	var i;
	var slen = ds_list_size(server_list);
	for (i=0;i<slen;i++) {
		var sval = ds_list_find_value(server_list , i);
		var pval = ds_list_find_value(server_ports, i);
		var nval = ds_list_find_value(server_names, i);
		draw_set_font(fnt_16);
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_text(xx1, yy1+(i*v_sep), string(sval));
		draw_set_halign(fa_center);
		draw_text(xx0, yy1+(i*v_sep), string(pval));
		draw_set_halign(fa_right);
		draw_text(xx2, yy1+(i*v_sep), string(nval));
	}
	draw_set_halign(fa_center);
	draw_set_font(fnt_12);
	draw_set_color(c_black);
}
	else {
		draw_set_halign(fa_center);
		draw_set_font(fnt_16);
		draw_set_color(c_white);
		draw_text(xx0, yy0, "No servers found. Select 'Host Game' to create a server.");
		draw_set_font(fnt_12);
		draw_set_color(c_black);
	}

