/// debug_option_sonic_shield(return)

var save_key;

// Save key:
save_key = "sonic_shield";

switch (argument0)
{
    // Text:
    case 0:
        return "Shield Skills:";

    // Value:
    case 1:
        return string_bool(game_save_get(save_key));

    // Update:
    case 3:
        game_save_set(save_key, !game_save_get(save_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
