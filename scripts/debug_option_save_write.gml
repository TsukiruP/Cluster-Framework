/// debug_option_save_write(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Write Save";

    // Confirm:
    case 2:
        if (_execute) debug_save_create(0);
        return true;

    // Undefined:
    default:
        return undefined;
}