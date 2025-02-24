/// debug_option_sonic_shield(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var skill_key; skill_key = "shield";

switch (_return)
{
    // Text:
    case 0:
        return "Shield Skills:";

    // Value:
    case 1:
        return string_bool(game_save_get_skill(CHAR_SONIC, skill_key), true);

    // Update:
    case 3:
        game_save_set_skill(CHAR_SONIC, skill_key, !game_save_get_skill(CHAR_SONIC, skill_key));
        return true;

    // Undefined:
    default:
        return undefined;
}