/// @description Save user settings
function scr_SaveSettings(){
	
	if file_exists("settings.sav") { file_delete("settings.sav"); }

	ini_open("settings.sav"); //create the file
	
	ini_write_real("Sound", "Music", global.music_level);
	ini_write_real("Sound", "Effects", global.effects_level);
	ini_write_real("Camera", "Zoom" , global.zoom_speed);
	ini_write_real("Camera", "Pan" , global.pan_speed);
	ini_write_real("Display", "UI", global.ui_scale);
	
	var vs;
	if global.vsync == true { vs = 1; } else vs = 0;
	ini_write_real("Display", "Vsync", vs);
	var ep;
	if global.edge_pan == true { ep = 1; } else ep = 0;
	ini_write_real("Controls", "Edge", ep);
	var mx;
	var ex;
	var zx;
	var px;
	var ux;
	
	if room != rm_Options {
		if instance_exists(obj_Music_Slider)   {
			 mx = obj_Music_Slider.x-obj_OPTIONS.x;
			ini_write_real("Sound", "MusicX", mx);
			PLAYER.music_pos = mx;
		}
		if instance_exists(obj_Effects_Slider) {
			ex = obj_Effects_Slider.x-obj_OPTIONS.x;
			ini_write_real("Sound", "EffectsX", ex);
			PLAYER.effects_pos = ex;
		}
		if instance_exists(obj_Zoom_Slider)    {
			zx = obj_Zoom_Slider.x-obj_OPTIONS.x;
			ini_write_real("Camera", "ZoomX", zx);
			PLAYER.zoom_pos = zx;
		}
		if instance_exists(obj_Pan_Slider)     {
			px = obj_Pan_Slider.x-obj_OPTIONS.x;
			ini_write_real("Camera", "PanX", px);
			PLAYER.pan_pos = px;
		}
		if instance_exists(obj_Scale_Slider)   {
			ux = obj_Scale_Slider.x-obj_OPTIONS.x;
			ini_write_real("Display", "UIX", ux);
			PLAYER.scale_pos = ux;
		}
	}
		else {
			zx = obj_Zoom_Slider.x;
			ini_write_real("Camera", "ZoomX", zx);
			PLAYER.zoom_pos = zx;
			
			px = obj_Pan_Slider.x;
			ini_write_real("Camera", "PanX", px);
			PLAYER.pan_pos = px;
			
			mx = obj_Music_Slider.x;
			ini_write_real("Sound", "MusicX", mx);
			PLAYER.music_pos = mx;
			
			ex = obj_Effects_Slider.x;
			ini_write_real("Sound", "EffectsX", ex);
			PLAYER.effects_pos = ex;
			
			ux = obj_Scale_Slider.x;
			ini_write_real("Display", "UIX", ux);
			PLAYER.scale_pos = ux;
		}

	ini_close();

}