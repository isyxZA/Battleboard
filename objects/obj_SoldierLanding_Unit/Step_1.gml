if !ds_list_empty(global.selected_list) { if selected == true { selected = false; } }

if selected {
    if line_alpha >= 0.5 { fade_switch = true; }
        else if line_alpha <= 0.1 { fade_switch = false; }
    if fade_switch == true { line_alpha = lerp(line_alpha, 0, 0.05); } 
        else if fade_switch == false { line_alpha = lerp(line_alpha, 0.6, 0.05); }
}
    else { line_alpha = 0.5; }

