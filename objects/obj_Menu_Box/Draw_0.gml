switch txt {
    case "W":
    case "A":
    case "D":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        break;
    case "S":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_center);
        draw_text(x,y+40, string_hash_to_newline("Move around the board."));
        break;
    case "P":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Toggle fullscreen."));
        draw_set_halign(fa_center);
        break;
	case "G":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Toggle Grid display."));
        draw_set_halign(fa_center);
        break;
    case "H":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Toggle hint pop-ups."));
        draw_set_halign(fa_center);
        break;
    case "T":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Highlight nearby terrain tiles."));
        draw_set_halign(fa_center);
        break;
    case "R":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Highlight tiles in resupply range."));
        draw_set_halign(fa_center);
        break;
    case "F":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Highlight tiles in unit firing range."));
        draw_set_halign(fa_center);
        break;
    case "V":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Toggle enhanced visibility of units."));
        draw_set_halign(fa_center);
        break;
    case "Z":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Shift/Rotate units to the left."));
        draw_set_halign(fa_center);
        break;
    case "C":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Shift/Rotate units to the right."));
        draw_set_halign(fa_center);
        break;
    case "Tab":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_14);
        draw_text_colour_shadow(x,  y, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Identify units."));
        draw_set_halign(fa_center);
        break;
    case "Esc":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_14);
        draw_text_colour_shadow(x,  y, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Pause the game."));
        draw_set_halign(fa_center);
        break;
    case "Middle Mouse":
        draw_sprite_ext(spr_Menu_Button, 0, x, y, 0.8, 0.7, 0, c_white, 1);
        draw_set_font(fnt_12);
        draw_text_colour_shadow(x,  y, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_colour(c_white);
        draw_set_halign(fa_center);
        draw_text(x,y+30, string_hash_to_newline("Hold to drag the board."));
        break;
    case "Left Mouse":
        draw_sprite_ext(spr_Menu_Button, 0, x, y, 0.8, 0.7, 0, c_white, 1);
        draw_set_font(fnt_12);
        draw_text_colour_shadow(x,  y, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_colour(c_white);
        draw_set_halign(fa_center);
        draw_text(x,y+30, string_hash_to_newline("Hold and drag to create selection box."));
        draw_text(x,y+50, string_hash_to_newline("Select a single unit. Hold SHIFT for multiple units."));
        draw_text(x,y+70, string_hash_to_newline("Confirm unit action."));
        break;
    case "Right Mouse":
        draw_sprite_ext(spr_Menu_Button, 0, x, y, 0.8, 0.7, 0, c_white, 1);
        draw_set_font(fnt_12);
        draw_text_colour_shadow(x,  y, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_colour(c_white);
        draw_set_halign(fa_center);
        draw_text(x,y+30, string_hash_to_newline("Place unit from landing craft to board."));
        draw_text(x,y+50, string_hash_to_newline("Select a single unit and display menu."));
        draw_text(x,y+70, string_hash_to_newline("Display action menu for selected units."));
        break;
    case "Scroll Wheel":
        draw_sprite_ext(spr_Menu_Button, 0, x, y, 0.8, 0.7, 0, c_white, 1);
        draw_set_font(fnt_12);
        draw_text_colour_shadow(x,  y, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_colour(c_white);
        draw_set_halign(fa_center);
        draw_text(x,y+30, string_hash_to_newline("Zoom camera in/out."));
        draw_text(x,y+50, string_hash_to_newline("Increase/decrease action amount."));
        break;
    case "Ctrl + 1-5":
        draw_sprite_ext(spr_Menu_Button, 0, x, y, 0.75, 0.5, 0, c_white, 1);
        draw_set_font(fnt_14);
        draw_text_colour_shadow(x,  y, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_colour(c_white);
        draw_set_halign(fa_center);
        draw_text(x,y+30, string_hash_to_newline("Create squad from selected units."));
        draw_set_font(fnt_12);
        break;
    case "Ctrl + Shift + 1-5":
        draw_sprite_ext(spr_Menu_Button, 0, x, y, 0.75, 0.5, 0, c_white, 1);
        draw_set_font(fnt_14);
        draw_text_colour_shadow(x,  y, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_colour(c_white);
        draw_set_halign(fa_center);
        draw_text(x,y+30, string_hash_to_newline("Add selected units to a squad"));
        draw_set_font(fnt_12);
        break;
    case "X":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Cancel."));
        draw_set_halign(fa_center);
        break;
    case "E":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Move selected units."));
        draw_set_halign(fa_center);
        break;
    case "Q":
        draw_sprite_ext(spr_Menu_Box, 0, x, y, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_20);
        draw_text_colour_shadow(x,  y+2, txt, c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
        draw_set_font(fnt_12);
        draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_text(x+32,y, string_hash_to_newline("Target with selected units."));
        draw_set_halign(fa_center);
        break;
}




