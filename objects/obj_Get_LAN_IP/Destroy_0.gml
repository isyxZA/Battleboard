
//Destroys the server connection.
network_destroy(global.tcp_temp);
global.tcp_temp = -1;
//Deletes the storage buffer.
buffer_delete(bbuffer);
