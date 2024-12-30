/// debug_option_gameplay_checkpoint(return)

var config_key;

// Config key:
config_key = "gameplay_checkpoint";

switch (argument0)
{
    // Text:
    case 0:
        return "Checkpoint Bonuses:";

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
