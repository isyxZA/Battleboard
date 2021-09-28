///@function scr_input_box_input(allowedInput,allowCutCopy,allowPaste);
///@description Take input
///@param {real} allowedInput From 0 - 3 (0 = any characters, 1 = only letters, 2 = only digits, 3 = only letters and digits)
///@param {bool} allowCutCopy Allow Cut and Copy commands (Ctrl+X and Ctrl+C)
///@param {bool} allowPaste Allow Paste command (Ctrl+V)
///Place in Step event
function scr_input_box_input(argument0, argument1, argument2) {

	if (selected == true)
	{
		//write over select all
		if (selectAll == true)
		{
			if (keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_delete))
			{
				keyboard_string = "";
				selectAll = false;
			}
			else
			{
				//Ctrl+X - Cut (Windows only)
				if (keyboard_check(vk_control) && keyboard_check_pressed(ord("X")) && os_type == os_windows && argument1 == true)
				{
					clipboard_set_text(keyboard_string);
					keyboard_string = "";
					selectAll = false;
				}
				//Ctrl+C - Copy (Windows only)
				if (keyboard_check(vk_control) && keyboard_check_pressed(ord("C")) && os_type == os_windows && argument1 == true)
				{clipboard_set_text(keyboard_string);}
				//Write over select all
				if (keyboard_check_pressed(vk_anykey))
				{
					switch (argument0)
					{
						case 0:
						var _valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890`~!@#$%^&*()-_=+[{]}\\|;:,<.>/?' \"";
						break;
						case 1:
						var _valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
						break;
						case 2:
						var _valid = "1234567890";
						break;
						case 3:
						var _valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
						break;
					}
					if (string_pos(keyboard_lastchar,_valid) != 0)
					{
						keyboard_string = keyboard_lastchar;
						selectAll = false;
					}
				}
			}
		}
	
		//select all
		if (keyboard_check(vk_control) && keyboard_check_pressed(ord("A")) && string_length(keyboard_string) >= 1)
		{selectAll = true;}
	
		//Ctrl+V - Paste (Windows only)
		if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) && os_type == os_windows && argument2 == true)
		{
			if (clipboard_has_text())
			{
				if (selectAll == true)
				{
					var _paste = clipboard_get_text();
					//limit paste
					if (hidden == true)
					{
						draw_set_font(hiddenFont);
						while (string_width(string_repeat(hiddenSymbol,string_length(_paste))) > maxWidth)
						{_paste = string_copy(_paste,1,string_length(_paste)-1);}
					}
					else
					{
						draw_set_font(font);
						while (string_width(_paste) > maxWidth)
						{_paste = string_copy(_paste,1,string_length(_paste)-1);}
					}
					//paste
					keyboard_string = _paste;
					selectAll = false;
				}
				else
				{
					var _paste = keyboard_string+clipboard_get_text();
					//limit paste
					if (hidden == true)
					{
						draw_set_font(hiddenFont);
						while (string_width(string_repeat(hiddenSymbol,string_length(_paste))) > maxWidth)
						{_paste = string_copy(_paste,1,string_length(_paste)-1);}
					}
					else
					{
						draw_set_font(font);
						while (string_width(_paste) > maxWidth)
						{_paste = string_copy(_paste,1,string_length(_paste)-1);}
					}
					//paste
					keyboard_string = _paste;
				}
				keyboard_string = string_replace_all(keyboard_string,chr($000D)+chr($000A),"");//remove carriage returns
			}
		}

		//limit input
		if (hidden == true)
		{
			draw_set_font(hiddenFont);
			if (string_width(string_repeat(hiddenSymbol,string_length(keyboard_string))) > maxWidth)
			{keyboard_string = string_copy(keyboard_string,1,string_length(keyboard_string)-1);}
		}
		else
		{
			draw_set_font(font);
			if (string_width(keyboard_string) > maxWidth)
			{keyboard_string = string_copy(keyboard_string,1,string_length(keyboard_string)-1);}
		}

		//take input
		switch (argument0)
		{
			case 0:
			text = keyboard_string;
			break;
			case 1:
			text = string_letters(keyboard_string);
			break;
			case 2:
			text = string_digits(keyboard_string);
			break;
			case 3:
			text = string_lettersdigits(keyboard_string);
			break;
		}
		keyboard_string = text;
	
		//hide text
		if (hidden == true)
		{displayText = string_repeat(hiddenSymbol,string_length(text));}
		else
		{displayText = text;}
	}
}
