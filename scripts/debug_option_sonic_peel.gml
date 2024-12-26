/// debug_option_sonic_peel(data)

var skill_key;

// Skill key:
skill_key = "sonic_peel";

switch (argument0)
{
    // Text:
    case 0:
        return "Peel Out:";

    // Value:
    case 1:
        return string_bool(game_save_get(skill_key));

    // Update:
    case 3:
        var skill_id;

        skill_id = game_save_get(skill_key);
        skill_id += menu_x_direction;
        skill_id = wrap(skill_id, false, true);

        game_save_set(skill_key, skill_id);

        return true;

    // Default:
    default:
        return undefined;
}
