/// input_get_check(input, check, [device])
/* Returns whether the input meets the check. */

with (ctrl_input)
{
    var input_id, input_device;

    input_id = argument0;
    input_device = DEV_USER;
    if (argument_count > 2) input_device = argument[2];

    if (input_device == DEV_KEYBOARD)
    {
        if (input_id == INP_ANY)
        {
            switch (argument1)
            {
                case CHECK_PRESSED:
                    return keyboard_check_pressed(vk_anykey);

                case CHECK_RELEASED:
                    return keyboard_check_released(vk_anykey);

                default:
                    return keyboard_check(vk_anykey);
            }
        }

        return input_keyboard[input_id, argument1];
    }
    else if (input_device >= DEV_GAMEPAD0)
    {
        var i, gamepad_id;

        input_device -= DEV_GAMEPAD0;
        gamepad_id = gamepad_device[input_device, 0];

        if (input_id == INP_ANY)
        {
            for (i = PAD_FACE1; i <= PAD_SHARE; i += 1)
            {
                if (gamepad_get_check(input_device, i, argument1)) return true;
            }

            return false;
        }

        return input_gamepad[input_id, argument1 + (input_device * 3)];
    }
    else
    {
        if (input_id == INP_ANY)
        {
            return (input_get_check(input_id, argument1, DEV_KEYBOARD) || input_get_check(input_id, argument1, DEV_GAMEPAD0));
        }

        return input_user[input_id, argument1];
    }
}
