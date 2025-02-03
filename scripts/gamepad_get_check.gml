/// gamepad_get_check(index, button, check)
/* Returns whether the button meets the check.
If there's no gamepad at the id, returns false. */

with (ctrl_input)
{
    var gamepad_index;

    gamepad_index = gamepad_device[argument0, 0];
    if (gamepad_index < 0) return false;

    if (joystick_exists(gamepad_index))
    {
        switch (argument1)
        {
            case PAD_TRIGGERL:
            case PAD_TRIGGERR:
                return gamepad_trigger[argument1 - PAD_TRIGGERL, argument2 + (argument0 * 3)];

            case PAD_UP:
            case PAD_DOWN:
            case PAD_LEFT:
            case PAD_RIGHT:
                return gamepad_dpad[argument1 - PAD_UP, argument2 + (argument0 * 3)];

            default:
                var button_index;

                button_index = gamepad_button[argument1, gamepad_device[argument0, 1]];

                switch (argument2)
                {
                    case CHECK_PRESSED:
                        return joystick_check_button_pressed(gamepad_index, button_index);

                    case CHECK_RELEASED:
                        return joystick_check_button_released(gamepad_index, button_index);

                    default:
                        return joystick_check_button(gamepad_index, button_index);
                }
        }
    }
}
