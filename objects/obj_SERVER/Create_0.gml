/// @description Creates the server.
//global.server_IP   = "192.168.8.102";
//global.server_port = 50000;
//global.server_name = "Ikes Test Server";

//Create server
//global.server    = network_create_server(network_socket_tcp,global.server_port,2);
//Create list of connected clients
global.clients  = ds_list_create();
//Create server buffer
global.sbuffer  = buffer_create(1024,buffer_grow,1);

//When using LAN this will broadcast the game for others on the network to find and join
if global.net_type == "LAN" {
	broadcast_buffer = buffer_create(64, buffer_fixed, 1);
	alarm[0] = 60;
}

temp_id     = -1;
temp_unit   = -1;
temp_squad  = "";
temp_xfinal = -1;
temp_yfinal = -1;
temp_weapon = "";
temp_amount = -1;

temp_x1 = -1;
temp_y1 = -1;
temp_x2 = -1;
temp_y2 = -1;
temp_x3 = -1;
temp_y3 = -1;
temp_x4 = -1;
temp_y4 = -1;
temp_x5 = -1;
temp_y5 = -1;
temp_x6 = -1;
temp_y6 = -1;
temp_x7 = -1;
temp_y7 = -1;
temp_x8 = -1;
temp_y8 = -1;
temp_x9 = -1;
temp_y9 = -1;
temp_x10 = -1;
temp_y10 = -1;

temp_pathx1 = -1;
temp_pathy1 = -1;
temp_pathx2 = -1;
temp_pathy2 = -1;