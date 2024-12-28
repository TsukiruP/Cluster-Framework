/// input_get_check(input, check, [device])
// Returns whether the input meets the check.

var input_id, input_device, input_user;

// Initialize:
input_id = argument0;
input_device = DEV_USER;

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
                return keyboard_check_pressed(vk_anykey);

            // Released:
            case CHECK_RELEASED:
                return keyboard_check_released(vk_anykey);

            // Held:
            default:
                return keyboard_check(vk_anykey);
        }
    }

    return mgr_input.input_keyboard[input_id, argument1];
}

// Gamepad:
else if (input_device >= DEV_GAMEPAD0)
{
    var gamepad_id, i;

    // Gamepad offset:
    input_device -= DEV_GAMEPAD0;

    // Gamepad id:
    gamepad_id = mgr_input.gamepad_device[input_device, 0];

    // Gamepad range:
    if (input_id == INP_ANY)
    {
        for (i = PAD_FACE1; i <= PAD_SHARE; i += 1)
        {
            return gamepad_get_check(input_device, i, argument1);
        }
    }

    return mgr_input.input_gamepad[input_id, argument1 + (input_device * 3)];
}

// User:
else
{
    if (input_id == INP_ANY)
    {
        return (input_get_check(input_id, argument1, DEV_KEYBOARD) || input_get_check(input_id, argument1, DEV_GAMEPAD0));
    }

    return mgr_input.input_user[input_id, argument1];
}
