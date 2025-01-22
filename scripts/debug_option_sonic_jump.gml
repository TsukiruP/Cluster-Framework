/// debug_option_sonic_jump(return)

var save_key;

save_key = "sonic_jump";

switch (argument0)
{
    // Text:
    case 0:
        return "Jump Skill:";

    // Value:
    case 1:
        return pick(game_get_save(save_key), "None", "Insta-Shield", "Air Dash", "Drop Dash");

    // Update:
    case 3:
        game_set_save(save_key, wrap(game_get_save(save_key) + menu_x_direction, SKILL_NONE, SKILL_DROP_DASH));
        return true;

    // Undefined:
    default:
        return undefined;
}
