key = "";
key_temp = -1;
txt = "";
txt_temp = "--"
popup  = false;
can_click = false;
surf   = -1;
surf_w = sprite_get_width(spr_KeybindBG);
surf_h = sprite_get_height(spr_KeybindBG);
surf_x = (room_width *0.5)-(surf_w*0.5);
surf_y = (room_height*0.5)-(surf_h*0.5);
surf_a = 1;//alpha
surf_s = 1;//scale

btn_x1 = surf_x+32;
btn_x2 = surf_x+148;
btn_y  = surf_y+90;

btn_w = sprite_get_width(spr_Select_Button);
btn_h = sprite_get_height(spr_Select_Button);

xscale = 1;
yscale = 1;

my_sprite = spr_Menu_Box;
my_font = fnt_18;

x_adj = btn_w*0.5;
y_adj = btn_h*0.5;

alarm[0] = 10;


