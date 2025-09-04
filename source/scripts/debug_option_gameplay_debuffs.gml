/// debug_option_gameplay_debuffs(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "gameplay_debuffs";

switch (_index)
{
    case OPTION_TEXT:
        return "Debuffs:";

    case OPTION_VALUE:
        return string_bool(config_get(config_key), true);

    case OPTION_SELECT:
        if (_execute)
        {
            text_set_body(pick(config_get(config_key),
            "Replaces all debuff items with mines.",
            "Allows all debuff items to appear during gameplay."));
        }

        return true;

    case OPTION_CHANGE:
        if (_execute) config_set(config_key, !config_get(config_key));
        return true;

    default:
        return undefined;
}