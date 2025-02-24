/// debug_option_misc_tally(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var config_key; config_key = "misc_tally";

switch (_return)
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