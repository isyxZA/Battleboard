fow_scale = 0.5;
surf_w = room_width*fow_scale;
surf_h = room_height*fow_scale;
fow_surf = surface_create(surf_w, surf_h);


//Speed
spv = 0;
sph = -0.05;

sh_1 = 0;
sv_1 = 0;

sh_2 = 0;
sv_2 = 0;

sx_1 = 0;
sx_2 = 0;

rate =  -0.0005;
vmax =  0.1;
vmin = -0.1;

t = 6;
increment = degtorad(.1);
amplitude = 1.499; 
shift  = 0;
xshift = 0;

a1 = 0.2;
a2 = 0.3;

/*
a1_start = a1;
a2_start = a2;
fade_in = true;
t1 = 0;
t1_duration = 8000;
*/

fx1 = (x+sh_1)*fow_scale;
fy1 = (y+sv_1)*fow_scale;
fw1 = (1+sx_1)*fow_scale;
fh1 = (1+sx_1)*fow_scale;

fx2 = (x+sh_2)*fow_scale;
fy2 = (y+sv_2)*fow_scale;
fw2 = (1+sx_2)*fow_scale;
fh2 = (1+sx_2)*fow_scale;

