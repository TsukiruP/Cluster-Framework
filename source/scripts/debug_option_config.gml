/// debug_option_config(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Config";

    case OPTION_CONFIRM:
        if (_execute) debug_set_next(debug_menu_config);
        return true;

    default:
        return undefined;
}