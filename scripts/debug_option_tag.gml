/// debug_option_tag(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var save_key; save_key = "tag";

switch (_index)
{
    case OPTION_TEXT:
        return "Tag:";

    case OPTION_VALUE:
        return string_bool(game_save_get(save_key), true);

    case OPTION_CHANGE:
        if (_execute) game_save_set(save_key, !game_save_get(save_key));
        return true;

    default:
        return undefined;
}