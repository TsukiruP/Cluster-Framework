/// debug_option_sonic_homing(return)

var save_key;

save_key = "sonic_homing";

switch (argument0)
{
    // Text:
    case 0:
        return "Homing Attack:";

    // Value:
    case 1:
        return pick(game_get_save(save_key), "None", "Adventure", "Unleashed", "Frontiers", "Generations");

    // Update:
    case 3:
        game_set_save(save_key, wrap(game_get_save(save_key) + menu_x_direction, HOMING_NONE, HOMING_GENERATIONS));
        return true;

    // Undefined:
    default:
        return undefined;
}
