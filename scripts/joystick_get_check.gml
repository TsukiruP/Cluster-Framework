/// joystick_get_check(id, button, check)
// Returns whether the button meets the check.

with(ctrl_input)
{
    var joystick_id, button_id, button_check;

    // Joystick id:
    joystick_id = joystick_device[argument0, 0];

    // Return false if the device isn't registered:
    if (joystick_id <= -1)
    {
        return false;
    }

    if (joystick_exists(joystick_id))
    {
        switch (argument1)
        {
            // Left trigger:
            case JOY_TRIGGERL:
                return joystick_trigger[TRG_LEFT, argument2 + (argument0 * 3)];
                break;

            // Right trigger:
            case JOY_TRIGGERR:
                return joystick_trigger[TRG_RIGHT, argument2 + (argument0 * 3)];
                break;

            // Down D-pad:
            case JOY_UP:
                return joystick_dpad[INP_UP, argument2 + (argument0 * 3)]
                break;

            // Down D-pad:
            case JOY_DOWN:
                return joystick_dpad[INP_DOWN, argument2 + (argument0 * 3)]
                break;

            // Left D-pad:
            case JOY_LEFT:
                return joystick_dpad[INP_LEFT, argument2 + (argument0 * 3)]
                break;

            // Right D-pad:
            case JOY_RIGHT:
                return joystick_dpad[INP_RIGHT, argument2 + (argument0 * 3)]
                break;

            default:
                // Button id:
                button_id = joystick_button[argument1, joystick_device[argument0, 1]];

                // Button check:
                switch (argument2)
                {
                    // Pressed:
                    case CHECK_PRESSED:
                        button_check = joystick_check_button_pressed(joystick_id, button_id);
                        break;

                    // Release:
                    case CHECK_RELEASED:
                        button_check = joystick_check_button_released(joystick_id, button_id);
                        break;

                    // Held:
                    default:
                        button_check = joystick_check_button(joystick_id, button_id);
                }

                // Return:
                return button_check;
        }
    }
}
