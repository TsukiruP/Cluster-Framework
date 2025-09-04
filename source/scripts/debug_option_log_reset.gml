/// debug_option_log_reset(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Reset Log";
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Clears the text log.");
        return true;

    case OPTION_CONFIRM:
        if (_execute) ctrl_text.log_string = "";
        return true;

    default:
        return undefined;
}