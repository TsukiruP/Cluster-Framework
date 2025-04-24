/// debug_option_interface_alpha(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "interface_alpha";

switch (_index)
{
    case OPTION_TEXT:
        return "Alpha:";

    case OPTION_VALUE:
        return string(config_get(config_key));

    case OPTION_CHANGE:
        if (in_range(config_get(config_key) + menu_x_direction / 100, 0, 1))
        {
            if (_execute) config_set(config_key, clamp(config_get(config_key) + menu_x_direction / 100, 0, 1));
            return true;
        }

        return false;

    default:
        return undefined;
}
