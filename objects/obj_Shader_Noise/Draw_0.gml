/// @description Enable shader
shader_set(shd_vignette_noise);
shader_set_uniform_f(uni_settings, 1, 0, 0.05, 1); //vignette inner circle size, vignette outter circle size, noise strength, noise enable (1 or 0 only).
shader_set_uniform_f(uni_vignette_colour,184,175,154); //R,G,B - 0 to 255 

//255,230,204 Blanched Almond - Desert Colour
//rgb(186,177,131) Ecru
//rgb(148,140,104) Beaver
//rgb(142,148,105) Asparagus
//rgb(148,145,120) Cinereous
//rgb(128,125,103) Camo Green
//rgb(107,102,90) Dim Gray
//rgb(201,192,169) Pale Silver
//rgb(184,175,154) Khaki
//rgb(77,64,0) Cafe Noir
//rgb(135,112,0) Heart Gold
//rgb(210,180,140) Tan