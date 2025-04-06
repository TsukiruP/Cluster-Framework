/// debug_option_sonic_shield(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var skill_key; skill_key = "shield";

switch (_index)
{
    // Text:
    case 0:
        return "Shield Skills:";

    // Value:
    case 1:
        return string_bool(game_save_get_skill(CHAR_SONIC, skill_key), true);

    // Change:
    case 3:
        if (_execute) game_save_set_skill(CHAR_SONIC, skill_key, !game_save_get_skill(CHAR_SONIC, skill_key));
        return true;

    // Undefined:
    default:
        return undefined;
}