timer_count = 0;
fade_in = false;

hour = 12;
h_start = hour;
h_change = 12;

day_start    = global.light_level;
day_change   = 0.3;
day_duration = 24000;

n_colour = make_color_rgb(0,6,36);//make_color_hsv(250,100,40);
n_start  = 0;
n_alpha  = n_start;
n_change = 0.5;
n_duration = 12000;
n_count = 0;
n_trigger = false;
n_fade_in = true;

set_colour = make_color_rgb(255,130,20);//make_color_hsv(250,100,40);
set_start  = 0;
set_alpha  = set_start;
set_change = 0.1;
set_duration = 6000;
set_count = 0;
set_trigger = false;
set_fade_in = true;

rise_colour = make_color_rgb(255,180,5);//make_color_hsv(250,100,40);
rise_start  = 0;
rise_alpha  = rise_start;
rise_change = 0.1;
rise_duration = 6000;
rise_count = 0;
rise_trigger = false;
rise_fade_in = true;

view = obj_CAMERA.my_camera;

if PLAYER.player == "ONE" { p_one = true; }
	else { p_one = false; }

/*
//Spawn clouds
tcx = 0;
tcy = 0;
var cn = 48;
var i;
for (i=0; i<cn; i++) {
	tcx = round(random(room_width));
	tcy = round(random(room_height));
	with instance_create_layer(tcx,tcy,"Weather", obj_Cloud) {
		cloud_posx = other.tcx;
		cloud_posy = other.tcy;
	}
}

instance_create_layer(0,0,"Weather", obj_Cloud_Shadows);
*/