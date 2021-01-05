/// @description Save user settings
function scr_SaveSettings(){
	
	if file_exists("settings.sav") { file_delete("settings.sav"); }

	ini_open("settings.sav"); //create the file
	
	ini_write_real("Sound"  , "Music"  , global.music_level);
	ini_write_real("Sound"  , "Effects", global.effects_level);
	ini_write_real("Camera" , "Zoom"   , global.zoom_speed);
	ini_write_real("Camera" , "Pan"    , global.pan_speed);
	ini_write_real("Display", "UI"     , global.ui_scale);
	
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
	
	mx = obj_Music_Slider.x;
	ini_write_real("Sound", "MusicX", mx);
	PLAYER.music_pos = mx;
			
	ex = obj_Effects_Slider.x;
	ini_write_real("Sound", "EffectsX", ex);
	PLAYER.effects_pos = ex;
			
	zx = obj_Zoom_Slider.x;
	ini_write_real("Camera", "ZoomX", zx);
	PLAYER.zoom_pos = zx;
			
	px = obj_Pan_Slider.x;
	ini_write_real("Camera", "PanX", px);
	PLAYER.pan_pos = px;

	ux = obj_Scale_Slider.x;
	ini_write_real("Display", "UIX", ux);
	PLAYER.scale_pos = ux;
	
	ini_write_real("Keys", "Up"        , global.UP);
	ini_write_real("Keys", "Down"      , global.DOWN);
	ini_write_real("Keys", "Left"      , global.LEFT);
	ini_write_real("Keys", "Right"     , global.RIGHT);
	ini_write_real("Keys", "LShift"    , global.LSHIFT);
	ini_write_real("Keys", "RShift"    , global.RSHIFT);
	ini_write_real("Keys", "Shoot"     , global.SHOOT);
	ini_write_real("Keys", "Move"      , global.MOVE);
	ini_write_real("Keys", "Cancel"    , global.CANCEL);
	ini_write_real("Keys", "Stats"     , global.STATS);
	ini_write_real("Keys", "Range"     , global.RANGE);
	ini_write_real("Keys", "Terrain"   , global.TERRAIN);
	ini_write_real("Keys", "Supply"    , global.SUPPLY);
	ini_write_real("Keys", "Grid"      , global.GRID);
	ini_write_real("Keys", "Turnend"   , global.TURNEND);
	ini_write_real("Keys", "Hints"     , global.HINTS);
	ini_write_real("Keys", "Objectives", global.OBJECTIVES);
	ini_write_real("Keys", "Visibility", global.VISIBILITY);
	ini_write_real("Keys", "Screen"    , global.SCREEN);
	ini_write_real("Keys", "Escape"    , global.ESCAPE);
	ini_write_real("Keys", "LMouse"    , global.LMOUSE);
	ini_write_real("Keys", "RMouse"    , global.RMOUSE);
	ini_write_real("Keys", "MMouse"    , global.MMOUSE);
	ini_write_real("Keys", "Increase"  , global.INCREASE);
	ini_write_real("Keys", "Decrease"  , global.DECREASE);
	
	ini_close();

}