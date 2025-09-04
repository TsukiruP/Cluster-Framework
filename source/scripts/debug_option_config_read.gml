/// debug_option_config_read(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Read All";

    case OPTION_CONFIRM:
        if (_execute)
        {
            config_read();
            window_set_fullscreen(config_get("screen_full"));
        }

        return true;

    default:
        return undefined;
}