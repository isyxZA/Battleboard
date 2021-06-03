randomize();
scr_InitGlobals();
//Load texture groups    BREAK THIS UP INTO ROOMS AND ALSO ADD TEXTURE FLUSHING ON SPECIFIC ROOM CHANGES
var tex_array = texturegroup_get_textures( "Default");
for (var i=0; i<array_length(tex_array); ++i;) {
	texture_prefetch(tex_array[i]);
}
var tex_array = texturegroup_get_textures( "Backgrounds");
for (var i=0; i<array_length(tex_array); ++i;) {
	texture_prefetch(tex_array[i]);
}
var tex_array = texturegroup_get_textures( "Fonts");
for (var i=0; i<array_length(tex_array); ++i;) {
	texture_prefetch(tex_array[i]);
}
var tex_array = texturegroup_get_textures( "Menus");
for (var i=0; i<array_length(tex_array); ++i;) {
	texture_prefetch(tex_array[i]);
}

//Assign the player a side
player  = "";
faction = "US";
opponent_faction = "";
net_status = "NONE";
fullscreen = true;
can_switch = true;
//Transition effect alpha level
t_a = 0;

if file_exists("settings.sav") {
	ini_open("settings.sav");
		
	global.zoom_speed = ini_read_real("Camera", "Zoom", 0.1);
	zoom_pos = ini_read_real("Camera", "ZoomX", 0);
	global.pan_speed  = ini_read_real("Camera", "Pan", 40);
	pan_pos = ini_read_real("Camera", "PanX", 0);
		
	global.music_level   = ini_read_real("Sound", "Music", 0.5);
	audio_group_set_gain(Music, global.music_level, 200);
	music_pos = ini_read_real("Sound", "MusicX", 0);
	
	global.effects_level = ini_read_real("Sound", "Effects", 0.5);
	var ee;
	if global.effects_level > 0 { ee = (global.effects_level-(global.zoom_level*(0.1*global.effects_level)))+0.05; }
		else ee = 0;
	audio_group_set_gain(Effects, ee, 200);
	effects_pos = ini_read_real("Sound", "EffectsX", 0);
		
	var ep = ini_read_real("Controls", "Edge", 1);
	if ep == 1 { global.edge_pan = true; } else { global.edge_pan = false; }
		
	var vs = ini_read_real("Display", "Vsync", 1);
	if vs == 1 { global.vsync = true; } else { global.vsync = false; }
	global.ui_scale = ini_read_real("Display", "UI", 0.8);
	scale_pos = ini_read_real("Display", "UIX", 0);
	
	//Key binds
	global.UP      = ini_read_real("Keys", "Up"     , 87);
	global.DOWN    = ini_read_real("Keys", "Down"   , 83);
	global.LEFT    = ini_read_real("Keys", "Left"   , 65);
	global.RIGHT   = ini_read_real("Keys", "Right"  , 68);
	global.LSHIFT  = ini_read_real("Keys", "LShift" , 90);
	global.RSHIFT  = ini_read_real("Keys", "RShift" , 67);
	global.SHOOT   = ini_read_real("Keys", "Shoot"  , 81);
	global.MOVE    = ini_read_real("Keys", "Move"   , 69);
	global.CANCEL  = ini_read_real("Keys", "Cancel" , 88);
	global.STATS   = ini_read_real("Keys", "Stats"  , 9 );
	global.RANGE   = ini_read_real("Keys", "Range"  , 70);
	global.TERRAIN = ini_read_real("Keys", "Terrain", 84);
	global.SUPPLY  = ini_read_real("Keys", "Supply" , 82);
	global.GRID    = ini_read_real("Keys", "Grid"   , 71);
	global.TURNEND = ini_read_real("Keys", "Turnend", 32);
	global.HINTS   = ini_read_real("Keys", "Hints"  , 72);
	global.OBJECTIVES = ini_read_real("Keys", "Objectives", 79);
	global.VISIBILITY = ini_read_real("Keys", "Visibility", 86);
	global.SCREEN     = ini_read_real("Keys", "Screen"    , 80);
	global.ESCAPE     = ini_read_real("Keys", "Escape"    , 27);
	global.LMOUSE = ini_read_real("Keys", "LMouse", 1);
	global.RMOUSE = ini_read_real("Keys", "RMouse", 2);
	global.MMOUSE = ini_read_real("Keys", "MMouse", 3);
	global.INCREASE = ini_read_real("Keys", "Increase", 107);
	global.DECREASE = ini_read_real("Keys", "Decrease", 109);
		
	ini_close();
}
	else {
		music_pos   = 0;
		effects_pos = 0;
		zoom_pos    = 0;
		pan_pos     = 0;
		scale_pos   = 0;
		
	}


