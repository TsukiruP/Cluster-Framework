/// debug_option_advance_hurt(return)

var config_key;

// Config key:
config_key = "advance_hurt";

switch (argument0)
{
    // Text:
    case 0:
        return "Hurt:";

    // Value:
    case 1:
        return pick(game_get_config(config_key), "Classic", "Advance");

    // Update:
    case 3:
        game_set_config(config_key, !game_get_config(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
