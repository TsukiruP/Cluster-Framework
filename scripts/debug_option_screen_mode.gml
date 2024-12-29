/// debug_option_screen_mode(return)

var config_key;

// Config key:
config_key = "screen_mode";

switch (argument0)
{
    // Text:
    case 0:
        return "Mode:";

    // Value:
    case 1:
        return pick(game_config_get(config_key), "Default", "3DS", "Misc.");

    // Update:
    case 3:
        game_config_set(config_key, wrap(game_config_get(config_key) + menu_x_direction, 0, 2));
        game_config_set("screen_ratio", 0);
        return true;

    // Undefined:
    default:
        return undefined;
}
