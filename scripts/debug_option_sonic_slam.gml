/// debug_option_sonic_slam(return)

var save_key;

save_key = "sonic_slam";

switch (argument0)
{
    // Text:
    case 0:
        return "Slam Skill:";

    // Value:
    case 1:
        return pick(game_get_save(save_key), "None", "Bound", "Stomp");

    // Update:
    case 3:
        game_set_save(save_key, wrap(game_get_save(save_key) + menu_x_direction, SKILL_NONE, SKILL_STOMP));
        return true;

    // Undefined:
    default:
        return undefined;
}
