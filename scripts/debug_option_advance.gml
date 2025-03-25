/// debug_option_advance(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Advance";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_advance);
        return true;

    // Undefined:
    default:
        return undefined;
}
