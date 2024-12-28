/// debug_option_sonic_peel(return)

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
        game_save_set(skill_key, wrap(game_save_get(skill_key) + menu_x_direction, false, true));
        return true;

    // Undefined:
    default:
        return undefined;
}
