/// debug_option_gamepad(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Gamepad";

    // Confirm:
    case 2:
        if (_execute)
        {
            input_device = DEV_GAMEPAD0;
            debug_set_next(debug_menu_gamepad);
        }
        
        return true;

    // Undefined:
    default:
        return undefined;
}