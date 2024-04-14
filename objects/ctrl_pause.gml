#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause Initialization

// Pause:
global.game_pause = true;
sound_pause_all();

// Menu variables:
menu_level     = 0;
menu_selection = 0;

sub_level      = 0;
sub_selection  = 0;

// Pause variables:
pause_sprite   = spr_pause;
pause_position = global.display_width + sprite_get_width(pause_sprite);
pause_speed    = 0;
pause_target   = global.display_width / 2;
pause_delay    = 0;

sub_distance   = pause_target + sprite_get_width(pause_sprite);
sub_lock       = false;

// Fade handle:
fade_handle = fade_create(0.06, 0.6);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Navigation

// Exit if some sub menu behavior has been executed:
if (sub_lock == true) exit;

var menu_down, menu_up, menu_direction;

// Menu direction:
menu_down = input_check(INP_DOWN, CHECK_PRESSED);
menu_up   = input_check(INP_UP, CHECK_PRESSED);

menu_direction = menu_down - menu_up;

// Menu selection:
if (menu_level == 0) {
    menu_selection += menu_direction;
    menu_selection  = wrap(menu_selection, 0, 2);
}

// Sub selection:
else {
    sub_selection += menu_direction;
    sub_selection  = wrap(sub_selection, 0, 1);
}

// Accept:
if (input_check(INP_ACCEPT, CHECK_PRESSED)) {
    switch (menu_level) {
        // Pasue menu:
        case 0:
            if (menu_selection != 0) {
                menu_level    =  1;
                sub_level     =  menu_selection - 1;
                sub_selection =  0;
                pause_target  = -sprite_get_width(pause_sprite);
            }

            // Return to gameplay:
            else {
                var pause_delay;
                pause_delay = 1;

                if (pause_delay > 0) {
                    pause_delay -= 1;

                    if(pause_delay == 0) event_user(0);
                }
            }
            break;

        // Sub menu:
        case 1:
            if (sub_selection == 0) {

            }

            // Return to pause menu:
            else {
                event_user(1);
            }
            break;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Return to Gameplay

if (pause_delay > 0) {
    pause_delay -= 1;

    if (pause_delay == 0) {
        pause_target = global.display_width + sprite_get_width(pause_sprite);
        global.game_pause = false;
        sound_resume_all();
        fade_reverse(fade_handle);
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if (pause_position != pause_target) {
    pause_speed     = ceil(abs(pause_position - pause_target) / 3);
    pause_position -= pause_speed * sign(pause_position - pause_target);

    if (pause_position == pause_target) {
        pause_speed    = 0;
        pause_position = pause_target;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

if (pause_position == pause_target && !instance_exists(fade_handle)) instance_destroy();
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause Delay:

pause_delay = 2;
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Return to Pause Menu

pause_target = global.display_width / 2;
menu_level   = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu

// Pause menu:
draw_sprite(pause_sprite, menu_selection, view_xview[view_current] + pause_position, view_yview[view_current] + global.display_height / 2);

// Sub menu:
draw_sprite(pause_sprite, 3 + sub_selection + sub_level * 2, view_xview[view_current] + pause_position + sub_distance, view_yview[view_current] + global.display_height / 2);
