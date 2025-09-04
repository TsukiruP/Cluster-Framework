/// debug_option_sonic_shield(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var character_key; character_key = CHAR_SONIC;
var skill_key; skill_key = "shield";

switch (_index)
{
    case OPTION_TEXT:
        return "Shield Skills:";

    case OPTION_VALUE:
        return string_bool(save_get_skill(character_key, skill_key), true);
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Toggles Shield Skills when equipped with Elemental Shields.",
        "Shield Skills are bound to any aerial skill set to None or Insta-Shield.");
        return true;
    
    case OPTION_CHANGE:
        if (_execute) save_set_skill(character_key, skill_key, !save_get_skill(character_key, skill_key));
        return true;

    default:
        return undefined;
}