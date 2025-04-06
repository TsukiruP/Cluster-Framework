/// debug_option_screen_ratio(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "screen_ratio";

switch (_index)
{
    // Text:
    case 0:
        return "Ratio:";

    // Value:
    case 1:
        switch (game_config_get("screen_mode"))
        {
            // Misc:
            case 4:
                return "7:4";

            // Default:
            default:
                return pick(game_config_get(config_key), "16:9", "4:3", "5:3");
        }

    // Change:
    case 3:
        if (_execute)
        {
            var ratio_max; ratio_max = pick(game_config_get("screen_mode"), 1, 2, 0);

            game_config_set(config_key, wrap(game_config_get(config_key) + menu_x_direction, 0, ratio_max));
        }

        return true;

    // Undefined:
    default:
        return undefined;
}