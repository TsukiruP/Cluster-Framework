/// debug_option_sonic_homing(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var character_key; character_key = CHAR_SONIC;
var skill_key; skill_key = "homing";

switch (_index)
{
    case OPTION_TEXT:
        return "Homing Attack:";

    case OPTION_VALUE:
        return pick(save_get_skill(character_key, skill_key), "None", "1998", "2008", "2022", "2024");

    case OPTION_SELECT:
        if (_execute)
        {
            switch (save_get_skill(character_key, skill_key))
            {
                case HOMING_ADVENTURE:
                    text_set_body("Press " + string_input(INP_JUMP) + " to perform a Homing Attack, overriding any Jump Skill.",
                    "Hold " + string_input(INP_ALT) + " to disable the override.");
                    break;
                
                case HOMING_UNLEASHED:
                    text_set_body("Press " + string_input(INP_AUX) + " to perform a Homing Attack, overriding any Aux Skill.",
                    "Hold " + string_input(INP_ALT) + " to disable the override.");
                    break;
                
                case HOMING_FRONTIERS:
                    text_set_body("Press " + string_input(INP_AUX) + " to perform a Homing Attack, overriding any Ground and Aux Skill. This Homing Attack can be performed from the ground.",
                    "Hold " + string_input(INP_ALT) + " to disable the override.");
                    break;
                
                case HOMING_GENERATIONS:
                    text_set_body("Press " + string_input(INP_JUMP) + " or " + string_input(INP_AUX) + " to perform a Homing Attack, overriding any Jump and Aux Skill.",
                    "Hold " + string_input(INP_ALT) + " to disable the override.");
                    break;
                
                default:
                    text_set_body("No Homing Attack occurs when pressing " + string_input(INP_JUMP) + " or " + string_input(INP_AUX) + ".");
            }
        }
        
        return true;
    
    case OPTION_CHANGE:
        if (_execute) save_set_skill(character_key, skill_key, wrap(save_get_skill(character_key, skill_key) + menu_x_direction, HOMING_NONE, HOMING_GENERATIONS));
        return true;

    default:
        return undefined;
}