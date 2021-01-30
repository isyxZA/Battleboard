/// @description scr_KeyText(key_number, text_type)
/// @param key number
/// @param text type
function scr_KeyText(argument0, argument1) {
	
	var key_number = argument0;
	var text_type  = argument1;

	switch key_number {
		case -1:
			break;
		case 8://Backspace
			//Set text to display
			if text_type == "PERM" { 
				txt = "Backspace"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.8;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Backspace"; }
			break;
		case 9://TAB
			//Set text to display
			if text_type == "PERM" { 
				txt = "Tab"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_14;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "Tab"; }
			break;
		case 13://Enter
			//Set text to display
			if text_type == "PERM" { 
				txt = "Enter"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.7;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Enter"; }
			break;
		case 20://CAPS
			//Set text to display
			if text_type == "PERM" { 
				txt = "Caps"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_14;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "Caps"; }
			break;
		case 27://Escape
			//Set text to display
			if text_type == "PERM" { 
				txt = "Esc";
				my_sprite = spr_Menu_Box;
				my_font = fnt_14;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "Esc"; }
			break;
		case 32://Spacebar
			//Set text to display
			if text_type == "PERM" { 
				txt = "Spacebar"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.7;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Spacebar"; }
			break;
		case 33://Page Up
			//Set text to display
			if text_type == "PERM" { 
				txt = "Page Up"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.6;
				yscale = 0.6;
			}
				else if text_type == "TEMP" { txt_temp = "Page Up"; }
			break;
		case 34://Page Down
			//Set text to display
			if text_type == "PERM" { 
				txt = "Page Down";
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.7;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Page Down"; }
			break;
		case 35://End
			//Set text to display
			if text_type == "PERM" { 
				txt = "End";
				my_sprite = spr_Menu_Box;
				my_font = fnt_14;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "End"; }
			break;
		case 36://Home
			//Set text to display
			if text_type == "PERM" { 
				txt = "Home"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.7;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Home"; }
			break;
		case 37://Left Arrow
			//Set text to display
			if text_type == "PERM" { 
				txt = "LT"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "LT"; }
			break;
		case 38://Up Arrow
			//Set text to display
			if text_type == "PERM" { 
				txt = "UP"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "UP"; }
			break;
		case 39://Right Arrow
			//Set text to display
			if text_type == "PERM" { 
				txt = "RT"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "RT"; }
			break;
		case 40://Down Arrow
			//Set text to display
			if text_type == "PERM" { 
				txt = "DN"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "DN"; }
			break;
		case 45://Ins
			//Set text to display
			if text_type == "PERM" { 
				txt = "Ins"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_14;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "Ins"; }
			break;
		case 46://Del
			//Set text to display
			if text_type == "PERM" { 
				txt = "Del"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_14;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "Del"; }
			break;
		case 48://0
			//Set text to display
			if text_type == "PERM" { 
				txt = "0"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "0"; }
			break;
		case 49://1
			//Set text to display
			if text_type == "PERM" { 
				txt = "1"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "1"; }
			break;
		case 50://2
			//Set text to display
			if text_type == "PERM" { 
				txt = "2"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "2"; }
			break;
		case 51://3
			//Set text to display
			if text_type == "PERM" { 
				txt = "3"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "3"; }
			break;
		case 52://4
			//Set text to display
			if text_type == "PERM" { 
				txt = "4"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "4"; }
			break;
		case 53://5
			//Set text to display
			if text_type == "PERM" { 
				txt = "5"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "5"; }
			break;
		case 54://6
			//Set text to display
			if text_type == "PERM" { 
				txt = "6"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "6"; }
			break;
		case 55://7
			//Set text to display
			if text_type == "PERM" { 
				txt = "7"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "7"; }
			break;
		case 56://8
			//Set text to display
			if text_type == "PERM" { 
				txt = "8"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "8"; }
			break;
		case 57://9
			//Set text to display
			if text_type == "PERM" { 
				txt = "9"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "9"; }
			break;
		case 65://A
			//Set text to display
			if text_type == "PERM" { 
				txt = "A"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "A"; }
			break;
		case 66://B
			//Set text to display
			if text_type == "PERM" { 
				txt = "B"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "B"; }
			break;
		case 67://C
			//Set text to display
			if text_type == "PERM" { 
				txt = "C"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "C"; }
			break;
		case 68://D
			//Set text to display
			if text_type == "PERM" { 
				txt = "D"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "D"; }
			break;
		case 69://E
			//Set text to display
			if text_type == "PERM" { 
				txt = "E"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "E"; }
			break;
		case 70://F
			//Set text to display
			if text_type == "PERM" { 
				txt = "F"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F"; }
			break;
		case 71://G
			//Set text to display
			if text_type == "PERM" { 
				txt = "G"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "G"; }
			break;
		case 72://H
			//Set text to display
			if text_type == "PERM" { 
				txt = "H"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "H"; }
			break;
		case 73://I
			//Set text to display
			if text_type == "PERM" { 
				txt = "I"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "I"; }
			break;
		case 74://J
			//Set text to display
			if text_type == "PERM" { 
				txt = "J"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "J"; }
			break;
		case 75://K
			//Set text to display
			if text_type == "PERM" { 
				txt = "K"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "K"; }
			break;
		case 76://L
			//Set text to display
			if text_type == "PERM" { 
				txt = "L";
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "L"; }
			break;
		case 77://M
			//Set text to display
			if text_type == "PERM" { 
				txt = "M"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "M"; }
			break;
		case 78://N
			//Set text to display
			if text_type == "PERM" { 
				txt = "N"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "N"; }
			break;
		case 79://O
			//Set text to display
			if text_type == "PERM" { 
				txt = "O"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "O"; }
			break;
		case 80://P
			//Set text to display
			if text_type == "PERM" { 
				txt = "P"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "P"; }
			break;
		case 81://Q
			//Set text to display
			if text_type == "PERM" { 
				txt = "Q"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "Q"; }
			break;
		case 82://R
			//Set text to display
			if text_type == "PERM" { 
				txt = "R"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "R"; }
			break;
		case 83://S
			//Set text to display
			if text_type == "PERM" { 
				txt = "S"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "S"; }
			break;
		case 84://T
			//Set text to display
			if text_type == "PERM" { 
				txt = "T"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "T"; }
			break;
		case 85://U
			//Set text to display
			if text_type == "PERM" { 
				txt = "U"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "U"; }
			break;
		case 86://V
			//Set text to display
			if text_type == "PERM" { 
				txt = "V"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "V"; }
			break;
		case 87://W
			//Set text to display
			if text_type == "PERM" { 
				txt = "W"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "W"; }
			break;
		case 88://X
			//Set text to display
			if text_type == "PERM" { 
				txt = "X"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "X"; }
			break;
		case 89://Y
			//Set text to display
			if text_type == "PERM" { 
				txt = "Y"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "Y"; }
			break;
		case 90://Z
			//Set text to display
			if text_type == "PERM" { 
				txt = "Z"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "Z"; }
			break;
		case 96://numpad0
			//Set text to display
			if text_type == "PERM" { 
				txt = "0"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "0"; }
			break;
		case 97://numpad1
			//Set text to display
			if text_type == "PERM" { 
				txt = "1"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "1"; }
			break;
		case 98://numpad2
			//Set text to display
			if text_type == "PERM" { 
				txt = "2"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "2"; }
			break;
		case 99://numpad3
			//Set text to display
			if text_type == "PERM" { 
				txt = "3"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "3"; }
			break;
		case 100://numpad4
			//Set text to display
			if text_type == "PERM" { 
				txt = "4"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "4"; }
			break;
		case 101://numpad5
			//Set text to display
			if text_type == "PERM" { 
				txt = "5"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "5"; }
			break;
		case 102://numpad6
			//Set text to display
			if text_type == "PERM" { 
				txt = "6"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "6"; }
			break;
		case 103://numpad7
			//Set text to display
			if text_type == "PERM" { 
				txt = "7"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "7"; }
			break;
		case 104://numpad8
			//Set text to display
			if text_type == "PERM" { 
				txt = "8"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "8"; }
			break;
		case 105://numpad9
			//Set text to display
			if text_type == "PERM" {
				txt = "9"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "9"; }
			break;
		case 106://numpad*
			//Set text to display
			if text_type == "PERM" { 
				txt = "*"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "*"; }
			break;
		case 107://numpad+
			//Set text to display
			if text_type == "PERM" { 
				txt = "+"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "+"; }
			break;
		case 109://numpad-
			//Set text to display
			if text_type == "PERM" { 
				txt = "-"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "-"; }
			break;
		case 111://numpad/
			//Set text to display
			if text_type == "PERM" { 
				txt = " / "; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = " / "; }
			break;
		case 112://F1
			//Set text to display
			if text_type == "PERM" { 
				txt = "F1"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F1"; }
			break;
		case 113://F2
			//Set text to display
			if text_type == "PERM" { 
				txt = "F2"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F2"; }
			break;
		case 114://F3
			//Set text to display
			if text_type == "PERM" { 
				txt = "F3"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F3"; }
			break;
		case 115://F4
			//Set text to display
			if text_type == "PERM" { 
				txt = "F4"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F4"; }
			break;
		case 116://F5
			//Set text to display
			if text_type == "PERM" { 
				txt = "F5"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F5"; }
			break;
		case 117://F6
			//Set text to display
			if text_type == "PERM" { 
				txt = "F6"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F6"; }
			break;
		case 118://F7
			//Set text to display
			if text_type == "PERM" { 
				txt = "F7"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F7"; }
			break;
		case 119://F8
			//Set text to display
			if text_type == "PERM" { 
				txt = "F8"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F8"; }
			break;
		case 120://F9
			//Set text to display
			if text_type == "PERM" { 
				txt = "F9"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F9"; }
			break;
		case 121://F10
			//Set text to display
			if text_type == "PERM" { 
				txt = "F10"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F10"; }
			break;
		case 122://F11
			//Set text to display
			if text_type == "PERM" { 
				txt = "F11"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F11"; }
			break;
		case 123://F12
			//Set text to display
			if text_type == "PERM" { 
				txt = "F12"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_16;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "F12"; }
			break;
		case 162://Cntrl Left
			//Set text to display
			if text_type == "PERM" { 
				txt = "Ctrl L"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.7;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Ctrl L"; }
			break;
		case 163://Cntrl Right
			//Set text to display
			if text_type == "PERM" { 
				txt = "Ctrl R"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.7;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Ctrl R"; }
			break;
		case 164://Alt Left
			//Set text to display
			if text_type == "PERM" { 
				txt = "Alt"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_14;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "Alt"; }
			break;
		case 165://Alt Right
			//Set text to display
			if text_type == "PERM" { 
				txt = "Alt R"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.7;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Alt R"; }
			break;
		case 186:// ;
			//Set text to display
			if text_type == "PERM" { 
				txt = ";"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = ";"; }
			break;
		case 187:// =
			//Set text to display
			if text_type == "PERM" { 
				txt = "="; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "="; }
			break;
		case 188:// ,
			//Set text to display
			if text_type == "PERM" { 
				txt = ","; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = ","; }
			break;
		case 189:// -
			//Set text to display
			if text_type == "PERM" { 
				txt = "-"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "-"; }
			break;
		case 190:// .
			//Set text to display
			if text_type == "PERM" { 
				txt = "."; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "."; }
			break;
		case 191:// /
			//Set text to display
			if text_type == "PERM" { 
				txt = " / "; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = " / "; }
			break;
		case 192:// `
			//Set text to display
			if text_type == "PERM" { 
				txt = "`"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "`"; }
			break;
		case 219:// [
			//Set text to display
			if text_type == "PERM" { 
				txt = "["; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "["; }
			break;
		case 220:// \
			//Set text to display
			if text_type == "PERM" { 
				txt = " \ "; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = " \ "; }
			break;
		case 221:// ]
			//Set text to display
			if text_type == "PERM" { 
				txt = "]"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "]"; }
			break;
		case 222:// '
			//Set text to display
			if text_type == "PERM" { 
				txt = "'"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "'"; }
			break;
		case mb_left:
			//Set text to display
			if text_type == "PERM" { 
				txt = "Mouse Left"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.8;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Mouse Left"; }
			break;
		case mb_right:
			//Set text to display
			if text_type == "PERM" { 
				txt = "Mouse Right"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.8;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Mouse Right"; }
			break;
		case mb_middle:
			//Set text to display
			if text_type == "PERM" { 
				txt = "Middle Mouse"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.8;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Middle Mouse"; }
			break;
		case 0:
			//Set text to display
			if text_type == "PERM" { 
				txt = "Scroll Wheel"; 
				my_sprite = spr_Menu_Button;
				my_font = fnt_14;
				xscale = 0.8;
				yscale = 0.7;
			}
				else if text_type == "TEMP" { txt_temp = "Scroll Wheel"; }
			break;
		default:
			//Set text to display
			if text_type == "PERM" { 
				txt = "!?"; 
				my_sprite = spr_Menu_Box;
				my_font = fnt_18;
				xscale = 1;
				yscale = 1;
			}
				else if text_type == "TEMP" { txt_temp = "!?"; }
			break;
	}

}