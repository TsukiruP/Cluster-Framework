/// debug_option_gameplay_shields(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "gameplay_shields";

switch (_index)
{
    case OPTION_TEXT:
        return "Shields:";

    case OPTION_VALUE:
        return pick(game_config_get(config_key), "All", "Basic/Magnetic", "Basic");

    case OPTION_CHANGE:
        if (_execute) game_config_set(config_key, wrap(game_config_get(config_key) + menu_x_direction, 0, 2));
        return true;

    default:
        return undefined;
}