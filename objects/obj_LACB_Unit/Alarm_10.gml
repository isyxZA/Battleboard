if PLAYER.net_status == "HOST" { 
	//Send unit spawn signal to client
	var cc = ds_list_size(global.clients);
	if cc > 0 { 
		var i;
		for (i=0;i<cc;i++) {
			var csocket = ds_list_find_value(global.clients, i);
			net_write_client(csocket, 
				buffer_u8, NET_SPAWN,
				buffer_u16, x,
				buffer_u16, y,
				buffer_u32, id,
				buffer_string, unit_type,
				buffer_string, my_squad
			);
		}
	}
}
	else if PLAYER.net_status == "CLIENT" { 
		//Send unit spawn signal to host
		net_write_server(
			buffer_u8, NET_SPAWN,
			buffer_u16, x,
			buffer_u16, y,
			buffer_u32, id,
			buffer_string, unit_type,
			buffer_string, my_squad
		);
	}