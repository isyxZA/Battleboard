/// @description Creates the server.
global.server_IP   = "192.168.8.100";
global.server_port = 50000;
global.server_name = "Ikes Test Server";

//Defines global variables to store data.
global.server    = network_create_server(network_socket_tcp,global.server_port,2);
global.clients   = ds_list_create();
global.sbuffer   = buffer_create(1024,buffer_fixed,1);

broadcast_buffer = buffer_create(32, buffer_fixed, 1);
alarm[0] = 60;

temp_id     = -1;
temp_unit   = -1;
temp_squad  = "";
temp_xfinal = -1;
temp_yfinal = -1;