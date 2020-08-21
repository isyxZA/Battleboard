//Mouse position relative to the GUI layer
gui_mx = device_mouse_x_to_gui(0);
gui_my = device_mouse_y_to_gui(0);

//Display text alpha level control
if display_txt != "" { 
    if txt_a < 0.9 { txt_a += 0.02; }
}
    else { txt_a = 0; }

