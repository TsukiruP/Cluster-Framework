/// debug_option_save_delete(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    // Text:
    case 0:
        return "Delete Save";

    // Confirm:
    case 4:
        if (_event) debug_save_create(2);
        return true;

    // Undefined:
    default:
        return undefined;
}