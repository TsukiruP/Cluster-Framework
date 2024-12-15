/// gamepad_get_check(id, button, check)
// Returns whether the button meets the check.

with (mgr_input)
{
    var gamepad_id, button_id, button_check;

    // Gamepad id:
    gamepad_id = gamepad_device[argument0, 0];

    // Return false if the device isn't registered:
    if (gamepad_id <= -1)
    {
        return false;
    }

    if (joystick_exists(gamepad_id))
    {
        switch (argument1)
        {
            // Left trigger:
            case PAD_TRIGGERL:
                return gamepad_trigger[TRG_LEFT, argument2 + (argument0 * 3)];

            // Right trigger:
            case PAD_TRIGGERR:
                return gamepad_trigger[TRG_RIGHT, argument2 + (argument0 * 3)];

            // Down D-pad:
            case PAD_UP:
                return gamepad_dpad[INP_UP, argument2 + (argument0 * 3)];

            // Down D-pad:
            case PAD_DOWN:
                return gamepad_dpad[INP_DOWN, argument2 + (argument0 * 3)];

            // Left D-pad:
            case PAD_LEFT:
                return gamepad_dpad[INP_LEFT, argument2 + (argument0 * 3)];

            // Right D-pad:
            case PAD_RIGHT:
                return gamepad_dpad[INP_RIGHT, argument2 + (argument0 * 3)];

            default:
                // Button id:
                button_id = gamepad_button[argument1, gamepad_device[argument0, 1]];

                // Button check:
                switch (argument2)
                {
                    // Pressed:
                    case CHECK_PRESSED:
                        button_check = joystick_check_button_pressed(gamepad_id, button_id);
                        break;

                    // Release:
                    case CHECK_RELEASED:
                        button_check = joystick_check_button_released(gamepad_id, button_id);
                        break;

                    // Held:
                    default:
                        button_check = joystick_check_button(gamepad_id, button_id);
                }

                // Return:
                return button_check;
        }
    }
}
