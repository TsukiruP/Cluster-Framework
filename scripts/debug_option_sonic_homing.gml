/// debug_option_sonic_homing(data)

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
        var skill_id;

        skill_id = game_save_get(skill_key);
        skill_id += menu_x_direction;
        skill_id = wrap(skill_id, HOMING_NONE, HOMING_GENERATIONS);

        game_save_set(skill_key, skill_id);

        return true;

    // Default:
    default:
        return undefined;
}
