/// debug_option_input_background(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "input_background";

switch (_index)
{
    case OPTION_TEXT:
        return "Background Input:";

    case OPTION_VALUE:
        return string_bool(config_get(config_key), true);

    case OPTION_SELECT:
        if (_execute) text_set_body("Allow controller input even when the game is not in focus.");
        return true;

    case OPTION_CHANGE:
        if (_execute) config_set(config_key, !config_get(config_key));
        return true;

    default:
        return undefined;
}
