global.artillery_count -= 1;
if global.artillery_count <= 0 {
	global.active_artillery = false;
	obj_CONTROL.active_artillery = false;
	global.turn_AP = 0;
}
instance_destroy();

