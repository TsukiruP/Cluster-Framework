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
        var skill_id;

        skill_id = game_save_get(skill_key);
        skill_id += menu_x_direction;
        skill_id = wrap(skill_id, SKILL_NONE, SKILL_SKID);

        game_save_set(skill_key, skill_id);

        return true;

    // Undefined:
    default:
        return undefined;
}
