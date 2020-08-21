//get relative click position
if set_ref == true {
    set_ref = false;
    xx = x - mouse_x;
}

if drag == true{
    //if we slide within the constraints, update the sliders coordinate
    if ((mouse_x + xx) > leftLimit) && ((mouse_x + xx < rightLimit)) {
        x = mouse_x + xx;
    }
        //set at left limit if user wants to slide it too far left
        else if ((mouse_x + xx) < leftLimit){
            x = leftLimit;
        }
        //set at right limit if user wants to slide it too far right
            else if ((mouse_x + xx) > rightLimit) {
                x = rightLimit;
            }
}

//work out the percentage value
percentage = round(((x-leftLimit)/(rightLimit-leftLimit))*100)*0.01;
global.effects_level = percentage;
var ee;
if global.effects_level > 0 { ee = (global.effects_level-(global.zoom_level*(0.1*global.effects_level)))+0.05; }
    else ee = 0;
audio_group_set_gain(Effects, ee, 200); 

