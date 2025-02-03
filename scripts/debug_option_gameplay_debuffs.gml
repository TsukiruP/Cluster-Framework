/// debug_option_gameplay_debuffs(return)

var config_key;

config_key = "gameplay_debuffs";

switch (argument0)
{
    // Text:
    case 0:
        return "Debuffs:";

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
