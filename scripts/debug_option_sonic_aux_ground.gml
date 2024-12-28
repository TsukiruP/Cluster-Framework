/// debug_option_sonic_aux_ground(return)

var skill_key;

// Skill key:
skill_key = "sonic_aux_ground";

switch (argument0)
{
    // Text:
    case 0:
        return "Ground Auxiliary:";

    // Value:
    case 1:
        return pick(game_save_get(skill_key), "None", "Hammer", "Skid");

    // Update:
    case 3:
        game_save_set(skill_key, wrap(game_save_get(skill_key) + menu_x_direction, SKILL_NONE, SKILL_SKID));
        return true;

    // Undefined:
    default:
        return undefined;
}
