#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause Initialization

var i;

audio_pause_all();
audio_play_sfx("snd_menu_open", true);

menu_lock = false;
menu_alarm = 0;
menu_hide = 0;
menu_index = 0;
menu_count = 2;
menu_option[0] = 0;
menu_option[1] = 0;

pause_active = true;
pause_mode = -1;
pause_header = spr_pause_header;
pause_menu = spr_pause_menu;
pause_leading = 3;
pause_x = screen_get_width() / 2;

for (i = 0; i < menu_count; i += 1)
{
    pause_height[i] = 0;
    pause_y[i] = 0;
}

pause_count[0] = (sprite_get_number(pause_menu) / 2) - 2;
pause_count[1] = 2;

event_user(1);

fade_handle = noone;
transition_handle = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

if (game_ispaused(ctrl_text) || menu_lock || menu_alarm > 0) exit;

if (input_get_check(INP_HIDE, CHECK_PRESSED))
{
    menu_hide += 1;
    menu_hide = wrap(menu_hide, 0, 1 + (game_get_config("misc_hud") != 0 || instance_exists(ctrl_transition)));
}

if (input_get_check(INP_CANCEL, CHECK_PRESSED))
{
    if (menu_hide != 0) menu_hide = 0;
    else
    {
        switch (menu_index)
        {
            // Reset:
            case 1:
                event_user(1);
                break;

            // Continue:
            default:
                event_user(0);
        }

        audio_play_sfx("snd_menu_close", true);
    }
}

with (par_overlay)
{
    if (visible != (other.menu_hide != 2)) visible = (other.menu_hide != 2);
}

if (menu_hide != 0) exit;

var menu_up, menu_down, menu_direction;

menu_up = (input_get_check(INP_UP, CHECK_PRESSED) || input_get_time(INP_UP, 30));
menu_down = (input_get_check(INP_DOWN, CHECK_PRESSED) || input_get_time(INP_DOWN, 30));
menu_direction = menu_down - menu_up;
if (menu_direction != 0) audio_play_sfx("snd_menu_move", true);

menu_option[menu_index] += menu_direction;
menu_option[menu_index] = wrap(menu_option[menu_index], 0, pause_count[menu_index] - 1);

if (input_get_check(INP_CONFIRM, CHECK_PRESSED))
{
    switch (menu_index)
    {
        // Pause:
        case 0:
            if (menu_option[menu_index] == 0) event_user(0);
            else
            {
                menu_index = 1;
                menu_option[menu_index] = 0;
            }
            break;

        // Confirm:
        case 1:
            // No:
            if (menu_option[menu_index] == 1) event_user(1);

            // Yes:
            else
            {
                switch (menu_option[0])
                {
                    case 1:
                    case 2:
                        fade_handle = fade_create(2, 0.02, depth);
                        break;
                }

                menu_lock = true;
                menu_alarm = 2;
                pause_mode = menu_option[0];
            }
            break;
    }

    audio_play_sfx("snd_menu_confirm", true);
}

if (input_get_check(INP_START, CHECK_PRESSED))
{
    event_user(0);
    audio_play_sfx("snd_menu_close", true);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Position

var i;

for (i = 0; i < menu_count; i += 1)
{
    pause_height[i] = (sprite_get_height(pause_header) + pause_leading) + (sprite_get_height(pause_menu) * pause_count[i]) + (pause_leading * (pause_count[i] - 1));
    pause_y[i] = (view_yview[view_current] + screen_get_height() / 2) - (pause_height[i] / 2);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Mode

if (!menu_lock) exit;

if (menu_alarm > 0) menu_alarm -= 1;

switch (pause_mode)
{
    // Continue:
    case 0:
        if (menu_alarm == 0)
        {
            pause_active = false;
            audio_resume_all();
            instance_destroy();
        }
        break;

    // Restart:
    case 1:
    case 2:
        if (instance_exists(fade_handle))
        {
            if (fade_handle.fade_alpha == 2)
            {
                if (!instance_exists(transition_handle))
                {
                    with (ctrl_transition) persistent = false;
                    transition_handle = transition_create(room);
                    transition_handle.depth = depth;
                    transition_handle.pause_ignore = true;
                    transition_handle.load_skip = true;

                    if (pause_mode == 2)
                    {
                        fade_handle.persistent = true;
                        fade_handle.fade_alpha = 1;
                        fade_handle.fade_target = 1;
                        transition_handle.transition_id = TRANS_FADE;
                        transition_handle.transition_state = 1;
                        transition_handle.transition_room = rm_debug;
                        transition_handle.fade_handle = fade_handle;
                    }

                    audio_stop_all();
                    audio_resume_all();
                }
            }
        }
        break;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Continue

menu_lock = true;
menu_alarm = 2;
pause_mode = 0;
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset

menu_index = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu

if (menu_hide != 0) exit;

var i, menu_offset, menu_height, menu_y;

menu_offset = 0;

// Fade:
draw_set1(c_black, 0.6);
draw_rectangle(view_xview[view_current], view_yview[view_current], view_xview[view_current] + screen_get_width(), view_yview[view_current] + screen_get_height(), false);
draw_reset();

// Header:
draw_sprite(pause_header, pick(menu_index, 0, menu_option[0]), view_xview[view_current] + pause_x, pause_y[menu_index]);

// Menu:
menu_offset = pick(menu_index, 0, 3);
menu_height = sprite_get_height(pause_menu) + pause_leading;
menu_y = pause_y[menu_index] + sprite_get_height(pause_header) + pause_leading;

for (i = 0; i < pause_count[menu_index]; i += 1)
{
    draw_sprite(pause_menu, ((i + menu_offset) * 2) + (menu_option[menu_index] == i), view_xview[view_current] + pause_x, menu_y + (menu_height * i));
}
