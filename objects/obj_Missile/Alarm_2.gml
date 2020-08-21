global.missile_count -= 1;
if global.missile_count <= 0 { 
	global.active_missile = false;
	obj_CONTROL.active_missile = false;
	global.turn_AP = 0;
}
instance_destroy();

