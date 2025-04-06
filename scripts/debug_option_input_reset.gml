/// debug_option_input_reset(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    // Text:
    case 0:
        return "Reset";

    // Confirm:
    case 4:
        if (_execute)
        {
            if (rebind_device == DEV_KEYBOARD) game_config_reset_key();
            else game_config_reset_gamepad(rebind_device - DEV_GAMEPAD0);
        }

        return true;

    // Undefined:
    default:
        return undefined;
}