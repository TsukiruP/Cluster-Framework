/// debug_option_text(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Text Debug";

    case OPTION_CONFIRM:
        if (_execute) debug_set_next(debug_menu_text);
        return true;

    default:
        return undefined;
}
