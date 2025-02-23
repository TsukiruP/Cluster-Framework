/// debug_option_log_reset(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Reset Log";

    // Confirm:
    case 2:
        ctrl_text.log_string = "";
        return true;

    // Undefined:
    default:
        return undefined;
}