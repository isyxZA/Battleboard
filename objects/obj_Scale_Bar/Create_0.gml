//work out the left and right limits
rightLimit = x+(sprite_width*0.45);
leftLimit = x-(sprite_width*0.45);

can_drag = false;

//create the slider for this bar and assign it some values
var l;
var aa;
if room != rm_Options { l = "GUI"; aa = obj_OPTIONS.x; }
	else  { l = "Sliders"; aa = 0; }
a = instance_create_layer(x, y, l, obj_Scale_Slider);
a.image_xscale = 1.25;
a.image_yscale = 1.25;
a.rightLimit = rightLimit;
a.leftLimit = leftLimit;
if PLAYER.scale_pos != 0 { a.x = PLAYER.scale_pos+aa; } else { a.x = x; }

sx = x-(sprite_get_width(spr_Menu_Bar)*0.5);
sy = y-(sprite_get_height(spr_Menu_Bar)*0.5)+1;
sw = a.x-sx;
sh = sprite_get_height(spr_Menu_Bar);

