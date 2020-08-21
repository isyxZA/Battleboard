/// @description Client Disconnect.
//Destroys the connection to the server.
network_destroy(global.clientSocket);
//Deletes the storage buffer.
buffer_delete(global.cbuffer);