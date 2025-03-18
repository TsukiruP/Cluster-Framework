/// debug_option_boost(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var save_key; save_key = "boost";

switch (_return)
{
    // Text:
    case 0:
        return "Boost:";

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
