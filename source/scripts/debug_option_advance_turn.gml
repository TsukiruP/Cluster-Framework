/// debug_option_advance_turn(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "advance_turn";

switch (_index)
{
    case OPTION_TEXT:
        return "Turn:";

    case OPTION_VALUE:
        return string_bool(config_get(config_key), true);

    case OPTION_SELECT:
        if (_execute)
        {
            text_set_body(pick(config_get(config_key),
            "Characters will not enter a turning state when they change directions on the ground.",
            "Characters will enter a turning a state when they change directions on the ground. Does not apply to Classic Sonic."));
        }

        return true;

    case OPTION_CHANGE:
        if (_execute) config_set(config_key, !config_get(config_key));
        return true;

    default:
        return undefined;
}
