/// @description Connects client to server.
//Sets the types of connection socket.
global.clientSocket = network_create_socket(network_socket_tcp);
//Checks whether the client is currently connected.
global.clientConnected = network_connect(global.clientSocket,global.server_IP,global.server_port);
//Sets the global buffer for the client.
global.cbuffer = buffer_create(1024,buffer_fixed,1);

ping = 0;
temp_id    = -1;
temp_unit  = -1;
temp_squad = "";
temp_xfinal = -1;
temp_yfinal = -1;
temp_weapon = "";
temp_amount = 0;