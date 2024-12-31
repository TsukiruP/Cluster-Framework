#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause Initialization

var i;

// Pause audio:
audio_pause_all();
audio_sfx_play("snd_menu_open", true);

// Menu variables:
menu_lock = false;
menu_alarm = 0;
menu_hide = 0;
menu_index = 0;
menu_count = 2;

menu_option[0] = 0;
menu_option[1] = 0;

// Pause variables:
pause_active = true;
pause_mode = -1;

pause_header = spr_pause_header;
pause_menu = spr_pause_menu;
pause_leading = 3;
pause_fade = 0;

for (i = 0; i < menu_count; i += 1)
{
    pause_x_current[i] = screen_get_width() + sprite_get_width(pause_menu);
    pause_x_speed[i] = 0;

    pause_height[i] = 0;
    pause_x[i] = 0;
    pause_y[i] = 0;
}

pause_count[0] = (sprite_get_number(pause_menu) / 2) - 2;
pause_count[1] = 2;

event_user(1);

// Handles:
fade_handle = noone;
transition_handle = noone;

/*
// Menu variables:
menu_current = 0;
menu_lock = false;
menu_count = 2;

for (i = 0; i < menu_count; i += 1)
{
    menu_option[i] = 0;
}

// Pause variables:
pause_hide = 0;
pause_continue = false;
pause_delay = 2;
pause_active = true;

pause_header = spr_pause_header;
pause_menu = spr_pause_menu;
pause_space = 3;
pause_fade = 0;

for (i = 0; i < menu_count; i += 1)
{
    pause_x_current[i] = screen_get_width() + sprite_get_width(pause_menu);
    pause_x_speed[i] = 0;

    pause_height[i] = 0;
    pause_x[i] = 0;
    pause_y[i] = 0;
}

pause_count[0] = (sprite_get_number(pause_menu) / 2) - 2;
pause_count[1] = 2;

event_user(1);
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

// Exit if text is active or menu has been locked:
if (game_ispaused(mgr_text) || menu_lock == true || menu_alarm > 0)
{
    exit;
}

// Hide:
if (input_get_check(INP_HIDE, CHECK_PRESSED))
{
    menu_hide += 1;
    menu_hide = wrap(menu_hide, 0, 1 + (instance_exists(mgr_transition) || game_config_get("misc_hud") != 0));
}

// Cancel:
if (input_get_check(INP_CANCEL, CHECK_PRESSED))
{
    if (menu_hide != 0)
    {
        menu_hide = 0;
    }
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

        // Play sound:
        audio_sfx_play("snd_menu_close", true);
    }
}

// Hide overlays:
with (par_overlay)
{
    if (visible != (other.menu_hide != 2))
    {
        visible = (other.menu_hide != 2);
    }
}

// Exit if hidden:
if (menu_hide != 0)
{
    exit;
}

var menu_up, menu_down, menu_direction;

// Menu direction:
menu_up = (input_get_check(INP_UP, CHECK_PRESSED) || input_get_time(INP_UP, 30));
menu_down = (input_get_check(INP_DOWN, CHECK_PRESSED) || input_get_time(INP_DOWN, 30));
menu_direction = menu_down - menu_up;

// Menu option:
menu_option[menu_index] += menu_direction;
menu_option[menu_index] = wrap(menu_option[menu_index], 0, pause_count[menu_index] - 1);

// Play sound:
if (menu_direction != 0)
{
    audio_sfx_play("snd_menu_move", true);
}

// Confirm:
if (input_get_check(INP_CONFIRM, CHECK_PRESSED))
{
    switch (menu_index)
    {
        // Pause:
        case 0:
            // Continue:
            if (menu_option[menu_index] == 0)
            {
                event_user(0);
            }

            // Go to confirm menu:
            else
            {
                menu_index = 1;
                menu_option[menu_index] = 0;
                pause_x_target[menu_index] = pause_x_target[0];
            }

            // Move to the left:
            pause_x_target[0] = -sprite_get_width(pause_menu);
            break;

        // Confirm:
        case 1:
            // No:
            if (menu_option[menu_index] == 1)
            {
                event_user(1);
            }

            // Yes:
            else
            {
                switch (menu_option[0])
                {
                    // Restart:
                    case 1:
                    case 2:
                        fade_handle = fade_create(2, 0.02, depth);
                        break;
                }

                // Pause mode:
                menu_lock = true;
                menu_alarm = 2;
                pause_mode = menu_option[0];

                // Move to the left:
                pause_x_target[menu_index] = -sprite_get_width(pause_menu);
            }
            break;
    }

    // Play sound:
    audio_sfx_play("snd_menu_confirm", true);
}

// Start:
if (input_get_check(INP_START, CHECK_PRESSED))
{
    event_user(0);

    // Play sound:
    audio_sfx_play("snd_menu_close", true);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Position

var i;

// Height:
for (i = 0; i < menu_count; i += 1)
{
    pause_height[i] = (sprite_get_height(pause_header) + pause_leading) + (sprite_get_height(pause_menu) * pause_count[i]) + (pause_leading * (pause_count[i] - 1));
    pause_x[i] = view_xview[view_current] + pause_x_current[i];
    pause_y[i] = (view_yview[view_current] + screen_get_height() / 2) - (pause_height[i] / 2);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Mode

// Exit if menu hasn't been locked:
if (menu_lock == false)
{
    exit;
}

// Delay:
if (menu_alarm > 0)
{
    menu_alarm -= 1;
}

switch (pause_mode)
{
    // Continue:
    case 0:
        if (menu_alarm == 0)
        {
            pause_active = false;
            
            // Resume audio:
            audio_resume_all();
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
                    with (mgr_transition)
                    {
                        persistent = false;
                    }
        
                    transition_handle = transition_create(room);
                    transition_handle.depth = depth;
                    transition_handle.pause_ignore = true;
                    transition_handle.load_skip = true;
                    transition_handle.transition_alarm = 0;
                    
                    if (pause_mode == 2)
                    {
                        fade_handle.persistent = true;
                        fade_handle.fade_alpha = 1;
                        transition_handle.transition_id = TRANS_FADE;
                        transition_handle.transition_state = 1;
                        transition_handle.transition_room = rm_debug;
                        transition_handle.fade_handle = fade_handle;
                    }
                    
                    // Stop audio:
                    audio_stop_all();
                    audio_resume_all();
                }
            }
        }
        break;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade

// Fade out:
if (pause_mode == 0)
{
    if (pause_fade > 0)
    {
        pause_fade -= 0.06;
    }
}

// Fade in:
else
{
    if (pause_fade < 0.6)
    {
        pause_fade += 0.06;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

var i;

for (i = 0; i < menu_count; i += 1)
{
    if (pause_x_current[i] != pause_x_target[i])
    {
        var pause_x_distance;

        // Pause distance:
        pause_x_distance = pause_x_target[i] - pause_x_current[i];

        pause_x_speed[i] = ceil(abs(pause_x_distance) / 3);
        pause_x_current[i] += pause_x_speed[i] * sign(pause_x_distance);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

var i, pause_destroy;

pause_destroy = false;

for (i = 0; i < menu_count; i += 1)
{
    // Don't destroy yet:
    if (pause_x_current[i] != pause_x_target[i])
    {
        break;
    }
    else
    {
        if (menu_lock == true && menu_count - 1 = i)
        {
            pause_destroy = true;
        }
    }
}

if (pause_destroy == true && pause_fade == 0)
{
    instance_destroy();
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Continue

var i;

menu_lock = true;
menu_alarm = 2;

pause_mode = 0;
pause_x_target[0] = -sprite_get_width(pause_menu);

for (i = 0; i < menu_count; i += 1)
{
    if ((pause_x_target[i] != screen_get_width() + sprite_get_width(pause_menu)) && (pause_x_target[i] != -sprite_get_width(pause_menu)))
    {
        pause_x_target[i] = -sprite_get_width(pause_menu);
    }
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset

var i;

menu_index = 0;
pause_x_target[0] = screen_get_width() / 2;

for (i = 1; i < menu_count; i += 1)
{
    pause_x_target[i] = screen_get_width() + sprite_get_width(pause_menu);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu

// Exit if hidden:
if (menu_hide != 0)
{
    exit;
}

var i, j, menu_offset, menu_height, menu_y;

// Reset offset:
menu_offset = 0;

// Fade:
draw_set1(c_black, pause_fade);
draw_rectangle(view_xview[view_current], view_yview[view_current], view_xview[view_current] + screen_get_width(), view_yview[view_current] + screen_get_height(), false);

// Reset:
draw_reset();

// Height:
menu_height = sprite_get_height(pause_menu) + pause_leading;

for (i = 0; i < menu_count; i += 1)
{
    // Header:
    if (i == 1)
    {
        draw_sprite(pause_header, menu_option[0], pause_x[i], pause_y[i]);
    }
    else
    {
        draw_sprite(pause_header, i, pause_x[i], pause_y[i]);
    }

    // Menu:
    menu_y = pause_y[i] + sprite_get_height(pause_header) + 3;

    for (j = 0; j < pause_count[i]; j += 1)
    {
        draw_sprite(pause_menu, ((j + menu_offset) * 2) + (menu_option[i] == j), pause_x[i], menu_y + (menu_height * j));
    }

    // Update offset:
    menu_offset += pause_count[i];
}
