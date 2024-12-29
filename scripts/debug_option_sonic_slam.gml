/// debug_option_sonic_slam(return)

var save_key;

// Save key:
save_key = "sonic_slam";

switch (argument0)
{
    // Text:
    case 0:
        return "Slam Skill:";

    // Value:
    case 1:
        return pick(game_save_get(save_key), "None", "Bound", "Stomp");

    // Update:
    case 3:
        game_save_set(save_key, wrap(game_save_get(save_key) + menu_x_direction, SKILL_NONE, SKILL_STOMP));
        return true;

    // Undefined:
    default:
        return undefined;
}
