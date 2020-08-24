/// @description Creates the server.
//global.server_IP   = "192.168.8.102";
//global.server_port = 50000;
//global.server_name = "Ikes Test Server";

//Create server
global.server    = network_create_server(network_socket_tcp,global.server_port,2);
//Create list of connected clients
global.clients   = ds_list_create();
//Create server buffer
global.sbuffer   = buffer_create(1024,buffer_fixed,1);

//When using LAN this will broadcast the game for others on the network to find and join
if global.net_type == "LAN" {
	broadcast_buffer = buffer_create(32, buffer_fixed, 1);
	alarm[0] = 60;
}

temp_id     = -1;
temp_unit   = -1;
temp_squad  = "";
temp_xfinal = -1;
temp_yfinal = -1;
temp_weapon = "";
temp_amount = 0;