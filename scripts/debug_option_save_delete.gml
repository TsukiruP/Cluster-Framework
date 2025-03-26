/// debug_option_save_delete(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Delete Save";

    // Confirm:
    case 2:
        if (_execute) debug_save_create(2);
        return true;

    // Undefined:
    default:
        return undefined;
}