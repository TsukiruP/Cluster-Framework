/// debug_option_keyboard(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Keyboard";

    // Confirm:
    case 2:
        input_device = DEV_KEYBOARD;
        debug_set_next(debug_menu_keyboard);
        return true;

    // Undefined:
    default:
        return undefined;
}
