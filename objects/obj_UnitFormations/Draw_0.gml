draw_set_font(fnt_14);
draw_set_color(c_silver);
draw_set_font(fnt_14);
draw_text(x, y-30, "---------- Available Formation Points ----------");
draw_text(x, y+30, "---------- Squad Costs ----------");
draw_text(x, y+270, "Drag and drop squads into the landing craft to create a formation.");
draw_text(x, y+620, "---------- Reinforcements ----------");
draw_text(x-260, y+650, "Infantry");
draw_text(x-130, y+650, "MBT's");
draw_text(x    , y+650, "LAC's");
draw_text(x+130, y+650, "LAV's");
draw_text(x+260, y+650, "Logistics");
draw_set_font(fnt_16);
draw_text(x, y, string(formation_points));
draw_set_font(fnt_12)
draw_set_color(c_black);
