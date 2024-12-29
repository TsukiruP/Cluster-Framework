/// debug_option_sonic_aux_ground(return)

var save_key;

// Save key:
save_key = "sonic_aux_ground";

switch (argument0)
{
    // Text:
    case 0:
        return "Ground Auxiliary:";

    // Value:
    case 1:
        return pick(game_save_get(save_key), "None", "Hammer", "Skid");

    // Update:
    case 3:
        game_save_set(save_key, wrap(game_save_get(save_key) + menu_x_direction, SKILL_NONE, SKILL_SKID));
        return true;

    // Undefined:
    default:
        return undefined;
}
