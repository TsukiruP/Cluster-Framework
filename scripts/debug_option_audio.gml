/// debug_option_audio(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Audio";

    // Confirm:
    case 2:
        debug_set_next(debug_menu_audio);
        return true;

    // Undefined:
    default:
        return undefined;
}