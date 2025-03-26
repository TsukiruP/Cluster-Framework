/// debug_option_input_reset(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Reset";

    // Confirm:
    case 2:
        if (_execute)
        {
            if (input_device == DEV_KEYBOARD) game_config_reset_key();
            else game_config_reset_gamepad(input_device - DEV_GAMEPAD0);
        }
        
        return true;

    // Undefined:
    default:
        return undefined;
}