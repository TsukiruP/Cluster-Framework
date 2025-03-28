#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Initialization

for ({var i; i = INP_UP}; i <= INP_HIDE; i += 1)
{
    for ({var j; j = CHECK_HELD}; j <= CHECK_RELEASED; j += 1)
    {
        input_user[i, j] = false;
        input_keyboard[i, j] = false;
    }
}

for ({var i; i = INP_UP}; i <= INP_RIGHT; i += 1)
{
    input_time[i] = 0;
}

queue_list = -1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gamepad Initialization

gamepad_list = ds_list_create();
repeat (PLAYER_COUNT) ds_list_add(gamepad_list, -1);

for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
{
    for ({var j; j = INP_UP}; j <= INP_HIDE; j += 1)
    {
        for ({var k; k = CHECK_HELD}; k <= CHECK_RELEASED; k += 1)
        {
            if (j <= INP_RIGHT)
            {
                gamepad_dpad[j, k + (i * 3)] = false;
                gamepad_analog[j, k + (i * 3)] = false;
            }

            if (j <= TRG_RIGHT) gamepad_trigger[j, k + (i * 3)] = false;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Button Initialization

// Xbox:
gamepad_button[PAD_FACE1, 0] = 0;
gamepad_button[PAD_FACE2, 0] = 1;
gamepad_button[PAD_FACE3, 0] = 2;
gamepad_button[PAD_FACE4, 0] = 3;
gamepad_button[PAD_BUMPERL, 0] = 4;
gamepad_button[PAD_BUMPERR, 0] = 5;
gamepad_button[PAD_TRIGGERL, 0] = 4;
gamepad_button[PAD_TRIGGERR, 0] = 5;
gamepad_button[PAD_SELECT, 0] = 6;
gamepad_button[PAD_START, 0] = 7;
gamepad_button[PAD_STICKL, 0] = 8;
gamepad_button[PAD_STICKR, 0] = 9;
gamepad_button[PAD_HOME, 0] = 10;
gamepad_button[PAD_SHARE, 0] = 11;

// DualSense:
gamepad_button[PAD_FACE1, 1] = 0;
gamepad_button[PAD_FACE2, 1] = 1;
gamepad_button[PAD_FACE3, 1] = 2;
gamepad_button[PAD_FACE4, 1] = 3;
gamepad_button[PAD_BUMPERL, 1] = 9;
gamepad_button[PAD_BUMPERR, 1] = 10;
gamepad_button[PAD_TRIGGERL, 1] = 4;
gamepad_button[PAD_TRIGGERR, 1] = 5;
gamepad_button[PAD_SELECT, 1] = 15;
gamepad_button[PAD_START, 1] = 6;
gamepad_button[PAD_STICKL, 1] = 7;
gamepad_button[PAD_STICKR, 1] = 8;
gamepad_button[PAD_LEFT, 1] = 13;
gamepad_button[PAD_RIGHT, 1] = 14;
gamepad_button[PAD_UP, 1] = 11;
gamepad_button[PAD_DOWN, 1] = 12;
gamepad_button[PAD_HOME, 1] = 5;
gamepad_button[PAD_SHARE, 1] = 4;

// Pro Controller:
gamepad_button[PAD_FACE1, 2] = 1;
gamepad_button[PAD_FACE2, 2] = 0;
gamepad_button[PAD_FACE3, 2] = 3;
gamepad_button[PAD_FACE4, 2] = 2;
gamepad_button[PAD_BUMPERL, 2] = 9;
gamepad_button[PAD_BUMPERR, 2] = 10;
gamepad_button[PAD_TRIGGERL, 2] = 4;
gamepad_button[PAD_TRIGGERR, 2] = 5;
gamepad_button[PAD_SELECT, 2] = 4;
gamepad_button[PAD_START, 2] = 6;
gamepad_button[PAD_STICKL, 2] = 7;
gamepad_button[PAD_STICKR, 2] = 8;
gamepad_button[PAD_LEFT, 2] = 13;
gamepad_button[PAD_RIGHT, 2] = 14;
gamepad_button[PAD_UP, 2] = 11;
gamepad_button[PAD_DOWN, 2] = 12;
gamepad_button[PAD_HOME, 2] = 5;
gamepad_button[PAD_SHARE, 2] = 15;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gamepad Registration

if (joystick_found())
{
    // Iterate through the list for removed gamepads:
    for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
    {
        if (gamepad_get(i) > joystick_count() - 1) gamepad_set(i, -1);
    }

    var player_index; player_index = ds_list_find_index(gamepad_list, -1);

    while (player_index != -1 && joystick_count() > 0)
    {
        // Set the first available gamepad:
        for ({var i; i = 0}; i < joystick_count(); i += 1)
        {
            if (!gamepad_exists(i))
            {
                ds_list_replace(gamepad_list, player_index, i);
                player_index = ds_list_find_index(gamepad_list, -1);
            }
        }

        // If seeking is still -1, that means there are no available gamepads:
        if (gamepad_get(player_index) == -1) break;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// D-pad

for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
{
    var gamepad_index; gamepad_index = gamepad_get(i);
    var check_offset; check_offset = i * 3;

    if (gamepad_index > -1)
    {
        var held_index; held_index = CHECK_HELD + check_offset;
        var pressed_index; pressed_index = CHECK_PRESSED + check_offset;
        var released_index; released_index = CHECK_RELEASED + check_offset;

        if (joystick_has_pov(gamepad_index))
        {
            var gamepad_dpad_temp;

            for ({var j; j = INP_UP}; j <= INP_RIGHT; j += 1)
            {
                gamepad_dpad_temp[j] = gamepad_dpad[j, held_index];
            }

            gamepad_dpad[INP_UP, held_index] = (joystick_pov_y(gamepad_index) == -1);
            gamepad_dpad[INP_DOWN, held_index] = (joystick_pov_y(gamepad_index) == 1);
            gamepad_dpad[INP_LEFT, held_index] = (joystick_pov_x(gamepad_index) == -1);
            gamepad_dpad[INP_RIGHT, held_index] = (joystick_pov_x(gamepad_index) == 1);

            gamepad_dpad[INP_UP, pressed_index] = (joystick_pov_y(gamepad_index) == -1 && !gamepad_dpad_temp[INP_UP]);
            gamepad_dpad[INP_DOWN, pressed_index] = (joystick_pov_y(gamepad_index) == 1 && !gamepad_dpad_temp[INP_DOWN]);
            gamepad_dpad[INP_LEFT, pressed_index] = (joystick_pov_x(gamepad_index) == -1 && !gamepad_dpad_temp[INP_LEFT]);
            gamepad_dpad[INP_RIGHT, pressed_index] = (joystick_pov_x(gamepad_index) == 1 && !gamepad_dpad_temp[INP_RIGHT]);

            gamepad_dpad[INP_UP, released_index] = (joystick_pov_y(gamepad_index) != -1 && gamepad_dpad_temp[INP_UP]);
            gamepad_dpad[INP_DOWN, released_index] = (joystick_pov_y(gamepad_index) != 1 && gamepad_dpad_temp[INP_DOWN]);
            gamepad_dpad[INP_LEFT, released_index] = (joystick_pov_x(gamepad_index) != -1 && gamepad_dpad_temp[INP_LEFT]);
            gamepad_dpad[INP_RIGHT, released_index] = (joystick_pov_x(gamepad_index) != 1 && gamepad_dpad_temp[INP_RIGHT]);
        }
        else
        {
            for ({var j; j = INP_UP}; j <= INP_RIGHT; j += 1)
            {
                var button_index; button_index = gamepad_get_button(i, PAD_LEFT + j);

                gamepad_dpad[j, held_index] = joystick_check_button(device_index, button_index);
                gamepad_dpad[j, pressed_index] = joystick_check_button_pressed(device_index, button_index);
                gamepad_dpad[j, released_index] = joystick_check_button_released(device_index, button_index);
            }
        }
    }
    else
    {
        for ({var j; j = INP_UP}; j <= INP_RIGHT; j += 1)
        {
            for ({var k; k = CHECK_HELD}; k <= CHECK_RELEASED; k += 1)
            {
                gamepad_dpad[j, k + check_offset] = false;
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Analog

for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
{
    var gamepad_index; gamepad_index = gamepad_get(i);
    var gamepad_deadzone; gamepad_deadzone = game_config_get_gamepad(i, "input_deadzone");
    var check_offset; check_offset = i * 3;

    if (gamepad_index > -1 && gamepad_deadzone != 0)
    {
        var held_index; held_index = CHECK_HELD + check_offset;
        var pressed_index; pressed_index = CHECK_PRESSED + check_offset;
        var released_index; released_index = CHECK_RELEASED + check_offset;
        var gamepad_analog_temp;

        for ({var j; j = INP_UP}; j <= INP_RIGHT; j += 1)
        {
            gamepad_analog_temp[j] = gamepad_analog[j, held_index];
        }

        joystick_set_deadzone(gamepad_deadzone);

        gamepad_analog[INP_UP, held_index] = (sign(joystick_axis(gamepad_index, 1)) == -1);
        gamepad_analog[INP_DOWN, held_index] = (sign(joystick_axis(gamepad_index, 1)) == 1);
        gamepad_analog[INP_LEFT, held_index] = (sign(joystick_axis(gamepad_index, 0)) == -1);
        gamepad_analog[INP_RIGHT, held_index] = (sign(joystick_axis(gamepad_index, 0)) == 1);

        gamepad_analog[INP_UP, pressed_index] = (sign(joystick_axis(gamepad_index, 1)) == -1 && !gamepad_analog_temp[INP_UP]);
        gamepad_analog[INP_DOWN, pressed_index] = (sign(joystick_axis(gamepad_index, 1)) == 1 && !gamepad_analog_temp[INP_DOWN]);
        gamepad_analog[INP_LEFT, pressed_index] = (sign(joystick_axis(gamepad_index, 0)) == -1 && !gamepad_analog_temp[INP_LEFT]);
        gamepad_analog[INP_RIGHT, pressed_index] = (sign(joystick_axis(gamepad_index, 0)) == 1 && !gamepad_analog_temp[INP_RIGHT]);

        gamepad_analog[INP_UP, released_index] = (sign(joystick_axis(gamepad_index, 1)) != -1 && gamepad_analog_temp[INP_UP]);
        gamepad_analog[INP_DOWN, released_index] = (sign(joystick_axis(gamepad_index, 1)) != 1 && gamepad_analog_temp[INP_DOWN]);
        gamepad_analog[INP_LEFT, released_index] = (sign(joystick_axis(gamepad_index, 0)) != -1 && gamepad_analog_temp[INP_LEFT]);
        gamepad_analog[INP_RIGHT, released_index] = (sign(joystick_axis(gamepad_index, 0)) != 1 && gamepad_analog_temp[INP_RIGHT]);
    }
    else
    {
        for ({var j; j = INP_UP}; j <= INP_RIGHT; j += 1)
        {
            for ({var k; k = CHECK_HELD}; k <= CHECK_RELEASED; k += 1)
            {
                gamepad_analog[j, k + check_offset] = false;
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Triggers

for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
{
    var gamepad_index; gamepad_index = gamepad_get(i);
    var check_offset; check_offset = i * 3;

    if (gamepad_index > -1)
    {
        for ({var j; j = TRG_LEFT}; j <= TRG_RIGHT; j += 1)
        {
            var held_index; held_index = CHECK_HELD + check_offset;
            var pressed_index; pressed_index = CHECK_PRESSED + check_offset;
            var released_index; released_index = CHECK_RELEASED + check_offset;
            var trigger_index; trigger_index = gamepad_get_button(gamepad_index, PAD_TRIGGERL + j);
            var trigger_axis; trigger_axis = joystick_axis(gamepad_index, trigger_index);
            var gamepad_trigger_temp; gamepad_trigger_temp = gamepad_trigger[j, held_index];

            gamepad_trigger[j, held_index] = trigger_axis > 0;
            gamepad_trigger[j, pressed_index] = (trigger_axis > 0 && !gamepad_trigger_temp);
            gamepad_trigger[j, released_index] = (trigger_axis <= 0 && gamepad_trigger_temp);
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

for ({var i; i = INP_UP}; i <= INP_HIDE; i += 1)
{
    input_keyboard[i, CHECK_HELD] = keyboard_check(game_config_get_key(i));
    input_keyboard[i, CHECK_PRESSED] = keyboard_check_pressed(game_config_get_key(i));
    input_keyboard[i, CHECK_RELEASED] = keyboard_check_released(game_config_get_key(i));
}

for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
{
    var gamepad_index; gamepad_index = gamepad_get(i);
    var gamepad_focus; gamepad_focus = game_config_get("input_gamepad_focus");
    var check_offset; check_offset = i * 3;

    if (gamepad_index > -1 && (gamepad_focus || (!gamepad_focus && window_has_focus())))
    {
        for ({var j; j = INP_UP}; j <= INP_HIDE; j += 1)
        {
            for ({var k; k = CHECK_HELD}; k <= CHECK_RELEASED; k += 1)
            {
                input_gamepad[j, k + check_offset] = gamepad_get_check(i, game_config_get_button(i, j), k);
            }
        }
    }
    else
    {
        for ({var j; j = INP_UP}; j <= INP_HIDE; j += 1)
        {
            for ({var k; k = CHECK_HELD}; k <= CHECK_RELEASED; k += 1)
            {
                input_gamepad[j, k + check_offset] = false;
            }
        }
    }
}

for ({var i; i = INP_UP}; i <= INP_HIDE; i += 1)
{
    input_user[i, CHECK_HELD] = (input_keyboard[i, CHECK_HELD] || input_gamepad[i, CHECK_HELD]);
    input_user[i, CHECK_PRESSED] = ((input_keyboard[i, CHECK_PRESSED] && !input_gamepad[i, CHECK_HELD]) || (input_gamepad[i, CHECK_PRESSED] && !input_keyboard[i, CHECK_HELD]));
    input_user[i, CHECK_RELEASED] = ((input_keyboard[i, CHECK_RELEASED] && !input_gamepad[i, CHECK_HELD]) || (input_gamepad[i, CHECK_RELEASED] && !input_keyboard[i, CHECK_HELD]));
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time

for ({var i; i = INP_UP}; i <= INP_RIGHT; i += 1)
{
    if (input_user[i, CHECK_HELD]) input_time[i] += 1;
    else if (input_time[i] != 0) input_time[i] = 0;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Conflicts

for ({var i; i = INP_UP}; i <= INP_RIGHT; i += 2)
{
    if (input_user[i, CHECK_HELD] && input_user[i + 1, CHECK_HELD])
    {
        input_user[i, CHECK_HELD] = false;
        input_user[i + 1, CHECK_HELD] = false;
    }
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_list_destroy(gamepad_list);
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

if (queue_list == -1) exit;

for ({var i; i = 0}; i < ds_list_size(queue_list); i += 1)
{
    ds_queue_destroy(ds_list_find_value(queue_list, i));
}

ds_list_destroy(queue_list);
queue_list = -1;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Queue Initialization

if (queue_list == -1)
{
    queue_list = ds_list_create();

    for ({var i; i = 0}; i <= QUEUE_JUMP_PRESSED; i += 1)
    {
        ds_list_add(queue_list, ds_queue_create());
    }

    input_queue_clear();
}
