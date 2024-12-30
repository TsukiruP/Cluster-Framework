/// debug_option_advance_brake(return)

var config_key;

// Config key:
config_key = "advance_brake";

switch (argument0)
{
    // Text:
    case 0:
        return "Brake:";

    // Value:
    case 1:
        return pick(game_config_get(config_key), "Classic", "Advance");

    // Update:
    case 3:
        game_config_set(config_key, !game_config_get(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
