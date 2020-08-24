/// @description  UDP server code - Detect servers "broadcast"
var eventid = ds_map_find_value(async_load, "id");

if eventid == global.broadcast_server {
	var ip = ds_map_find_value(async_load, "ip");
	global.server_IP = ip;
	global.net_type  = "LAN";
	with obj_Get_LAN_IP { instance_destroy(); }
	network_destroy(global.broadcast_server);
	global.broadcast_server = -1;
}
