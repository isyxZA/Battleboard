/// @description Save user settings
function scr_SaveSettings(){
	
	if file_exists("settings.sav") { file_delete("settings.sav"); }

	ini_open("settings.sav"); //create the file

	ini_write_real("Camera", "Zoom" , global.zoom_speed);
	var zx;
	if room != rm_Options { zx = obj_Zoom_Slider.x-obj_OPTIONS.x; }
		else { zx = obj_Zoom_Slider.x; }
	ini_write_real("Camera", "ZoomX", zx);
	PLAYER.zoom_pos = zx;
	
	var px;
	if room != rm_Options { px = obj_Pan_Slider.x-obj_OPTIONS.x; }
		else { px = obj_Pan_Slider.x; }
	ini_write_real("Camera", "Pan" , global.pan_speed);
	ini_write_real("Camera", "PanX", px);
	PLAYER.pan_pos = px;
	
	ini_write_real("Sound", "Music", global.music_level);
	var mx;
	if room != rm_Options { mx = obj_Music_Slider.x-obj_OPTIONS.x; }
		else { mx = obj_Music_Slider.x; }
	ini_write_real("Sound", "MusicX", mx);
	PLAYER.music_pos = mx;
	
	ini_write_real("Sound", "Effects", global.effects_level);
	var ex;
	if room != rm_Options { ex = obj_Effects_Slider.x-obj_OPTIONS.x; }
		else { ex = obj_Effects_Slider.x; }
	ini_write_real("Sound", "EffectsX", ex);
	PLAYER.effects_pos = ex;
	
	var ep;
	if global.edge_pan == true { ep = 1; } else ep = 0;
	ini_write_real("Controls", "Edge", ep);
	
	var vs;
	if global.vsync == true { vs = 1; } else vs = 0;
	ini_write_real("Display", "Vsync", vs);
	
	ini_write_real("Display", "UI", global.ui_scale);
	var ux;
	if room != rm_Options { ux = obj_Scale_Slider.x-obj_OPTIONS.x; }
		else { ux = obj_Scale_Slider.x; }
	ini_write_real("Display", "UIX", ux);
	PLAYER.scale_pos = ux;

	ini_close();

}