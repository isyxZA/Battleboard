buffer_seek(bbuffer, buffer_seek_start, 0);
buffer_write(bbuffer, buffer_string, global.server_port);
network_send_broadcast(global.tcp_temp, 50001, bbuffer, buffer_tell(bbuffer));
alarm[1] = 60;
