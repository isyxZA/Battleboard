if p_one == true {
	if cloud_posx > -512 { cloud_posx -= 0.2; }
		else { 
			cloud_posx = random_range(room_width*0.2, room_width+512);
			if cloud_posx > room_width { cloud_posy = random_range(room_height*0.2, room_height*0.8); }
				else { cloud_posy = random_range(-512, -256); }
		}
	if cloud_posy < room_height+512 { cloud_posy += 0.1; }
		else {  
			cloud_posx = random_range(room_width*0.2, room_width+512);
			if cloud_posx > room_width { cloud_posy = random_range(room_height*0.2, room_height*0.8); }
				else { cloud_posy = random_range(-512, -256); }
		}
}
	else {
		if cloud_posx < room_width+512 { cloud_posx += 0.2; }
			else { 
				cloud_posx = random_range(room_width-512,room_width*0.2);
				if cloud_posx < 0 { cloud_posy = random_range(room_height*0.2, room_height*0.8); }
					else { cloud_posy = random_range(room_height+512, room_height+256); }
			}
		if cloud_posy > -512 { cloud_posy -= 0.1; }
			else {  
				cloud_posx = random_range(room_width-512,room_width*0.2);
				if cloud_posx < 0 { cloud_posy = random_range(room_height*0.2, room_height*0.8); }
					else { cloud_posy = random_range(room_height+512, room_height+256); }
			}
	}

cloud_a1 = cloud_aref*global.menu_ratio;
cloud_a2 = cloud_a1-global.light_level;
shadow_a = cloud_a1-0.2;

x = cloud_posx;
y = cloud_posy;
