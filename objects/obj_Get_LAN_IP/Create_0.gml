global.server_IP = "";
global.net_type = "";
alarm[0] = 600;

global.tcp_temp = network_create_server(network_socket_tcp,global.server_port,2);
bbuffer = buffer_create(32, buffer_fixed, 1);
alarm[1] = 60;

