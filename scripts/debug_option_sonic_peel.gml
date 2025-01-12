/// debug_option_sonic_peel(return)

var save_key;

// Save key:
save_key = "sonic_peel";

switch (argument0)
{
    // Text:
    case 0:
        return "Peel Out:";

    // Value:
    case 1:
        return string_bool(game_get_save(save_key), true);

    // Update:
    case 3:
        game_set_save(save_key, !game_get_save(save_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
