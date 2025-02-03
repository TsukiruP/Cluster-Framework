#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Initialization

var i, j;

for (i = INP_UP; i <= INP_HIDE; i += 1)
{
    for (j = CHECK_PRESSED; j <= CHECK_HELD; j += 1)
    {
        input_user[i, j] = false;
        input_keyboard[i, j] = false;
    }
}

for (i = INP_UP; i <= INP_RIGHT; i += 1)
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

var i, j, k;

for (i = 0; i < PLAYER_COUNT; i += 1)
{
    gamepad_device[i, 0] = -1;
    gamepad_device[i, 1] = -1;
}

for (i = PAD_FACE1; i <= PAD_DOWN; i += 1)
{
    gamepad_button[i] = -1;
}

for (i = 0; i < PLAYER_COUNT; i += 1)
{
    for (j = INP_UP; j <= INP_HIDE; j += 1)
    {
        for (k = CHECK_PRESSED; k <= CHECK_HELD; k += 1)
        {
            if (j <= INP_RIGHT)
            {
                gamepad_dpad[j, k + (i * 3)] = false;
                gamepad_analog[j, k + (i * 3)] = false;
            }

            if (j <= TRG_RIGHT)
            {
                gamepad_trigger[j, k + (i * 3)] = false;
            }
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

var i, j, k;

if (joystick_found())
{
    for (i = 0; i < PLAYER_COUNT; i += 1)
    {
        if (gamepad_device[i, 0] > joystick_count() - 1) gamepad_device[i, 0] = -1;

        if (gamepad_device[i, 0] == -1)
        {
            if (joystick_count() > 0)
            {
                for (j = 0; j < joystick_count(); j += 1)
                {
                    var gamepad_available;

                    gamepad_available = true;

                    for (k = 0; k < PLAYER_COUNT; k += 1)
                    {

                        if (gamepad_device[k, 0] == j) gamepad_available = false;
                    }

                    if (gamepad_available = true)
                    {
                        gamepad_device[i, 0] = j;
                        break;
                    }
                }
            }
        }

    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gamepad Layout

var i;

for (i = 0; i < PLAYER_COUNT; i += 1)
{
    if (gamepad_device[i, 0] > -1)
    {
        if (joystick_has_pov(i)) gamepad_device[i, 1] = 0;
        else
        {
            switch (joystick_name(i))
            {
                case "Nintendo Switch Pro Controller":
                    gamepad_device[i, 1] = 2;
                    break;

                default:
                    gamepad_device[i, 1] = 1;
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// D-pad

var i, j, k;

for (i = 0; i < PLAYER_COUNT; i += 1)
{
    var gamepad_index;

    gamepad_index = gamepad_device[i, 0];

    if (gamepad_index > -1)
    {
        if (joystick_has_pov(gamepad_index))
        {
            gamepad_dpad[INP_UP, CHECK_PRESSED + (i * 3)] = (joystick_pov_y(gamepad_index) == -1 && !gamepad_dpad[INP_UP, CHECK_HELD + (i * 3)]);
            gamepad_dpad[INP_DOWN, CHECK_PRESSED + (i * 3)] = (joystick_pov_y(gamepad_index) == 1 && !gamepad_dpad[INP_DOWN, CHECK_HELD + (i * 3)]);
            gamepad_dpad[INP_LEFT, CHECK_PRESSED + (i * 3)] = (joystick_pov_x(gamepad_index) == -1 && !gamepad_dpad[INP_LEFT, CHECK_HELD + (i * 3)]);
            gamepad_dpad[INP_RIGHT, CHECK_PRESSED + (i * 3)] = (joystick_pov_x(gamepad_index) == 1 && !gamepad_dpad[INP_RIGHT, CHECK_HELD + (i * 3)]);

            gamepad_dpad[INP_UP, CHECK_RELEASED + (i * 3)] = (joystick_pov_y(gamepad_index) != -1 && gamepad_dpad[INP_UP, CHECK_HELD + (i * 3)]);
            gamepad_dpad[INP_DOWN, CHECK_RELEASED + (i * 3)] = (joystick_pov_y(gamepad_index) != 1 && gamepad_dpad[INP_DOWN, CHECK_HELD + (i * 3)]);
            gamepad_dpad[INP_LEFT, CHECK_RELEASED + (i * 3)] = (joystick_pov_x(gamepad_index) != -1 && gamepad_dpad[INP_LEFT, CHECK_HELD + (i * 3)]);
            gamepad_dpad[INP_RIGHT, CHECK_RELEASED + (i * 3)] = (joystick_pov_x(gamepad_index) != 1 && gamepad_dpad[INP_RIGHT, CHECK_HELD + (i * 3)]);

            gamepad_dpad[INP_UP, CHECK_HELD + (i * 3)] = (joystick_pov_y(gamepad_index) == -1);
            gamepad_dpad[INP_DOWN, CHECK_HELD + (i * 3)] = (joystick_pov_y(gamepad_index) == 1);
            gamepad_dpad[INP_LEFT, CHECK_HELD + (i * 3)] = (joystick_pov_x(gamepad_index) == -1);
            gamepad_dpad[INP_RIGHT, CHECK_HELD + (i * 3)] = (joystick_pov_x(gamepad_index) == 1);
        }
        else
        {
            for (j = INP_UP; j <= INP_RIGHT; j += 1)
            {
                gamepad_dpad[j, CHECK_PRESSED + (i * 3)] = joystick_check_button_pressed(device_index, gamepad_button[PAD_LEFT + j, gamepad_device[i, 1]]);
                gamepad_dpad[j, CHECK_RELEASED + (i * 3)] = joystick_check_button_released(device_index, gamepad_button[PAD_LEFT + j, gamepad_device[i, 1]]);
                gamepad_dpad[j, CHECK_HELD + (i * 3)] = joystick_check_button(device_index, gamepad_button[PAD_LEFT + j, gamepad_device[i, 1]]);
            }
        }
    }
    else
    {
        for (j = INP_UP; j <= INP_RIGHT; j += 1)
        {
            for (k = CHECK_PRESSED; k <= CHECK_HELD; k += 1)
            {
                gamepad_dpad[j, k + (i * 3)] = false;
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

var i, j, k;

for (i = 0; i < PLAYER_COUNT; i += 1)
{
    var gamepad_index, gamepad_deadzone;

    gamepad_index = gamepad_device[i, 0];
    gamepad_deadzone = game_config_get_gamepad(i, "input_deadzone");

    if (gamepad_index > -1 && gamepad_deadzone != 0)
    {
        joystick_set_deadzone(gamepad_deadzone);

        gamepad_analog[INP_UP, CHECK_PRESSED + (i * 3)] = (sign(joystick_axis(gamepad_index, 1)) == -1 && !gamepad_analog[INP_UP, CHECK_HELD + (i * 3)]);
        gamepad_analog[INP_DOWN, CHECK_PRESSED + (i * 3)] = (sign(joystick_axis(gamepad_index, 1)) == 1 && !gamepad_analog[INP_DOWN, CHECK_HELD + (i * 3)]);
        gamepad_analog[INP_LEFT, CHECK_PRESSED + (i * 3)] = (sign(joystick_axis(gamepad_index, 0)) == -1 && !gamepad_analog[INP_LEFT, CHECK_HELD + (i * 3)]);
        gamepad_analog[INP_RIGHT, CHECK_PRESSED + (i * 3)] = (sign(joystick_axis(gamepad_index, 0)) == 1 && !gamepad_analog[INP_RIGHT, CHECK_HELD + (i * 3)]);

        gamepad_analog[INP_UP, CHECK_RELEASED + (i * 3)] = (sign(joystick_axis(gamepad_index, 1)) != -1 && gamepad_analog[INP_UP, CHECK_HELD + (i * 3)]);
        gamepad_analog[INP_DOWN, CHECK_RELEASED + (i * 3)] = (sign(joystick_axis(gamepad_index, 1)) != 1 && gamepad_analog[INP_DOWN, CHECK_HELD + (i * 3)]);
        gamepad_analog[INP_LEFT, CHECK_RELEASED + (i * 3)] = (sign(joystick_axis(gamepad_index, 0)) != -1 && gamepad_analog[INP_LEFT, CHECK_HELD + (i * 3)]);
        gamepad_analog[INP_RIGHT, CHECK_RELEASED + (i * 3)] = (sign(joystick_axis(gamepad_index, 0)) != 1 && gamepad_analog[INP_RIGHT, CHECK_HELD + (i * 3)]);

        gamepad_analog[INP_UP, CHECK_HELD + (i * 3)] = (sign(joystick_axis(gamepad_index, 1)) == -1);
        gamepad_analog[INP_DOWN, CHECK_HELD + (i * 3)] = (sign(joystick_axis(gamepad_index, 1)) == 1);
        gamepad_analog[INP_LEFT, CHECK_HELD + (i * 3)] = (sign(joystick_axis(gamepad_index, 0)) == -1);
        gamepad_analog[INP_RIGHT, CHECK_HELD + (i * 3)] = (sign(joystick_axis(gamepad_index, 0)) == 1);
    }
    else
    {
        for (j = INP_UP; j <= INP_RIGHT; j += 1)
        {
            for (k = CHECK_PRESSED; k <= CHECK_HELD; k += 1)
            {
                gamepad_analog[j, k + (i * 3)] = false;
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

var i;

for (i = 0; i < PLAYER_COUNT; i += 1)
{
    var gamepad_index;

    gamepad_index = gamepad_device[i, 0];

    if (gamepad_index > -1)
    {
        for (j = TRG_LEFT; j <= TRG_RIGHT; j += 1)
        {
            var trigger_id;

            trigger_id = gamepad_button[PAD_TRIGGERL + j, gamepad_device[i, 1]];
            trigger_axis = joystick_axis(gamepad_index, trigger_id);

            gamepad_trigger[j, CHECK_PRESSED + (i * 3)] = (trigger_axis > 0 && !gamepad_trigger[j, CHECK_HELD + (i * 3)]);
            gamepad_trigger[j, CHECK_RELEASED + (i * 3)] = (trigger_axis <= 0 && gamepad_trigger[j, CHECK_HELD + (i * 3)]);
            gamepad_trigger[j, CHECK_HELD + (i * 3)] = trigger_axis > 0;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

var i, j, k;

for (i = INP_UP; i <= INP_HIDE; i += 1)
{
    input_keyboard[i, CHECK_HELD] = keyboard_check(game_config_get_key(i));
    input_keyboard[i, CHECK_PRESSED] = keyboard_check_pressed(game_config_get_key(i));
    input_keyboard[i, CHECK_RELEASED] = keyboard_check_released(game_config_get_key(i));
}

for (i = 0; i < PLAYER_COUNT; i += 1)
{
    var gamepad_index;

    gamepad_index = gamepad_device[i, 0];
    gamepad_focus = game_get_config("input_gamepad_focus");

    if (gamepad_index > -1 && (gamepad_focus || (!gamepad_focus && window_has_focus())))
    {
        for (j = INP_UP; j <= INP_HIDE; j += 1)
        {
            for (k = CHECK_PRESSED; k <= CHECK_HELD; k += 1)
            {
                if (j <= INP_RIGHT) input_gamepad[j, k + (i * 3)] = (gamepad_get_check(gamepad_index, game_config_get_btn(i, j), k) || gamepad_analog[j, k + (i * 3)]);
                else input_gamepad[j, k + (i * 3)] = gamepad_get_check(gamepad_index, game_config_get_btn(i, j), k);
            }
        }
    }
    else
    {
        for (j = INP_UP; j <= INP_HIDE; j += 1)
        {
            for (k = CHECK_PRESSED; k <= CHECK_HELD; k += 1)
            {
                input_gamepad[j, k + (i * 3)] = false;
            }
        }
    }
}

for (i = INP_UP; i <= INP_HIDE; i += 1)
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

var i;

for (i = INP_UP; i <= INP_RIGHT; i += 1)
{
    if (input_user[i, CHECK_HELD]) input_time[i] += 1;
    else
    {
        if (input_time[i] != 0) input_time[i] = 0;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Conflicts

var i;

for (i = INP_UP; i <= INP_RIGHT; i += 2)
{
    if (input_user[i, CHECK_HELD] && input_user[i + 1, CHECK_HELD])
    {
        input_user[i, CHECK_HELD] = false;
        input_user[i + 1, CHECK_HELD] = false;
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

if (queue_list == -1) exit;

var i;

for (i = 0; i < ds_list_size(queue_list); i += 1)
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

var i;

if (queue_list == -1)
{
    queue_list = ds_list_create();

    for (i = 0; i <= QUEUE_JUMP_PRESSED; i += 1)
    {
        ds_list_add(queue_list, ds_queue_create());
    }

    input_queue_clear();
}
