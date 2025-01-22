/// debug_option_sonic_aux_air(return)

var save_key;

save_key = "sonic_aux_air";

switch (argument0)
{
    // Text:
    case 0:
        return "Air Auxiliary:";

    // Value:
    case 1:
        return pick(game_get_save(save_key), "None", "Insta-Shield", "Air Dash");

    // Update:
    case 3:
        game_set_save(save_key, wrap(game_get_save(save_key) + menu_x_direction, SKILL_NONE, SKILL_AIR_DASH));
        return true;

    // Undefined:
    default:
        return undefined;
}
