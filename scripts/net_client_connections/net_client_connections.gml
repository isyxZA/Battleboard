function net_client_connections() {

	//Gets the type of data that has been sent to the client
	var dataType = ds_map_find_value(async_load,"type");

	//Checks the data if it complies with the cases.
	switch (dataType){
	
		case network_type_data: //Data has been sent to the client from the server.
		#region Recieve Data
			//Reads the data that has been sent to the client.
			var data = ds_map_find_value(async_load,"buffer");
			//Find the start of the data.
			buffer_seek(global.cbuffer,buffer_seek_start,0);
			//Passes information into a script to process the data.
			net_client_events(data);
		#endregion
		break;
	
	}
}
