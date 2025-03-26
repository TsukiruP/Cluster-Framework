/// gamepad_get_check(player, button, check)
/// @desc Returns whether the button satisifes the check.
/// @param {int} player
/// @param {int} button
/// @param {int} check
/// @returns {bool}

var _player; _player = argument0;
var _button; _button = argument1;
var _check; _check = argument2;

with (ctrl_input)
{
    var gamepad_index; gamepad_index = gamepad_get(_player);

    if (gamepad_index < 0) return false;

    if (joystick_exists(gamepad_index))
    {
        var check_index; check_index = _check + (_player * 3);

        switch (_button)
        {
            case PAD_TRIGGERL:
            case PAD_TRIGGERR:
                return gamepad_trigger[_button - PAD_TRIGGERL, check_index];

            case PAD_UP:
            case PAD_DOWN:
            case PAD_LEFT:
            case PAD_RIGHT:
                return (gamepad_dpad[_button - PAD_UP, check_index] || gamepad_analog[_button - PAD_UP, check_index]);

            default:
                var button_index; button_index = gamepad_get_button(gamepad_index, _button);;

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
