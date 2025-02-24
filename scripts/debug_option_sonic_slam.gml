/// debug_option_sonic_slam(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var skill_key; skill_key = "slam";

switch (_return)
{
    // Text:
    case 0:
        return "Slam Skill:";

    // Value:
    case 1:
        return pick(game_save_get_skill(CHAR_SONIC, skill_key), "None", "Bound", "Stomp");

    // Update:
    case 3:
        game_save_set_skill(CHAR_SONIC, skill_key, wrap(game_save_get_skill(CHAR_SONIC, skill_key) + menu_x_direction, SKILL_NONE, SKILL_STOMP));
        return true;

    // Undefined:
    default:
        return undefined;
}