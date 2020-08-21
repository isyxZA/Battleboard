with(obj_Enemy_Parent){
    if is_visible == false && is_spotted == true {
        var sa = spot_count*0.2;
        mask_alpha = lerp(mask_alpha, sa, 0.01);
        switch unit_type {
            case "E_INFANTRY":
                draw_sprite_ext(spot_mask, 0, spotted_x, spotted_y, 1, 1, 0, c_white, mask_alpha);
                break;
            case "E_TANK":
                draw_sprite_ext(spot_mask, 0, spotted_x, spotted_y, 1, 1, 0, c_white, mask_alpha);
                break;
            case "E_ENGINEER":
                draw_sprite_ext(spot_mask, 0, spotted_x, spotted_y, 1, 1, 0, c_white, mask_alpha);
                break;
            case "E_BTR":
                draw_sprite_ext(spot_mask, 0, spotted_x, spotted_y, 1, 1, 0, c_white, mask_alpha);
                break;
            case "E_LOGI":
                draw_sprite_ext(spot_mask, 0, spotted_x, spotted_y, 1, 1, 0, c_white, mask_alpha);
                break;
            case "E_DEPOT":
                draw_sprite_ext(spot_mask, 0, spotted_x, spotted_y, 1, 1, 0, c_white, mask_alpha);
                break;
            case "E_REPAIR":
                draw_sprite_ext(spot_mask, 0, spotted_x, spotted_y, 1, 1, 0, c_white, mask_alpha);
                break;
            case "E_TOW":
                draw_sprite_ext(spot_mask, 0, spotted_x, spotted_y, 1, 1, 0, c_white, mask_alpha);
                break;
            case "E_MORTAR":
                draw_sprite_ext(spot_mask, 0, spotted_x, spotted_y, 1, 1, 0, c_white, mask_alpha);
                break;
            default:
                break;
        }
    }
}
/*
with(obj_Trees){
    if discovered == true {
        draw_sprite_ext(forest_cover, 0, x, y, xscl, yscl, rot+30,c_white, light_strength);
    }
}
with(obj_Houses){
    if discovered == true {
        draw_sprite_ext(my_house,0, x, y, 1, 1, 0,c_white, light_strength);
    }
}
*/

