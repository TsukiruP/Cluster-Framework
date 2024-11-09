#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause Initialization

// Pause audio:
//sound_pause_all();

// Menu variables:
menu_current = 0;
menu_lock = false;
menu_count = 2;

for (i = 0; i < menu_count; i += 1)
{
    menu_selection[i] = 0;
}

// Pause variables:
pause_hide = 0;
pause_continue = false;
pause_delay = 2;
pause_active = true;

pause_header = spr_pause_header;
pause_menu = spr_pause_menu;
pause_space = 3;

for (i = 0; i < menu_count; i += 1)
{
    pause_x_current[i] = global.display_width + sprite_get_width(pause_menu);
    pause_x_speed[i] = 0;
}

pause_count[0] = (sprite_get_number(pause_menu) / 2) - 2;
pause_count[1] = 2;
pause_height = 0;

pause_x = 0;
pause_y = 0;

event_user(1);

// Handles:
fade_handle = noone;
transition_handle = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu

// Exit if text is active:
if (game_ispaused(mgr_text))
{
    exit;
}

var menu_up, menu_down, menu_direction;

// Exit if some menu behavior has been executed:
if (menu_lock == true)
{
    exit;
}

// Input delay:
if (pause_delay == 0)
{
    // Hide pause:
    if (input_get_check(INP_SELECT, CHECK_PRESSED))
    {
        pause_hide += 1;
        pause_hide = wrap(pause_hide, 0, 1 + (instance_exists(mgr_transition) || global.misc_hud != 0));
    }

    // Cancel:
    if (input_get_check(INP_CANCEL, CHECK_PRESSED))
    {
        if (pause_hide == 0)
        {
            switch (menu_current)
            {
                case 1:
                    event_user(1);
                    break;

                default:
                    event_user(0);
            }
        }

        // Reset appearance:
        else
        {
            pause_hide = 0;
        }
    }
}

// Hide fade:
if (pause_hide != 0)
{
    fade_handle.visible = false;
}
else
{
    fade_handle.visible = true;
}

// Hide overlays:
if (pause_hide == 2)
{
    par_overlay.visible = false;
}
else
{
    par_overlay.visible = true;
}

// Exit if hiding the menu:
if (pause_hide != 0)
{
    exit;
}

// Menu direction:
menu_up = input_get_check(INP_UP, CHECK_PRESSED);
menu_down = input_get_check(INP_DOWN, CHECK_PRESSED);
menu_direction = menu_down - menu_up;

// Menu selection:
menu_selection[menu_current] += menu_direction;
menu_selection[menu_current] = wrap(menu_selection[menu_current], 0, pause_count[menu_current] - 1);

// Input delay:
if (pause_delay == 0)
{
    // Accept:
    if (input_get_check(INP_ACCEPT, CHECK_PRESSED))
    {
        switch (menu_current)
        {
            // Pause menu:
            case 0:
                // Open confirm menu:
                if (menu_selection[menu_current] != 0)
                {
                    menu_current = 1;
                    menu_selection[menu_current] = 0;
                    pause_x_target[1] = pause_x_target[0];
                }

                // Continue:
                else
                {
                    event_user(0);
                }

                // Move to the left:
                pause_x_target[0] = -sprite_get_width(pause_menu);
                break;

                // Confirm menu:
            case 1:
                // Yes:
                if (menu_selection[menu_current] == 0)
                {
                    // Restart:
                    if (menu_selection[0] == 1)
                    {
                        menu_lock = true;
                        fade_handle = fade_create(2, 0.02, depth);
                    }

                    // Move to the left:
                    pause_x_target[menu_current] = -sprite_get_width(pause_menu);
                }

                // No:
                else
                {
                    event_user(1);
                }
                break;
        }
    }

    // Start:
    if (input_get_check(INP_START, CHECK_PRESSED))
    {
        event_user(0);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Continue

if (pause_delay > 0)
{
    pause_delay -= 1;

    if (pause_delay == 0)
    {
        if (pause_continue == true)
        {
            pause_active = false;

            //sound_resume_all();
            fade_reverse(fade_handle);
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Restart

// Exit if some menu behavior has been executed:
if (menu_lock == false)
{
    exit;
}

if (instance_exists(fade_handle))
{
    if (fade_handle.fade_alpha == 2)
    {
        if (!instance_exists(transition_handle))
        {
            transition_handle = transition_create(room);
            transition_handle.depth = depth;
            transition_handle.pause_ignore = true;
            transition_handle.transition_alarm = 0;
        }

        //sound_stop_all();
        //sound_resume_all();
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

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
/// Position

// Height:
for (i = 0; i < menu_count; i += 1)
{
    pause_height[i] = (sprite_get_height(pause_header) + pause_space) + (sprite_get_height(pause_menu) * pause_count[i]) + (pause_space * (pause_count[i] - 1));
    pause_x[i] = view_xview[view_current] + pause_x_current[i];
    pause_y[i] = (view_yview[view_current] + global.display_height / 2) - (pause_height[i] / 2);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

var pause_destroy;

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
        if (i = menu_count - 1)
        {
            pause_destroy = true;
        }
    }
}

if (pause_destroy == true && !instance_exists(fade_handle))
{
    instance_destroy();
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set Pause Delay

menu_lock = true;
pause_continue = true;
pause_delay = 2;

pause_x_target[0] = -sprite_get_width(pause_menu);

for (i = 0; i < menu_count; i += 1)
{
    if ((pause_x_target[i] != global.display_width + sprite_get_width(pause_menu)) && (pause_x_target[i] != -sprite_get_width(pause_menu)))
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
/// Reset Menu

menu_current = 0;
pause_x_target[0] = global.display_width / 2;

for (i = 1; i < menu_count; i += 1)
{
    pause_x_target[1] = global.display_width + sprite_get_width(pause_menu);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu

// Don't draw if hidden:
if (pause_hide != 0)
{
    exit;
}

var menu_offset, menu_y, menu_height;

// Reset offset:
menu_offset = 0;

// Height:
menu_height = sprite_get_height(pause_menu) + pause_space;

for (i = 0; i < menu_count; i += 1)
{
    // Header:
    if (i == 1)
    {
        draw_sprite(pause_header, menu_selection[0], pause_x[i], pause_y[i]);
    }
    else
    {
        draw_sprite(pause_header, i, pause_x[i], pause_y[i]);
    }
    
    // Menu:
    menu_y = pause_y[i] + sprite_get_height(pause_header) + 3;
    
    for (j = 0; j < pause_count[i]; j += 1)
    {
        draw_sprite(pause_menu, ((j + menu_offset) * 2) + (menu_selection[i] == j), pause_x[i], menu_y + (menu_height * j));
    }
    
    // Update offset:
    menu_offset += pause_count[i];
}
