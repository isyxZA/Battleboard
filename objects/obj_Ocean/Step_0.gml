if spv == vmax { rate = -0.01; }
if spv == vmin { rate = 0.01; }

spv += rate;

t += increment;
shift = amplitude * sin(t);
xshift = amplitude * cos(t*.99);

//Animate water sprites 
sh_1 = (sph/1.5)-0.021;
sv_1 = (spv/6)-0.021;

sh_2 = (sph/2)+0.001;
sv_2 = (spv/8)+0.001;

sx_1 = xshift*.050+1.6;
sx_2 = shift*.020+1.8;
sx_3 = xshift*.013+2;


if fade_in == true {
    a1 = ease_in_sine(t1, a1_start, 0.2, t1_duration);
    a2 = ease_out_sine(t1, a2_start, -0.2, t1_duration);

} 
    else {
        a1 = ease_out_sine(t1, a1_start, -0.2, t1_duration);
        a2 = ease_in_sine(t1, a2_start, 0.2, t1_duration);
    }
    
t1++;

if (t1 > t1_duration) {
    t1 = 0;
    a1_start = a1;
    a2_start = a2;
    if fade_in  == true { fade_in = false; } 
        else { fade_in = true; }
}

