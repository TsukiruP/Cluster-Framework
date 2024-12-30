/// debug_option_screen_full(return)

var config_key;

// Config key:
config_key = "screen_full";

switch (argument0)
{
    // Text:
    case 0:
        return "Fullscreen:";

    // Value:
    case 1:
        return string_bool(game_config_get(config_key));

    // Update:
    case 3:
        window_set_fullscreen(!game_config_get(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
