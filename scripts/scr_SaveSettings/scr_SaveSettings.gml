/// @description Save user settings
function scr_SaveSettings(){
	
	if file_exists("settings.sav") { file_delete("settings.sav"); }

	ini_open("settings.sav"); //create the file

	ini_write_real("Camera", "Zoom" , global.zoom_speed);
	var zx = obj_Zoom_Slider.x;
	ini_write_real("Camera", "ZoomX", zx);
	
	var px = obj_Pan_Slider.x;
	ini_write_real("Camera", "Pan" , global.pan_speed);
	ini_write_real("Camera", "PanX", px);
	
	ini_write_real("Sound", "Music", global.music_level);
	var mx = obj_Music_Slider.x;
	ini_write_real("Sound", "MusicX", mx);
	
	ini_write_real("Sound", "Effects", global.effects_level);
	var ex = obj_Effects_Slider.x;
	ini_write_real("Sound", "EffectsX", ex);
	
	var ep;
	if global.edge_pan == true { ep = 1; } else ep = 0;
	ini_write_real("Controls", "Edge", ep);
	
	var vs;
	if global.vsync == true { vs = 1; } else vs = 0;
	ini_write_real("Display", "Vsync", vs);
	
	ini_write_real("Display", "UI", global.ui_scale);
	var ux = obj_Scale_Slider.x;
	ini_write_real("Display", "UIX", ux);

	ini_close();

}