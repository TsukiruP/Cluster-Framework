#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Center Window:

window_center();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Resolution

// 3DS ratios:
if(global.display_mode == 1) {
    // 4:3 (bottom screen):
    if(global.display_ratio == 1) {
        if(global.display_width != 320 || global.display_height != 240) {
            global.display_width  = 320;
            global.display_height = 240;
        }
    }

    // 5:3 (top screen):
    else if(global.display_ratio == 2) {
        if(global.display_width != 400 || global.display_height != 240) {
            global.display_width  = 400;
            global.display_height = 240;
        }
    }

    // 16:9:
    else {
        if(global.display_width != 426 || global.display_height != 240) {
            global.display_width  = 426;
            global.display_height = 240;
        }
    }
}

// Misc. ratio:
else if(global.display_mode == 2) {
    if(global.display_width != 420 || global.display_height != 240) {
        global.display_width  = 420;
        global.display_height = 240;
    }
}

// Default ratio:
else {
    // 4:3:
    if(global.display_ratio == 1) {
        if(global.display_width != 360 || global.display_height != 270) {
            global.display_width  = 360;
            global.display_height = 270;
        }
    }

    // 16:9:
    else {
        if(global.display_width != 480 || global.display_height != 270) {
            global.display_width  = 480;
            global.display_height = 270;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Fullscreen

if(global.display_fullscreen == true) {
    if(!window_get_fullscreen())  window_set_fullscreen(true);
} else {
    if(window_get_fullscreen()) window_set_fullscreen(false);
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Window

window_resize();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Window Caption

if(room_caption != GAME_NAME) room_caption = GAME_NAME;
window_resize();
