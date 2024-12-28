/// debug_option_sonic_jump(return)

var skill_key;

// Skill key:
skill_key = "sonic_jump";

switch (argument0)
{
    // Text:
    case 0:
        return "Jump Skill:";

    // Value:
    case 1:
        return pick(game_save_get(skill_key), "None", "Insta-Shield", "Air Dash", "Drop Dash");

    // Update:
    case 3:
        game_save_set(skill_key, wrap(game_save_get(skill_key) + menu_x_direction, SKILL_NONE, SKILL_DROP_DASH));
        return true;

    // Undefined:
    default:
        return undefined;
}
