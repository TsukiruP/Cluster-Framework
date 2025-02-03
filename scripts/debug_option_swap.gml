/// debug_option_swap(return)

var save_key;

save_key = "swap";

switch (argument0)
{
    // Text:
    case 0:
        return "Swap:";

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
