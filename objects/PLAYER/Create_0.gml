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






