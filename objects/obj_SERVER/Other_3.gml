/// @description Destroys the server.
//Destroys the server connection.
network_destroy(global.server);
//Deletes the storage buffer.
buffer_delete(global.sbuffer);
if global.net_type == "LAN" { buffer_delete(broadcast_buffer); }
//Deletes the list of connections.
ds_list_destroy(global.clients);
