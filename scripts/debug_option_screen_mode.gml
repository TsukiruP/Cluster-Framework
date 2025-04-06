/// debug_option_screen_mode(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "screen_mode";

switch (_index)
{
    // Text:
    case 0:
        return "Mode:";

    // Value:
    case 1:
        return pick(game_config_get(config_key), "Default", "3DS", "Misc.");

    // Change:
    case 3:
        if (_execute)
        {
            game_config_set(config_key, wrap(game_config_get(config_key) + menu_x_direction, 0, 2));
            game_config_set("screen_ratio", 0);
        }

        return true;

    // Undefined:
    default:
        return undefined;
}