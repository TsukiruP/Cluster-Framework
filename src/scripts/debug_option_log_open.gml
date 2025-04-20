/// debug_option_log_open(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Open Log";

    case OPTION_CONFIRM:
        if (_execute) ctrl_text.log_hide = false;
        return true;

    default:
        return undefined;
}