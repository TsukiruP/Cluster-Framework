/// debug_option_sonic_jump(data)

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
    case 4:
        var skill_id;

        skill_id = game_save_get(skill_key);
        skill_id += menu_x_direction;
        skill_id = wrap(skill_id, SKILL_NONE, SKILL_DROP_DASH);

        game_save_set(skill_key, skill_id);

        return true;

    // Default:
    default:
        return undefined;
}
