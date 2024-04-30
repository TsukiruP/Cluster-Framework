#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause Initialization

// Pause audio:
sound_pause_all();

// Menu variables:
menu_level     = 0;
menu_selection = 0;
menu_lock      = false;

sub_level      = 0;
sub_selection  = 0;

// Pause variables:
pause_hide     = 0;
pause_sprite   = spr_pause;
pause_position = global.display_width + sprite_get_width(pause_sprite);
pause_speed    = 0;
pause_target   = global.display_width / 2;
pause_delay    = 2;
pause_active   = true;

sub_distance   = pause_target + sprite_get_width(pause_sprite);

// Handle:
fade_handle       = noone;
transition_handle = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Navigation

// Don't bother if the game is paused:
if (game_paused(ctrl_text)) exit;

var menu_down, menu_up, menu_direction;

// Exit if some menu behavior has been executed:
if (menu_lock == true) exit;

// Input delay:
if (pause_delay == 0) {
    // Hide pause:
    if (input_check(INP_SELECT, CHECK_PRESSED)) {
        pause_hide += 1;
        pause_hide  = wrap(pause_hide, 0, 1 + (instance_exists(ctrl_transition) || global.misc_hud != 0));
    }

    // Cancel:
    if (input_check(INP_CANCEL, CHECK_PRESSED)) {
        if (pause_hide == 0) {
            switch (menu_level) {
                case 1:
                    event_user(1);
                    break;

                default:
                    event_user(0);
            }
        }

        // Reset appearance:
        else {
            pause_hide = 0;
        }
    }
}

// Hide fade:
if (pause_hide != 0) fade_handle.visible = false;
else fade_handle.visible = true;

// Hide overlays:
if (pause_hide == 2) par_overlay.visible = false;
else par_overlay.visible = true;

// Exit if hiding the menu:
if (pause_hide != 0) exit;

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

// Input delay:
if (pause_delay == 0) {
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
                    event_user(0);
                }
                break;

            // Sub menu:
            case 1:
                if (sub_selection == 0) {
                    switch (sub_level) {
                        // Restart
                        case 0:
                            menu_lock   = true;
                            fade_handle = fade_create(0.02, 2, depth);
                            break;
                    }
                }

                // Return to pause menu:
                else {
                    event_user(1);
                }
                break;
        }
    }

    // Start:
    if (input_check(INP_START, CHECK_PRESSED)) {
        event_user(0);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Continue

if (pause_delay > 0) {
    pause_delay -= 1;

    if (pause_delay == 0 && menu_lock == true) {
        pause_target = global.display_width + sprite_get_width(pause_sprite);
        pause_active = false;

        sound_resume_all();
        fade_reverse(fade_handle);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Restart

if (menu_lock == false) exit;

if (instance_exists(fade_handle)) {
    if (fade_handle.fade_alpha == 2) {
        if (transition_handle == noone) {
            transition_handle                  = transition_create(room);
            transition_handle.depth            = depth;
            transition_handle.pause_ignore     = true;
            transition_handle.transition_timer = 0.50;
        }

        sound_stop_all();
        sound_resume_all();
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
/// Set Pause Delay

menu_lock   = true;
pause_delay = 2;
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset Menu

pause_target = global.display_width / 2;
menu_level   = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu

// Don't draw if hidden:
if (pause_hide != 0) exit;

// Pause menu:
draw_sprite(pause_sprite, menu_selection, view_xview[view_current] + pause_position, view_yview[view_current] + global.display_height / 2);

// Sub menu:
draw_sprite(pause_sprite, 3 + sub_selection + sub_level * 2, view_xview[view_current] + pause_position + sub_distance, view_yview[view_current] + global.display_height / 2);
