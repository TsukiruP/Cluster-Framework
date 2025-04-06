/// debug_option_save_delete(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    // Text:
    case 0:
        return "Delete Save";

    // Confirm:
    case 4:
        if (_execute) debug_save_create(2);
        return true;

    // Undefined:
    default:
        return undefined;
}