/// debug_option_screen_scale(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "screen_scale";

switch (_index)
{
    // Text:
    case 0:
        return "Scale:";

    // Value:
    case 1:
        return string(game_config_get(config_key));

    // Change:
    case 3:
        if (_execute) game_config_set(config_key, wrap(game_config_get(config_key) + menu_x_direction, 1, 3));
        return true;

    // Undefined:
    default:
        return undefined;
}