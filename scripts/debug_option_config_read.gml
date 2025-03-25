/// debug_option_config_read(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Read Config";

    // Confirm:
    case 2:
        game_read_config();
        window_set_fullscreen(game_get_config("screen_full"));
        return true;

    // Undefined:
    default:
        return undefined;
}
