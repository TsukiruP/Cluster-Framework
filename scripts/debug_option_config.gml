/// debug_option_config(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Config";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_config);
        return true;

    // Undefined:
    default:
        return undefined;
}