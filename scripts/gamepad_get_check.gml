/// gamepad_get_check(id, button, check)
/* Returns whether the button meets the check.
If there's no gamepad at the id, returns false. */

with (ctrl_input)
{
    var gamepad_id;

    gamepad_id = gamepad_device[argument0, 0];
    if (gamepad_id < 0) return false;

    if (joystick_exists(gamepad_id))
    {
        switch (argument1)
        {
            case PAD_TRIGGERL:
                return gamepad_trigger[TRG_LEFT, argument2 + (argument0 * 3)];

            case PAD_TRIGGERR:
                return gamepad_trigger[TRG_RIGHT, argument2 + (argument0 * 3)];

            case PAD_UP:
                return gamepad_dpad[INP_UP, argument2 + (argument0 * 3)];

            case PAD_DOWN:
                return gamepad_dpad[INP_DOWN, argument2 + (argument0 * 3)];

            case PAD_LEFT:
                return gamepad_dpad[INP_LEFT, argument2 + (argument0 * 3)];

            case PAD_RIGHT:
                return gamepad_dpad[INP_RIGHT, argument2 + (argument0 * 3)];

            default:
                var button_id;
                
                button_id = gamepad_button[argument1, gamepad_device[argument0, 1]];

                switch (argument2)
                {
                    case CHECK_PRESSED:
                        return joystick_check_button_pressed(gamepad_id, button_id);

                    case CHECK_RELEASED:
                        return joystick_check_button_released(gamepad_id, button_id);

                    default:
                        return joystick_check_button(gamepad_id, button_id);
                }
        }
    }
}
