/// debug_option_screen_mode(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "screen_mode";

switch (_index)
{
    case OPTION_TEXT:
        return "Mode:";

    case OPTION_VALUE:
        return pick(config_get(config_key), "Default", "3DS", "Misc.");

    case OPTION_CHANGE:
        if (_execute)
        {
            config_set(config_key, wrap(config_get(config_key) + menu_x_direction, 0, 2));
            config_set("screen_ratio", 0);
        }

        return true;

    default:
        return undefined;
}
