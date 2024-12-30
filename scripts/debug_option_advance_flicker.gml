/// debug_option_advance_flicker(return)

var config_key;

// Config key:
config_key = "advance_flicker";

switch (argument0)
{
    // Text:
    case 0:
        return "Flicker:";

    // Value:
    case 1:
        return string_bool(game_config_get(config_key));

    // Update:
    case 3:
        game_config_set(config_key, !game_config_get(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
