#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Initialization

// User & keyboard inputs:
for (i = INP_UP; i <= INP_HELP; i += 1)
{
    for (j = CHECK_PRESSED; j <= CHECK_HELD; j += 1)
    {
        // User inputs:
        input_user[i, j] = false;

        // Keyboard inputs:
        input_keyboard[i, j] = false;
    }
}

// Input timers:
for (i = INP_UP; i <= INP_RIGHT; i += 1)
{
    input_timer[i] = 0;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gamepad Initialization

// Gamepad devices:
for (i = 0; i < global.player_count; i += 1)
{
    gamepad_device[i, 0] = -1;
    gamepad_device[i, 1] = -1;
}

// Gamepad buttons:
for (i = PAD_FACE1; i <= PAD_DOWN; i += 1)
{
    gamepad_button[i] = -1;
}

// Gamepad inputs:
for (i = 0; i < global.player_count; i += 1)
{
    for (j = INP_UP; j <= INP_HELP; j += 1)
    {
        for (k = CHECK_PRESSED; k <= CHECK_HELD; k += 1)
        {
            // D-pad and analog inputs:
            if (j <= INP_RIGHT)
            {
                // D-pad inputs:
                gamepad_dpad[j, k + (i * 3)] = false;

                // Analog stick inputs:
                gamepad_analog[j, k + (i * 3)] = false;
            }

            // Trigger inputs:
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

// Xbox buttons:
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

// DualSense buttons:
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

// Pro Controller buttons:
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

// Find Gamepads:
if (joystick_found())
{
    // Set seeking devices:
    for (i = 0; i < global.player_count; i += 1)
    {
        // Check if current gamepad has been removed:
        if (gamepad_device[i, 0] > joystick_count() - 1)
        {
            gamepad_device[i, 0] = -1;
        }

        // Check current gamepad is set to seeking:
        if (gamepad_device[i, 0] == -1)
        {
            // Check there's enough gamepads:
            if (joystick_count() > 0)
            {
                // Iterate through currently connected gamepads:
                for (j = 0; j < joystick_count(); j += 1)
                {
                    var gamepad_available;
                    
                    gamepad_available = true;
                    
                    // Iterate through every registered gamepads:
                    for (k = 0; k < global.player_count; k += 1)
                    {
                        
                        // If the device is already registered, move on:
                        if (gamepad_device[k, 0] == j)
                        {
                            gamepad_available = false;
                        }
                    }
                    
                    // Register the device:
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

// Update device buttons:
for (i = 0; i < global.player_count; i += 1)
{
    // Check if the current gamepad exists:
    if (gamepad_device[i, 0] > -1)
    {
        // Check if the current gamepad has a POV/D-Pad:
        if (joystick_has_pov(i))
        {
            // Set to Xbox layout:
            gamepad_device[i, 1] = 0;
        }

        // Other layouts:
        else
        {
            switch (joystick_name(i))
            {
                // Pro Controller:
                case "Nintendo Switch Pro Controller":
                    gamepad_device[i, 1] = 2;
                    break;

                // DualShock:
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
/// Gamepad Confirm

// Update accept format:
for (i = 0; i < global.player_count; i += 1)
{
    // Nintendo accept:
    if (global.input_confirm[i] == 1)
    {
        global.input_pad[i, INP_ACCEPT] = PAD_FACE2;
        global.input_pad[i, INP_CANCEL] = PAD_FACE1;
    }

    // Xbox accept:
    else
    {
        global.input_pad[i, INP_ACCEPT] = PAD_FACE1;
        global.input_pad[i, INP_CANCEL] = PAD_FACE2;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// D-pad

for (i = 0; i < global.player_count; i += 1)
{
    var gamepad_id;

    // Gamepad id:
    gamepad_id = gamepad_device[i, 0];

    if (gamepad_id > -1)
    {
        // Read POV:
        if (joystick_has_pov(gamepad_id))
        {
            // Pressed:
            gamepad_dpad[INP_UP, CHECK_PRESSED + (i * 3)] = (joystick_pov_y(gamepad_id) == -1 && gamepad_dpad[INP_UP, CHECK_HELD + (i * 3)] == false);
            gamepad_dpad[INP_DOWN, CHECK_PRESSED + (i * 3)] = (joystick_pov_y(gamepad_id) == 1 && gamepad_dpad[INP_DOWN, CHECK_HELD + (i * 3)] == false);
            gamepad_dpad[INP_LEFT, CHECK_PRESSED + (i * 3)] = (joystick_pov_x(gamepad_id) == -1 && gamepad_dpad[INP_LEFT, CHECK_HELD + (i * 3)] == false);
            gamepad_dpad[INP_RIGHT, CHECK_PRESSED + (i * 3)] = (joystick_pov_x(gamepad_id) == 1 && gamepad_dpad[INP_RIGHT, CHECK_HELD + (i * 3)] == false);

            // Released:
            gamepad_dpad[INP_UP, CHECK_RELEASED + (i * 3)] = (joystick_pov_y(gamepad_id) != -1 && gamepad_dpad[INP_UP, CHECK_HELD + (i * 3)] == true);
            gamepad_dpad[INP_DOWN, CHECK_RELEASED + (i * 3)] = (joystick_pov_y(gamepad_id) != 1 && gamepad_dpad[INP_DOWN, CHECK_HELD + (i * 3)] == true);
            gamepad_dpad[INP_LEFT, CHECK_RELEASED + (i * 3)] = (joystick_pov_x(gamepad_id) != -1 && gamepad_dpad[INP_LEFT, CHECK_HELD + (i * 3)] == true);
            gamepad_dpad[INP_RIGHT, CHECK_RELEASED + (i * 3)] = (joystick_pov_x(gamepad_id) != 1 && gamepad_dpad[INP_RIGHT, CHECK_HELD + (i * 3)] == true);

            // Held:
            gamepad_dpad[INP_UP, CHECK_HELD + (i * 3)] = (joystick_pov_y(gamepad_id) == -1);
            gamepad_dpad[INP_DOWN, CHECK_HELD + (i * 3)] = (joystick_pov_y(gamepad_id) == 1);
            gamepad_dpad[INP_LEFT, CHECK_HELD + (i * 3)] = (joystick_pov_x(gamepad_id) == -1);
            gamepad_dpad[INP_RIGHT, CHECK_HELD + (i * 3)] = (joystick_pov_x(gamepad_id) == 1);
        }

        // Read buttons:
        else
        {
            for (j = INP_UP; j <= INP_RIGHT; j += 1)
            {
                // Pressed:
                gamepad_dpad[j, CHECK_PRESSED + (i * 3)] = joystick_check_button_pressed(device_id, gamepad_button[PAD_LEFT + j, gamepad_device[i, 1]]);

                // Released:
                gamepad_dpad[j, CHECK_RELEASED + (i * 3)] = joystick_check_button_released(device_id, gamepad_button[PAD_LEFT + j, gamepad_device[i, 1]]);

                // Held:
                gamepad_dpad[j, CHECK_HELD + (i * 3)] = joystick_check_button(device_id, gamepad_button[PAD_LEFT + j, gamepad_device[i, 1]]);
            }
        }
    }

    // Reset:
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

for (i = 0; i < global.player_count; i += 1)
{
    var gamepad_id;

    // Gamepad id:
    gamepad_id = gamepad_device[i, 0];

    // Read analog values:
    if (gamepad_id > -1 && global.input_deadzone[i] != 0)
    {
        // Set deadzone:
        joystick_set_deadzone(global.input_deadzone[i]);

        // Pressed:
        gamepad_analog[INP_UP, CHECK_PRESSED + (i * 3)] = (sign(joystick_axis(gamepad_id, 1)) == -1 && gamepad_analog[INP_UP, CHECK_HELD + (i * 3)] == false);
        gamepad_analog[INP_DOWN, CHECK_PRESSED + (i * 3)] = (sign(joystick_axis(gamepad_id, 1)) == 1 && gamepad_analog[INP_DOWN, CHECK_HELD + (i * 3)] == false);
        gamepad_analog[INP_LEFT, CHECK_PRESSED + (i * 3)] = (sign(joystick_axis(gamepad_id, 0)) == -1 && gamepad_analog[INP_LEFT, CHECK_HELD + (i * 3)] == false);
        gamepad_analog[INP_RIGHT, CHECK_PRESSED + (i * 3)] = (sign(joystick_axis(gamepad_id, 0)) == 1 && gamepad_analog[INP_RIGHT, CHECK_HELD + (i * 3)] == false);

        // Released:
        gamepad_analog[INP_UP, CHECK_RELEASED + (i * 3)] = (sign(joystick_axis(gamepad_id, 1)) != -1 && gamepad_analog[INP_UP, CHECK_HELD + (i * 3)] == true);
        gamepad_analog[INP_DOWN, CHECK_RELEASED + (i * 3)] = (sign(joystick_axis(gamepad_id, 1)) != 1 && gamepad_analog[INP_DOWN, CHECK_HELD + (i * 3)] == true);
        gamepad_analog[INP_LEFT, CHECK_RELEASED + (i * 3)] = (sign(joystick_axis(gamepad_id, 0)) != -1 && gamepad_analog[INP_LEFT, CHECK_HELD + (i * 3)] == true);
        gamepad_analog[INP_RIGHT, CHECK_RELEASED + (i * 3)] = (sign(joystick_axis(gamepad_id, 0)) != 1 && gamepad_analog[INP_RIGHT, CHECK_HELD + (i * 3)] == true);

        // Held:
        gamepad_analog[INP_UP, CHECK_HELD + (i * 3)] = (sign(joystick_axis(gamepad_id, 1)) == -1);
        gamepad_analog[INP_DOWN, CHECK_HELD + (i * 3)] = (sign(joystick_axis(joystick_id, 1)) == 1);
        gamepad_analog[INP_LEFT, CHECK_HELD + (i * 3)] = (sign(joystick_axis(gamepad_id, 0)) == -1);
        gamepad_analog[INP_RIGHT, CHECK_HELD + (i * 3)] = (sign(joystick_axis(gamepad_id, 0)) == 1);
    }

    // Reset:
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

for (i = 0; i < global.player_count; i += 1)
{
    var gamepad_id;

    // Gamepad id:
    gamepad_id = gamepad_device[i, 0];

    if (gamepad_id > -1)
    {
        for (j = TRG_LEFT; j <= TRG_RIGHT; j += 1)
        {
            var trigger_id;

            // Trigger id:
            trigger_id = gamepad_button[PAD_TRIGGERL + j, gamepad_device[i, 1]];

            // Trigger axis:
            trigger_axis = joystick_axis(gamepad_id, trigger_id);

            // Pressed:
            gamepad_trigger[j, CHECK_PRESSED + (i * 3)] = (trigger_axis > 0 && gamepad_trigger[j, CHECK_HELD + (i * 3)] == false);

            // Released:
            gamepad_trigger[j, CHECK_RELEASED + (i * 3)] = (trigger_axis <= 0 && gamepad_trigger[j, CHECK_HELD + (i * 3)] == true);

            // Held:
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

// Keyboard:
for (i = INP_UP; i <= INP_HELP; i += 1)
{
    // Held:
    input_keyboard[i, CHECK_HELD] = keyboard_check(global.input_key[i]);

    // Pressed:
    input_keyboard[i, CHECK_PRESSED] = keyboard_check_pressed(global.input_key[i]);

    // Released:
    input_keyboard[i, CHECK_RELEASED] = keyboard_check_released(global.input_key[i]);
}

// Gamepad:
for (i = 0; i < global.player_count; i += 1)
{
    var gamepad_id;

    // Gamepad id:
    gamepad_id = gamepad_device[i, 0];

    if (gamepad_id > -1)
    {
        for (j = INP_UP; j <= INP_HELP; j += 1)
        {
            for (k = CHECK_PRESSED; k <= CHECK_HELD; k += 1)
            {
                // Directional inputs:
                if (j <= INP_RIGHT)
                {
                    input_gamepad[j, k + (i * 3)] = (gamepad_get_check(gamepad_id, global.input_pad[i, j], k) || gamepad_analog[j, k + (i * 3)]);
                }

                // Every other input:
                else
                {
                    input_gamepad[j, k + (i * 3)] = gamepad_get_check(gamepad_id, global.input_pad[i, j], k);
                }
            }
        }
    }

    // Reset:
    else
    {
        for (j = INP_UP; j <= INP_HELP; j += 1)
        {
            for (k = CHECK_PRESSED; k <= CHECK_HELD; k += 1)
            {
                input_gamepad[j, k + (i * 3)] = false;
            }
        }
    }
}

// User:
for (i = INP_UP; i <= INP_HELP; i += 1)
{
    // Held:
    input_user[i, CHECK_HELD] = (input_keyboard[i, CHECK_HELD] || input_gamepad[i, CHECK_HELD]);

    // Pressed:
    input_user[i, CHECK_PRESSED] = ((input_keyboard[i, CHECK_PRESSED] && !input_gamepad[i, CHECK_HELD]) || (input_gamepad[i, CHECK_PRESSED] && !input_keyboard[i, CHECK_HELD]));

    // Released:
    input_user[i, CHECK_RELEASED] = ((input_keyboard[i, CHECK_RELEASED] && !input_gamepad[i, CHECK_HELD]) || (input_gamepad[i, CHECK_RELEASED] && !input_keyboard[i, CHECK_HELD]));
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Timers

for (i = INP_UP; i <= INP_RIGHT; i += 1)
{
    // Increment:
    if (input_user[i, CHECK_HELD] == true)
    {
        input_timer[i] += 1;
    }

    // Reset:
    else
    {
        if (input_timer[i] != 0)
        {
            input_timer[i] = 0;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Conflicts

for (i = INP_UP; i <= INP_RIGHT; i += 2)
{
    // Held:
    if (input_user[i, CHECK_HELD] == true && input_user[i + 1, CHECK_HELD] == true)
    {
        input_user[i, CHECK_HELD] = false;
        input_user[i + 1, CHECK_HELD] = false;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Prompts
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Partner Queues

partner_input_up = ds_queue_create();
partner_input_down = ds_queue_create();
partner_input_jump = ds_queue_create();

// Populate Queues:
repeat (16)
{
    ds_queue_enqueue(partner_input_up, false);
    ds_queue_enqueue(partner_input_down, false);
    ds_queue_enqueue(partner_input_jump, false);
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Clear Partner Queues

ds_queue_clear(partner_input_up);
ds_queue_clear(partner_input_down);
ds_queue_clear(partner_input_jump);
