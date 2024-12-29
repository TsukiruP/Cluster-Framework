/// debug_option_sonic_aux_air(return)

var save_key;

// Save key:
save_key = "sonic_aux_air";

switch (argument0)
{
    // Text:
    case 0:
        return "Air Auxiliary:";

    // Value:
    case 1:
        return pick(game_save_get(save_key), "None", "Insta-Shield", "Air Dash");

    // Update:
    case 3:
        game_save_set(save_key, wrap(game_save_get(save_key) + menu_x_direction, SKILL_NONE, SKILL_AIR_DASH));
        return true;

    // Undefined:
    default:
        return undefined;
}
