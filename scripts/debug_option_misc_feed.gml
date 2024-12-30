/// debug_option_misc_feed(return)

var config_key;

// Config key:
config_key = "misc_feed";

switch (argument0)
{
    // Text:
    case 0:
        return "Item Feed:";

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
