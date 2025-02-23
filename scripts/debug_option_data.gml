/// debug_option_data(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Data Debug";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_data);
        return true;

    // Undefined:
    default:
        return undefined;
}