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

    case OPTION_SELECT:
        if (_execute)
        {
            switch (save_get_skill(character_key, skill_key))
            {
                case SKILL_NONE:
                    text_set_body("Nothing will occur when you press " + string_input(INP_AUX) + " while on the ground.");
                    break;
                
                case SKILL_HAMMER:
                    text_set_body("Press " + string_input(INP_AUX) + " to stop and swing a Piko Piko Hammer.");
                    break;
                
                case MILES_TAIL:
                    text_set_body("Press " + string_input(INP_AUX) + " to perform a tail swipe.");
                    break;
                
                case MILES_TORNADO:
                    text_set_body("Press and hold " + string_input(INP_AUX) + " to perform a tornado attack.",
                    "Your speed is greatly reduced while attacking and will get dizzy if you do it for too long.");
                    break;
            }
        }
        
        return true;
    
    case OPTION_CHANGE:
        if (_execute) save_set_skill(character_key, skill_key, wrap(save_get_skill(character_key, skill_key) + menu_x_direction, SKILL_NONE, MILES_TORNADO));
        return true;

    default:
        return undefined;
}