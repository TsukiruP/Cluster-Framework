/// debug_option_input_reset(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    // Text:
    case 0:
        return "Reset";

    // Confirm:
    case 2:
        if (_event)
        {
            if (input_device == DEV_KEYBOARD) game_config_reset_key();
            else game_config_reset_gamepad(input_device - DEV_GAMEPAD0);
        }

        return true;

    // Undefined:
    default:
        return undefined;
}