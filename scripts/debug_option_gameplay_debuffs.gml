/// debug_option_gameplay_debuffs(return)

var config_key;

// Config key:
config_key = "gameplay_debuffs";

switch (argument0)
{
    // Text:
    case 0:
        return "Debuffs:";

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
