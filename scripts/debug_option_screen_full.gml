/// debug_option_screen_full(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

var config_key; config_key = "screen_full";

switch (_return)
{
    // Text:
    case 0:
        return "Fullscreen:";

    // Value:
    case 1:
        return string_bool(game_get_config(config_key), true);

    // Update:
    case 3:
        window_set_fullscreen(!game_get_config(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
