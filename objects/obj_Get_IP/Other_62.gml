if ( ds_map_find_value(async_load, "id") == async_event ) {
	if ( ds_map_find_value(async_load, "status") == 0 ) {
	    global.server_IP = ds_map_find_value(async_load, "result");
		global.net_type  = "INTERNET";
		instance_destroy();
	}
}
