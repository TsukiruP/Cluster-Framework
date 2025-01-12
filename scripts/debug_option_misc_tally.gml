/// debug_option_misc_tally(return)

var config_key;

// Config key:
config_key = "misc_tally";

switch (argument0)
{
    // Text:
    case 0:
        return "Tally BGM:";

    // Value:
    case 1:
        return string_bool(game_get_config(config_key), true);

    // Update:
    case 3:
        game_set_config(config_key, !game_get_config(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
