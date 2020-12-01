unit_class = "";
my_unit = "";
unit_cost = 0;
my_sprite = sprite_index;
my_indicator = spr_Indicator_Green;
t_colour = make_colour_rgb(169,169,169);
icon_sprite = -1;
can_drag = false;
auto_assign = false;
clear = false;
count = 0;
unit_change = false;

with instance_create_layer(x-42, y, "Buttons", obj_Select_L) { parent = other.id; }
with instance_create_layer(x+42, y, "Buttons", obj_Select_R) { parent = other.id; }


