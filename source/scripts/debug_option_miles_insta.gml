/// debug_option_miles_insta(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var character_key; character_key = CHAR_MILES;
var skill_key; skill_key = "insta";

switch (_index)
{
    case OPTION_TEXT:
        return "Insta-Shield:";

    case OPTION_VALUE:
        return string_bool(save_get_skill(character_key, skill_key), true);

    case OPTION_SELECT:
        if (_execute)
        {
            text_set_body(pick(save_get_skill,
            "Nothing will occur when you press " + string_input(INP_AUX) + " while in mid-air.",
            "Press " + string_input(INP_AUX) + " while in mid-air to create an Insta-Shield."));
        }
        
        return true;
    
    case OPTION_CHANGE:
        if (_execute) save_set_skill(character_key, skill_key, !save_get_skill(character_key, skill_key));
        return true;

    default:
        return undefined;
}