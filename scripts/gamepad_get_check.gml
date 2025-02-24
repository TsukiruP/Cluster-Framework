/// gamepad_get_check(device, button, check)
/// @desc Returns whether the button satisifes the check.
/// @param {int} device
/// @param {int} button
/// @param {int} check
/// @returns {bool}

var _device; _device = argument0;
var _button; _button = argument1;
var _check; _check = argument2;

with (ctrl_input)
{
    var gamepad_index; gamepad_index = gamepad_device[_device, 0];

    if (gamepad_index < 0) return false;

    if (joystick_exists(gamepad_index))
    {
        switch (_button)
        {
            case PAD_TRIGGERL:
            case PAD_TRIGGERR:
                return gamepad_trigger[_button - PAD_TRIGGERL, _check + (_device * 3)];

            case PAD_UP:
            case PAD_DOWN:
            case PAD_LEFT:
            case PAD_RIGHT:
                return gamepad_dpad[_button - PAD_UP, _check + (_device * 3)];

            default:
                var button_index; button_index = gamepad_button[_button, gamepad_device[_device, 1]];

                switch (_check)
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
