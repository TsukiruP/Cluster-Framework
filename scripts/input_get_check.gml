/// input_get_check(input, check, [device])
// Returns whether the input meets the check.

var input_id, input_device, input_keyboard, input_joystick, input_user;

// Initialize:
input_id = argument0;
input_device = DEV_USER;

// Default to false:
input_keyboard = false;
input_joystick = false;

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

// Joystick:
else if (input_device >= DEV_JOYSTICK0)
{
    var joystick_id;

    // Joystick offset:
    input_device -= DEV_JOYSTICK0;

    // Joystick id:
    joystick_id = ctrl_input.joystick_device[input_device, 0];

    // Joystick range:
    if (input_id == INP_ANY)
    {
        for (i = JOY_FACE1; i <= JOY_SHARE; i += 1)
        {
            if (joystick_get_check(input_device, i, argument1))
            {
                input_joystick = true;
            }
        }
    }
    else
    {
        input_joystick = ctrl_input.input_joystick[input_id, argument1 + (input_device * 3)];
    }

    // Return:
    return input_joystick;
}

// User:
else
{
    if (input_id == INP_ANY)
    {
        input_user = (input_get_check(input_id, argument1, DEV_KEYBOARD) || input_get_check(input_id, argument1, DEV_JOYSTICK0));
    }
    else
    {
        input_user = ctrl_input.input_user[input_id, argument1];
    }

    // Return:
    return input_user;
}
