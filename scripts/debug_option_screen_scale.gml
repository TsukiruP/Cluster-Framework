/// debug_option_screen_scale(return)

var config_key;

// Config key:
config_key = "screen_scale";

switch (argument0)
{
    // Text:
    case 0:
        return "Scale:";

    // Value:
    case 1:
        return string(game_config_get(config_key));

    // Update:
    case 3:
        game_config_set(config_key, wrap(game_config_get(config_key) + menu_x_direction, 1, 3));
        return true;

    // Undefined:
    default:
        return undefined;
}
