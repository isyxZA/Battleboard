if clear == true {
    clear = false;
    auto_assign = false;
    ready = false;

    ds_list_clear(selector_list);
    ds_list_add(selector_list, us1.id);
    ds_list_add(selector_list, us2.id);
    ds_list_add(selector_list, us3.id);
    ds_list_add(selector_list, us4.id);
    ds_list_add(selector_list, us5.id);
    
    ds_list_clear(assigner_list);
    ds_list_add(assigner_list, sa1.id);
    ds_list_add(assigner_list, sa2.id);
    ds_list_add(assigner_list, sa3.id);
    ds_list_add(assigner_list, sa4.id);
    ds_list_add(assigner_list, sa5.id);
}

if ready == false {
    if auto_assign == true {
        //Loop thru unit selector and squad assigner lists 
        //First identify available slots in the assigner abjects
        //Place available units into available squad slots
        if !ds_list_empty(selector_list) {
            var i;
            var ssize = ds_list_size(selector_list);
            for(i=0; i<ssize; i+=1;){
                var u = ds_list_find_value(selector_list, i);
                if u.unit_amount > 0 {
                    var ii;
                    var asize = ds_list_size(assigner_list);
                    for(ii=0; ii<asize; ii+=1;){ 
                        var a = ds_list_find_value(assigner_list, ii);
                        if a.open_slots >= 1 {
                            //Assign unit
                            a.temp_sprite = u.icon_sprite;
                            a.place_unit  = u.my_unit;
                            a.selector    = u.id;
                            break;
                        }
                            else { ds_list_delete(assigner_list, ii); break; }
                    }
                }
                    else { ds_list_delete(selector_list, i); break; }
            }
        }
    }
}

