/// debug_option_screen_full(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

var config_key; config_key = "screen_full";

switch (_index)
{
    // Text:
    case 0:
        return "Fullscreen:";

    // Value:
    case 1:
        return string_bool(game_get_config(config_key), true);

    // Update:
    case 3:
        if (_event) window_set_fullscreen(!game_get_config(config_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
