var dir1 = point_direction(x, y, target_x, target_y);
var xdir1 = lengthdir_x(30, dir1);
var ydir1 = lengthdir_y(30, dir1);
instance_create_layer(x+xdir1, y+ydir1, "ParticleFX", obj_Smoke_1);
