/// debug_option_log_open(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Open Log";

    // Confirm:
    case 2:
        ctrl_text.log_hide = false;
        return true;

    // Undefined:
    default:
        return undefined;
}