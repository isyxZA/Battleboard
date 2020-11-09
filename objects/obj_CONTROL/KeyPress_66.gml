/// @description Debug overlay
if (global.debug == false){
    global.debug = true;
    show_debug_overlay(true);
}
    else if (global.debug == true){
        global.debug = false;
        show_debug_overlay(false);
    }
        else{}

