/// debug_option_interface_blue(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "interface_blue";

switch (_index)
{
    case OPTION_TEXT:
        return "Blue:";

    case OPTION_VALUE:
        return string(game_config_get(config_key));

    case OPTION_CHANGE:
        if (in_range(game_config_get(config_key) + menu_x_direction, 0, 255))
        {
            if (_execute) game_config_set(config_key, clamp(game_config_get(config_key) + menu_x_direction, 0, 255));
            return true;
        }

        return false;

    default:
        return undefined;
}