/// debug_option_text(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Text Debug";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_text);
        return true;

    // Undefined:
    default:
        return undefined;
}