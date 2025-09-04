/// debug_option_advance_flicker(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "advance_flicker";

switch (_index)
{
    case OPTION_TEXT:
        return "Flicker:";

    case OPTION_VALUE:
        return string_bool(config_get(config_key), true);

    case OPTION_SELECT:
        if (_execute)
        {
            text_set_body(pick(config_get(config_key),
            "Some effects, such as the Basic Shield, Magnetic Shield, and Invincibiity, will be transparent in place of flickering.",
            "Effects will flicker as they do in Sonic Advance."));
        }

        return true;

    case OPTION_CHANGE:
        if (_execute) config_set(config_key, !config_get(config_key));
        return true;

    default:
        return undefined;
}
