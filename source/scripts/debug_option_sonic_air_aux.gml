/// debug_option_sonic_air_aux(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var character_key; character_key = CHAR_SONIC;
var skill_key; skill_key = "air_aux";

switch (_index)
{
    case OPTION_TEXT:
        return "Aux Skill:";

    case OPTION_VALUE:
        return pick(save_get_skill(character_key, skill_key), "None", "Insta-Shield", "Air Dash");

    case OPTION_SELECT:
        if (_execute)
        {
            switch (save_get_skill(character_key, skill_key))
            {
                case SKILL_NONE:
                    text_set_body("Nothing will occur when you press " + string_input(INP_AUX) + " while in the air.");
                    break;
                
                case SONIC_INSTA:
                    text_set_body("Press " + string_input(INP_AUX) + " to create an Insta-Shield.",
                    "The Insta-Shield provides brief invincibility while also deflecting most projectiles, but can only be perfomed once in mid-air.");
                    break;
                
                case SONIC_AIR_DASH:
                    text_set_body("Press " + string_input(INP_AUX) + " to dash through the air.",
                    "This dash cancels youre vertical speed while adding to your horizontal speed, but can only be performed once in mid-air.");
                    break;
            }
        }
        
        return true;
    
    case OPTION_CHANGE:
        if (_execute) save_set_skill(character_key, skill_key, wrap(save_get_skill(character_key, skill_key) + menu_x_direction, SKILL_NONE, SONIC_AIR_DASH));
        return true;

    default:
        return undefined;
}