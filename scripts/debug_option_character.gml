/// debug_option_character(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Character Debug";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_character);
        return true;

    // Undefined:
    default:
        return undefined;
}
