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
        return string_bool(game_get_config(config_key), true);

    // Update:
    case 3:
        window_set_fullscreen(!game_get_config(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
