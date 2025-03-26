/// debug_option_config_read(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Read Config";

    // Confirm:
    case 2:
        if (_execute)
        {
            game_read_config();
            window_set_fullscreen(game_get_config("screen_full"));
        }
        
        return true;

    // Undefined:
    default:
        return undefined;
}