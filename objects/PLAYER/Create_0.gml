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
fullScreen = true;
//Transition effect alpha level
t_a = 0;

if file_exists("settings.sav"){
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
		
	ini_close();
}
	else {
		music_pos   = 0;
		effects_pos = 0;
		zoom_pos    = 0;
		pan_pos     = 0;
		scale_pos   = 0;
	}






