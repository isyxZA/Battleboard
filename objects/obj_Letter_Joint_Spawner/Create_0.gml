anchor_1  = instance_create_layer(x-460, y, "Buttons", obj_Letter_Anchor);
anchor_2  = instance_create_layer(x-360, y, "Buttons", obj_Letter_Anchor);
anchor_3  = instance_create_layer(x-260, y, "Buttons", obj_Letter_Anchor);
anchor_4  = instance_create_layer(x-160, y, "Buttons", obj_Letter_Anchor);
anchor_5  = instance_create_layer(x-60, y, "Buttons", obj_Letter_Anchor);
anchor_6  = instance_create_layer(x+60, y, "Buttons", obj_Letter_Anchor);
anchor_7  = instance_create_layer(x+160, y, "Buttons", obj_Letter_Anchor);
anchor_8  = instance_create_layer(x+260, y, "Buttons", obj_Letter_Anchor);
anchor_9  = instance_create_layer(x+360, y, "Buttons", obj_Letter_Anchor);
anchor_10 = instance_create_layer(x+460, y, "Buttons", obj_Letter_Anchor);

obj_1  = instance_create_layer(x-560, y, "Buttons", obj_Letter_Ball);
obj_2  = instance_create_layer(x-460, y, "Buttons", obj_Letter_Ball);
obj_3  = instance_create_layer(x-360, y, "Buttons", obj_Letter_Ball);
obj_4  = instance_create_layer(x-260, y, "Buttons", obj_Letter_Ball);
obj_5  = instance_create_layer(x-160, y, "Buttons", obj_Letter_Ball);
obj_6  = instance_create_layer(x+160, y, "Buttons", obj_Letter_Ball);
obj_7  = instance_create_layer(x+260, y, "Buttons", obj_Letter_Ball);
obj_8  = instance_create_layer(x+360, y, "Buttons", obj_Letter_Ball);
obj_9  = instance_create_layer(x+460, y, "Buttons", obj_Letter_Ball);
obj_10 = instance_create_layer(x+560, y, "Buttons", obj_Letter_Ball);

obj_1.txt  = "I";
obj_2.txt  = "s";
obj_3.txt  = "a";
obj_4.txt  = "a";
obj_5.txt  = "c";
obj_6.txt  = "S";
obj_7.txt  = "y";
obj_8.txt  = "k";
obj_9.txt  = "e";
obj_10.txt = "s";

j1  = physics_joint_rope_create(anchor_1, obj_1, anchor_1.x, anchor_1.y, obj_1.x, obj_1.y, random_range(380,400), false);
j2  = physics_joint_rope_create(anchor_2, obj_2, anchor_2.x, anchor_2.y, obj_2.x, obj_2.y, random_range(380,400), false);
j3  = physics_joint_rope_create(anchor_3, obj_3, anchor_3.x, anchor_3.y, obj_3.x, obj_3.y, random_range(380,400), false);
j4  = physics_joint_rope_create(anchor_4, obj_4, anchor_4.x, anchor_4.y, obj_4.x, obj_4.y, random_range(380,400), false);
j5  = physics_joint_rope_create(anchor_5, obj_5, anchor_5.x, anchor_5.y, obj_5.x, obj_5.y, random_range(380,400), false);
j6  = physics_joint_rope_create(anchor_6, obj_6, anchor_6.x, anchor_6.y, obj_6.x, obj_6.y, random_range(380,400), false);
j7  = physics_joint_rope_create(anchor_7, obj_7, anchor_7.x, anchor_7.y, obj_7.x, obj_7.y, random_range(380,400), false);
j8  = physics_joint_rope_create(anchor_8, obj_8, anchor_8.x, anchor_8.y, obj_8.x, obj_8.y, random_range(380,400), false);
j9  = physics_joint_rope_create(anchor_9, obj_9, anchor_9.x, anchor_9.y, obj_9.x, obj_9.y, random_range(380,400), false);
j10 = physics_joint_rope_create(anchor_10, obj_10, anchor_10.x, anchor_10.y, obj_10.x, obj_10.y, random_range(380,400), false);

instance_create_layer(mouse_x, mouse_y, "Buttons", obj_Phys_Ball);



