ds_list_destroy(server_list);
ds_list_destroy(server_ports);
ds_list_destroy(server_names);
network_destroy(global.broadcast_server);
global.broadcast_server = -1;
