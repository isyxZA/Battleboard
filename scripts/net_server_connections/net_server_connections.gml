function net_server_connections() {
	//Gets the type of data that has been sent to the server.
	var dataType = ds_map_find_value(async_load,"type");

	//Checks the data if it complies with the cases.
	switch (dataType){
	
		case network_type_connect: //A new socket has connected to the server.
		#region Socket Connection
			//Gets the socket of the player.
			var socket = ds_map_find_value(async_load,"socket");
			//Adds the socket to the list of connected sockets.
			ds_list_add(global.clients,socket);
			//Data sent to client on connect
			net_write_client(socket,
				buffer_u8,NET_CONNECT,
				buffer_string, PLAYER.player,
				buffer_string, PLAYER.faction,
				buffer_u8, global.turn_timer
			);
		#endregion
		break;
	
		case network_type_disconnect: //A socket has disconnected from the server.
		#region Socket Disconnect
			//Gets the socket of the player.
			var socket = ds_map_find_value(async_load,"socket");
			//Finds the position of the socket in the list.
			var socketPos = ds_list_find_index(global.clients,socket);
			//Deletes the socket for the connected list.
			ds_list_delete(global.clients,socketPos);
			//Action to take when client has disconnected
			
		#endregion
		break;
	
		case network_type_data: //Data has been sent to the server.
		#region Recieve Data
			//Reads the data that has been sent to the server.
			var data = ds_map_find_value(async_load,"buffer");
			//Gets the socket of the player that is sending the data.
			var socket = ds_map_find_value(async_load,"id");
			//Find the start of the data.
			buffer_seek(global.sbuffer,buffer_seek_start,0);
			//Passes information into a script to process the data.
			net_server_events(data,socket);
		#endregion
		break;
	
	}
		


}
