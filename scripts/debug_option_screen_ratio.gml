/// debug_option_screen_ratio(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var config_key; config_key = "screen_ratio";

switch (_return)
{
    // Text:
    case 0:
        return "Ratio:";

    // Value:
    case 1:
        switch (game_get_config("screen_mode"))
        {
            // Misc:
            case 2:
                return "7:4";

            // Default:
            default:
                return pick(game_get_config(config_key), "16:9", "4:3", "5:3");
        }

    // Update:
    case 3:
        var ratio_max; ratio_max = pick(game_get_config("screen_mode"), 1, 2, 0);

        game_set_config(config_key, wrap(game_get_config(config_key) + menu_x_direction, 0, ratio_max));
        return true;

    // Undefined:
    default:
        return undefined;
}