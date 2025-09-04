/// debug_option_sonic_slam(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var character_key; character_key = CHAR_SONIC;
var skill_key; skill_key = "slam";

switch (_index)
{
    case OPTION_TEXT:
        return "Slam Skill:";

    case OPTION_VALUE:
        return pick(save_get_skill(character_key, skill_key), "None", "Bound", "Stomp");

    case OPTION_SELECT:
        if (_execute)
        {
            switch (save_get_skill(character_key, skill_key))
            {
                case SKILL_NONE:
                    text_set_body("Nothing will occur when you hold " + string_input(INP_DOWN) + " and press " + string_input(INP_AUX) + " while in the air.");
                    break;
                
                case SONIC_BOUND:
                    text_set_body("Hold " + string_input(INP_DOWN) + " and press " + string_input(INP_AUX) + " to curl up into a ball to move downward before bouncing off the ground.",
                    "The height of the bounce increases up to 3 times.");
                    break;
                
                case SONIC_STOMP:
                    text_set_body("Hold " + string_input(INP_DOWN) + " and press " + string_input(INP_AUX) + " to stall in mid-air before performing a diagonal flying kick.",
                    "There is ending lag, but can be skipped by performing a Spin Dash or Super Peel out.");
                    break;
            }
        }
        
        return true;
    
    case OPTION_CHANGE:
        if (_execute) save_set_skill(character_key, skill_key, wrap(save_get_skill(character_key, skill_key) + menu_x_direction, SKILL_NONE, SONIC_STOMP));
        return true;

    default:
        return undefined;
}