c1 = c_white;
c2 = c_black;
//Control noise shader
uni_settings = shader_get_uniform(shd_vignette_noise, "u_settings");
uni_vignette_colour = shader_get_uniform(shd_vignette_noise, "u_vignette_colour");
