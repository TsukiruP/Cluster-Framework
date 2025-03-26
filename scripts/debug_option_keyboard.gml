/// debug_option_keyboard(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Keyboard";

    // Confirm:
    case 2:
        if (_execute)
        {
            input_device = DEV_KEYBOARD;
            debug_set_next(debug_menu_keyboard);
        }
        
        return true;

    // Undefined:
    default:
        return undefined;
}