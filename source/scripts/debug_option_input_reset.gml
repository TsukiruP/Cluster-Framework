/// debug_option_input_reset(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Reset";
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Resets all inputs for the device.");
        return true;

    case OPTION_CONFIRM:
        if (_execute)
        {
            if (rebind_device == DEV_KEYBOARD) config_reset_key();
            else config_reset_gamepad(rebind_device - DEV_GAMEPAD0);
        }

        return true;

    default:
        return undefined;
}