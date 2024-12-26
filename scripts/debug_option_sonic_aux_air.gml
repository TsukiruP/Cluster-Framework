/// debug_option_sonic_aux_air(data)

var skill_key;

// Skill key:
skill_key = "sonic_aux_air";

switch (argument0)
{
    // Text:
    case 0:
        return "Air Auxiliary:";

    // Value:
    case 1:
        return pick(game_save_get(skill_key), "None", "Insta-Shield", "Air Dash");

    // Update:
    case 3:
        var skill_id;

        skill_id = game_save_get(skill_key);
        skill_id += menu_x_direction;
        skill_id = wrap(skill_id, SKILL_NONE, SKILL_SKID);

        game_save_set(skill_key, skill_id);

        return true;

    // Default:
    default:
        return undefined;
}
