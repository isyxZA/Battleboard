timer_count  = 0;
fade_in = false;

day_start    = global.light_level;
day_change   = 0.8;
day_duration = 6000;

n_colour = make_color_rgb(0,6,36);//make_color_hsv(250,100,40);
n_start  = 0;
n_alpha  = n_start;
n_change = 0.35;

view = obj_CAMERA.my_camera;

if PLAYER.player == "ONE" { p_one = true; }
	else { p_one = false; }

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