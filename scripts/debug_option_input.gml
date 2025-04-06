/// debug_option_input(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Input";

    case OPTION_CONFIRM:
        if (_event) debug_set_next(debug_menu_input);
        return true;

    default:
        return undefined;
}
