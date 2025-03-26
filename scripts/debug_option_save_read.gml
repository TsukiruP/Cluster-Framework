/// debug_option_save_read(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Read Save";

    // Confirm:
    case 2:
        if (_execute) debug_save_create(1);
        return true;

    // Undefined:
    default:
        return undefined;
}