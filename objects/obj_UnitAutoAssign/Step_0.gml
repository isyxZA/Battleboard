//Determine how many units have been deployed from the ships
var i1 = ds_list_size(global.temp_alpha);
var i2 = ds_list_size(global.temp_bravo);
var i3 = ds_list_size(global.temp_charlie);
var i4 = ds_list_size(global.temp_delta);
var i5 = ds_list_size(global.temp_echo);
var itotal = i1+i2+i3+i4+i5;
//Once all squad slots are full
//Default set to 30 (6 units per squad)
if itotal == 30 && ready == false {
	ready = true;
	global.can_choose = true;
}

if itotal < 30 { 
    if global.can_choose == true { global.can_choose = false; } 
    if ready == true { ready = false; }
}







