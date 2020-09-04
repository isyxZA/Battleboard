/// @description Toggle fullscreen
//Move this function to the options menu!!!
if fullScreen == false {
    window_set_fullscreen(true);
    fullScreen = true;
    global.edge_pan = true;
}
    else if fullScreen == true {
        window_set_fullscreen(false);
        fullScreen = false;
        window_set_size(1280, 720);
        global.edge_pan = false;
    }

