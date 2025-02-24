/// input_get_check(input, check, [device])
/// @desc Returns whether the input satisfies the check.
/// @param {int} input
/// @param {int} check
/// @param {int} [device]
/// @returns {bool}

var _input; _input = argument[0];
var _check; _check = argument[1];
var _device; if (argument_count > 2) _device = argument[2]; else _device = DEV_USER;

with (ctrl_input)
{
    if (_device == DEV_KEYBOARD)
    {
        if (_input == INP_ANY)
        {
            switch (_check)
            {
                case CHECK_PRESSED:
                    return keyboard_check_pressed(vk_anykey);

                case CHECK_RELEASED:
                    return keyboard_check_released(vk_anykey);

                default:
                    return keyboard_check(vk_anykey);
            }
        }

        return input_keyboard[_input, _check];
    }
    else if (_device >= DEV_GAMEPAD0)
    {
        _device -= DEV_GAMEPAD0;

        var gamepad_index; gamepad_index = gamepad_device[_device, 0];

        if (_input == INP_ANY)
        {
            for ({var i; i = PAD_FACE1}; i <= PAD_SHARE; i += 1)
            {
                if (gamepad_get_check(_device, i, _check)) return true;
            }

            return false;
        }

        return input_gamepad[_input, _check + (_device * 3)];
    }
    else
    {
        if (_input == INP_ANY)
        {
            return (input_get_check(_input, _check, DEV_KEYBOARD) || input_get_check(_input, _check, DEV_GAMEPAD0));
        }

        return input_user[_input, _check];
    }
}