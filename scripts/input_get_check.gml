/// input_get_check(input, check, [device])
// Returns whether the input meets the check.

var input_id, input_device, input_keyboard, input_gamepad, input_user;

// Initialize:
input_id = argument0;
input_device = DEV_USER;

// Default to false:
input_keyboard = false;
input_gamepad = false;

// Set device:
if (argument_count >= 3)
{
    input_device = argument[2];
}

// Keyboard:
if (input_device == DEV_KEYBOARD)
{
    // Any:
    if (input_id == INP_ANY)
    {
        switch (argument1)
        {
            // Pressed:
            case CHECK_PRESSED:
                input_keyboard = keyboard_check_pressed(vk_anykey);
                break;

            // Released:
            case CHECK_RELEASED:
                input_keyboard = keyboard_check_released(vk_anykey);
                break;

            // Held:
            default:
                input_keyboard = keyboard_check(vk_anykey);
        }
    }

    else
    {
        input_keyboard = ctrl_input.input_keyboard[input_id, argument1];
    }

    // Return:
    return input_keyboard;
}

// Gamepad:
else if (input_device >= DEV_GAMEPAD0)
{
    var gamepad_id;

    // Gamepad offset:
    input_device -= DEV_GAMEPAD0;

    // Gamepad id:
    gamepad_id = ctrl_input.gamepad_device[input_device, 0];

    // Gamepad range:
    if (input_id == INP_ANY)
    {
        for (i = PAD_FACE1; i <= PAD_SHARE; i += 1)
        {
            if (gamepad_get_check(input_device, i, argument1))
            {
                input_gamepad = true;
            }
        }
    }
    else
    {
        input_gamepad = ctrl_input.input_gamepad[input_id, argument1 + (input_device * 3)];
    }

    // Return:
    return input_gamepad;
}

// User:
else
{
    if (input_id == INP_ANY)
    {
        input_user = (input_get_check(input_id, argument1, DEV_KEYBOARD) || input_get_check(input_id, argument1, DEV_GAMEPAD0));
    }
    else
    {
        input_user = ctrl_input.input_user[input_id, argument1];
    }

    // Return:
    return input_user;
}
