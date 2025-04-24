/// debug_option_screen_scale(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "screen_scale";

switch (_index)
{
    case OPTION_TEXT:
        return "Scale:";

    case OPTION_VALUE:
        return string(config_get(config_key));

    case OPTION_CHANGE:
        if (_execute) config_set(config_key, wrap(config_get(config_key) + menu_x_direction, 1, 3));
        return true;

    default:
        return undefined;
}
