global.units_running -= 1;
if PLAYER.net_status == "HOST" {
	//Send end run signal to client
	var cc = ds_list_size(global.clients);
	if cc > 0 { 
		var i;
		for (i=0;i<cc;i++) {
			var csocket = ds_list_find_value(global.clients, i);
			net_write_client(csocket, buffer_u8, NET_ENDRUN);
		}
	}
}
	else if PLAYER.net_status == "CLIENT" {
		//Send end run signal to host 
		net_write_server(buffer_u8, NET_ENDRUN);
	}
