/// debug_option_miles_fly_controls(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var character_key; character_key = CHAR_MILES;
var skill_key; skill_key = "fly_controls";

switch (_index)
{
    case OPTION_TEXT:
        return "Fly Controls:";

    case OPTION_VALUE:
        return pick(save_get_skill(character_key, skill_key), "Adventure", "Classic");

    case OPTION_SELECT:
        if (_execute)
        {
            text_set_body(pick(save_get_skill(character_key, skill_key), "Hold", "Press") + " " + string_input(INP_JUMP) + " to ascend while flying.");
        }
        
        return true;
    
    case OPTION_CHANGE:
        if (_execute) save_set_skill(character_key, skill_key, wrap(save_get_skill(character_key, skill_key) + menu_x_direction, CHECK_HELD, CHECK_PRESSED));
        return true;

    default:
        return undefined;
}