/// debug_option_sonic_air_aux(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

var skill_key; skill_key = "air_aux";

switch (_return)
{
    // Text:
    case 0:
        return "Aux Skill:";

    // Value:
    case 1:
        return pick(game_save_get_skill(CHAR_SONIC, skill_key), "None", "Insta-Shield", "Air Dash");

    // Update:
    case 3:
        game_save_set_skill(CHAR_SONIC, skill_key, wrap(game_save_get_skill(CHAR_SONIC, skill_key) + menu_x_direction, SKILL_NONE, SKILL_AIR_DASH));
        return true;

    // Undefined:
    default:
        return undefined;
}
