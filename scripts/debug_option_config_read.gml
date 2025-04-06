/// debug_option_config_read(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    // Text:
    case 0:
        return "Read Config";

    // Confirm:
    case 4:
        if (_execute)
        {
            game_config_read();
            window_set_fullscreen(game_config_get("screen_full"));
        }

        return true;

    // Undefined:
    default:
        return undefined;
}