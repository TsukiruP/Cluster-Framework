/// debug_option_screen_mode(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var config_key; config_key = "screen_mode";

switch (_return)
{
    // Text:
    case 0:
        return "Mode:";

    // Value:
    case 1:
        return pick(game_get_config(config_key), "Default", "3DS", "Misc.");

    // Update:
    case 3:
        game_set_config(config_key, wrap(game_get_config(config_key) + menu_x_direction, 0, 2));
        game_set_config("screen_ratio", 0);
        return true;

    // Undefined:
    default:
        return undefined;
}
