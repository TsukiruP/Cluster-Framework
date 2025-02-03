/// debug_option_sonic_homing(return)

var skill_key;

skill_key = "homing";

switch (argument0)
{
    // Text:
    case 0:
        return "Homing Attack:";

    // Value:
    case 1:
        return pick(game_save_get_skill(CHAR_SONIC, skill_key), "None", "1999", "2007", "2022", "2024");

    // Update:
    case 3:
        game_save_set_skill(CHAR_SONIC, skill_key, wrap(game_save_get_skill(CHAR_SONIC, skill_key) + menu_x_direction, HOMING_NONE, HOMING_GENERATIONS));
        return true;

    // Undefined:
    default:
        return undefined;
}
