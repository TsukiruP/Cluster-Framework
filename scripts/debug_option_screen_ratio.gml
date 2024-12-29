/// debug_option_screen_ratio(return)

var config_key;

// Config key:
config_key = "screen_ratio";

switch (argument0)
{
    // Text:
    case 0:
        return "Ratio:";

    // Value:
    case 1:
        switch (game_config_get("screen_mode"))
        {
            // Misc:
            case 2:
                return "7:4";

            // Default:
            default:
                return pick(game_config_get(config_key), "16:9", "4:3", "5:3");
        }

    // Update:
    case 3:
        var ratio_max;

        // Ratio max:
        ratio_max = pick(game_config_get("screen_mode"), 1, 2, 0);

        game_config_set(config_key, wrap(game_config_get(config_key) + menu_x_direction, 0, ratio_max));
        return true;

    // Undefined:
    default:
        return undefined;
}
