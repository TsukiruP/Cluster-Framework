/// debug_option_sonic_homing(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var skill_key; skill_key = "homing";

switch (_index)
{
    case OPTION_TEXT:
        return "Homing Attack:";

    case OPTION_VALUE:
        return pick(game_save_get_skill(CHAR_SONIC, skill_key), "None", "1998", "2008", "2022", "2024");

    case OPTION_CHANGE:
        if (_execute) game_save_set_skill(CHAR_SONIC, skill_key, wrap(game_save_get_skill(CHAR_SONIC, skill_key) + menu_x_direction, HOMING_NONE, HOMING_GENERATIONS));
        return true;

    default:
        return undefined;
}