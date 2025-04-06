/// debug_option_config_write(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Write Config";

    case OPTION_CONFIRM:
        if (_execute) game_config_write();
        return true;

    default:
        return undefined;
}
