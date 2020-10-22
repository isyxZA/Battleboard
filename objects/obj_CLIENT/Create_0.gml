/// @description Connects client to server.
//Sets the types of connection socket.
//global.clientSocket = network_create_socket(network_socket_tcp);
//Checks whether the client is currently connected.
//global.clientConnected = network_connect(global.clientSocket,global.server_IP,global.server_port);
//Sets the global buffer for the client.
global.cbuffer = buffer_create(1024,buffer_grow,1);

ping = 0;
temp_id    = -1;
temp_unit  = -1;
temp_squad = "";
temp_xfinal = -1;
temp_yfinal = -1;
temp_weapon = "";
temp_amount = 0;

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