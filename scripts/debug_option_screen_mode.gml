/// debug_option_screen_mode(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

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
        if (_execute)
        {
            game_set_config(config_key, wrap(game_get_config(config_key) + menu_x_direction, 0, 2));
            game_set_config("screen_ratio", 0);
        }
        
        return true;

    // Undefined:
    default:
        return undefined;
}