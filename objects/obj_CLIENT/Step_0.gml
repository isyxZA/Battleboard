/// @description Send ping.

//Sends the current time to the server to see how fast it gets back.
net_write_server(buffer_u8,NET_PING,buffer_u32,current_time);