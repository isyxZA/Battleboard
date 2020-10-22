// Create a server and listen on our broadcast port....
global.broadcast_server = network_create_server(network_socket_udp, 50001, 2);

global.server_IP   = undefined;
global.server_port = undefined;
global.server_name = undefined;

server_list   = ds_list_create();
server_ports  = ds_list_create();
server_names  = ds_list_create();
count = ds_list_size(server_list);

alarm[0]      = 600;
v_sep         = 64;
can_choose = true;
picked = -1;
selected = -1;
xx1 = room_width*0.25;
xx0 = room_width*0.5;
xx2 = room_width*0.75;
yy1 = room_height*0.125;
yy0 = room_height*0.5;
