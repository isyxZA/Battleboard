t+=(increment*0.5);
shift  = amplitude*sin(t);
xshift = amplitude*cos(t*.99);

sh_1 = (sph/1.5)-0.021;
sv_1 = (spv/6)-0.021;//ypos

sh_2 = (sph/4)+0.001;
sv_2 = (spv/16)+0.001;//ypos

sx_1 = xshift*.050+1.6;
sx_2 = shift*.020+1.8;

fx1 = (x+sh_1)*fow_scale;
fy1 = (y+sv_1)*fow_scale;
fw1 = (1+sx_1)*fow_scale;
fh1 = (1+sx_1)*fow_scale;

fx2 = (x+sh_2)*fow_scale;
fy2 = (y+sv_2)*fow_scale;
fw2 = (1+sx_2)*fow_scale;
fh2 = (1+sx_2)*fow_scale;

/*
if fade_in == true {
    a1 = ease_in_sine (t1, a1_start,  0.3, t1_duration);
    a2 = ease_out_sine(t1, a2_start, -0.3, t1_duration);
} 
    else {
        a1 = ease_out_sine(t1, a1_start, -0.3, t1_duration);
        a2 = ease_in_sine (t1, a2_start,  0.3, t1_duration);
    }
    
t1++;
if (t1 > t1_duration) {
    t1 = 0;
	//t1_duration = 8000;
    a1_start = a1;
    a2_start = a2;
    if fade_in == true { fade_in = false; } 
        else { fade_in = true; }
}
*/

