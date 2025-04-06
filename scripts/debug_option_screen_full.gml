/// debug_option_screen_full(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "screen_full";

switch (_index)
{
    // Text:
    case 0:
        return "Fullscreen:";

    // Value:
    case 1:
        return string_bool(game_config_get(config_key), true);

    // Change:
    case 3:
        if (_execute) window_set_fullscreen(!game_config_get(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}