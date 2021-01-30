draw_sprite_ext(my_sprite, 0, x, y, xscale, yscale, 0, c_white, 1);
draw_set_font(my_font);
draw_text_colour_shadow(x, y, string(txt), c_silver, c_silver, c_silver, c_silver, 1, 330, c_black, 0.7);
draw_set_font(fnt_12);
draw_set_colour(c_white);
draw_set_halign(fa_center);

switch key {
    case "UP":
		draw_text(x, y+30, string("Move Up."));
		break;
    case "LEFT":
		draw_text(x, y+30, string("Move Left."));
		break;
    case "RIGHT":
        draw_text(x, y+30, string("Move Right."));
        break;
    case "DOWN":
        draw_text(x, y+30, string("Move Down."));
        break;
    case "SCREEN":
        draw_text(x, y+30, string("Toggle fullscreen. (Single Player Only)"));
        break;
	case "GRID":
        draw_text(x, y+30, string("Toggle grid display."));
        break;
    case "HINTS":
        draw_text(x, y+30, string("Toggle hints."));
        break;
    case "TERRAIN":
        draw_text(x, y+30, string("Highlight nearby terrain tiles."));
        break;
    case "SUPPLY":
        draw_text(x, y+30, string("Highlight tiles in resupply range."));
        break;
    case "RANGE":
        draw_text(x, y+30, string("Highlight tiles in unit firing range."));
        break;
    case "VISIBILITY":
        draw_text(x, y+30, string("Toggle enhanced visibility of units."));
        break;
    case "LSHIFT":
        draw_text(x, y+30, string("Rotate units to the left."));
        break;
    case "RSHIFT":
        draw_text(x, y+30, string("Rotate units to the right."));
        break;
    case "STATS":
        draw_text(x, y+30, string("Identify units."));
        break;
    case "ESCAPE":
        draw_text(x, y+30, string("Pause the game."));
        break;
    case "MMOUSE":
        draw_text(x, y+30, string("Hold to drag the board."));
        break;
    case "LMOUSE":
        draw_text(x, y+30, string("Select units and confirm actions."));
        break;
    case "RMOUSE":
        draw_text(x, y+30, string("Select single unit and display menu."));
        break;
    case "INCREASE":
        draw_text(x, y+30, string("Zoom camera in/Increase action amount."));
        break;
	case "DECREASE":
        draw_text(x, y+30, string("Zoom camera out/Decrease action amount."));
        break;
    case "TURNEND":
        draw_text(x, y+30, string("End the turn."));
        break;
    case "OBJECTIVES":
        draw_text(x, y+30, string("Highlight objective area."));
        break;
	case "CANCEL":
        draw_text(x, y+30, string("Cancel."));
        break;
    case "MOVE":
        draw_text(x, y+30, string("Move selected units."));
        break;
    case "SHOOT":
        draw_text(x, y+30, string("Target with selected units."));
        break;
	case "ARMOR":
        draw_text(x, y+30, string("Display unit armor."));
        break;
}
draw_set_font(fnt_12);
draw_set_colour(c_black);



