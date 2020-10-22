buffer_seek(bbuffer, buffer_seek_start, 0);
buffer_write(bbuffer, buffer_u32   , global.server_port);
buffer_write(bbuffer, buffer_string, global.server_name);
network_send_broadcast(global.tcp_temp, 50002, bbuffer, buffer_tell(bbuffer));
alarm[1] = 60;
