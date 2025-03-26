/// debug_option_log_reset(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Reset Log";

    // Confirm:
    case 2:
        if (_execute) ctrl_text.log_string = "";
        return true;

    // Undefined:
    default:
        return undefined;
}