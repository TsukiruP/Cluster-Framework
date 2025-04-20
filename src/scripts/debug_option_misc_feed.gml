/// debug_option_misc_feed(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "misc_feed";

switch (_index)
{
    case OPTION_TEXT:
        return "Item Feed:";

    case OPTION_VALUE:
        return string_bool(game_config_get(config_key), true);

    case OPTION_CHANGE:
        if (_execute) game_config_set(config_key, !game_config_get(config_key));
        return true;

    default:
        return undefined;
}