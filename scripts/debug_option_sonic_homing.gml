/// debug_option_sonic_homing(return)

var skill_key;

// Skill key:
skill_key = "sonic_homing";

switch (argument0)
{
    // Text:
    case 0:
        return "Homing Attack:";

    // Value:
    case 1:
        return pick(game_save_get(skill_key), "None", "Adventure", "Unleashed", "Frontiers", "Generations");

    // Update:
    case 3:
        game_save_set(skill_key, wrap(game_save_get(skill_key) + menu_x_direction, HOMING_NONE, HOMING_GENERATIONS));
        return true;

    // Undefined:
    default:
        return undefined;
}
