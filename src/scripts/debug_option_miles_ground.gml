/// debug_option_miles_ground(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var character_key; character_key = CHAR_MILES;
var skill_key; skill_key = "ground";

switch (_index)
{
    case OPTION_TEXT:
        return "Ground Skill:";

    case OPTION_VALUE:
        return pick(save_get_skill(character_key, skill_key), "None", "Hammer", "Tail Swipe", "Tornado");

    case OPTION_CHANGE:
        if (_execute) save_set_skill(character_key, skill_key, wrap(save_get_skill(character_key, skill_key) + menu_x_direction, SKILL_NONE, MILES_TORNADO));
        return true;

    default:
        return undefined;
}
