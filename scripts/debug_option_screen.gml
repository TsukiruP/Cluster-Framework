/// debug_option_screen()
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Screen";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_screen);
        return true;

    // Undefined:
    default:
        return undefined;
}