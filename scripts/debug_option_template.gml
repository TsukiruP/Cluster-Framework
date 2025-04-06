/// debug_option_template(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Character Debug";

    case OPTION_VALUE:
        return undefined;
    
    case OPTION_SELECT:
        if (_execute) return true;
        return false;
    
    case OPTION_CHANGE:
        if (_execute) return true;
        return false;

    case OPTION_CONFIRM:
        if (_execute) return true;
        return false;

    default:
        return undefined;
}