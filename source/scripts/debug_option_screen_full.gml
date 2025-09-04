/// debug_option_screen_full(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "screen_full";

switch (_index)
{
    case OPTION_TEXT:
        return "Fullscreen:";

    case OPTION_VALUE:
        return string_bool(config_get(config_key), true);

    case OPTION_SELECT:
        if (_execute) text_set_body("Sets the game in fullscreen.");
        return true;

    case OPTION_CHANGE:
        if (_execute) window_set_fullscreen(!config_get(config_key));
        return true;

    default:
        return undefined;
}