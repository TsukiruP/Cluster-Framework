/// debug_option_sonic_shield(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var skill_key; skill_key = "shield";

switch (_index)
{
    case OPTION_TEXT:
        return "Shield Skills:";

    case OPTION_VALUE:
        return string_bool(game_save_get_skill(CHAR_SONIC, skill_key), true);

    case OPTION_CHANGE:
        if (_execute) game_save_set_skill(CHAR_SONIC, skill_key, !game_save_get_skill(CHAR_SONIC, skill_key));
        return true;

    default:
        return undefined;
}