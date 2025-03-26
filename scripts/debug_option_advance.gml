/// debug_option_advance(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    // Text:
    case 0:
        return "Advance";

    // Confirm:
    case 2:
        if (_event) debug_set_next(debug_menu_advance);
        return true;

    // Undefined:
    default:
        return undefined;
}
