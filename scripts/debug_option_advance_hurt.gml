/// debug_option_advance_hurt(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "advance_hurt";

switch (_index)
{
    case OPTION_TEXT:
        return "Hurt:";

    case OPTION_VALUE:
        return pick(game_config_get(config_key), "Classic", "Advance");

    case OPTION_CHANGE:
        if (_execute) game_config_set(config_key, !game_config_get(config_key));
        return true;

    default:
        return undefined;
}