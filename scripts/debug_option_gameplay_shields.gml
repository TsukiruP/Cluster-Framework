/// debug_option_gameplay_shields(return)

var config_key;

// Config key:
config_key = "gameplay_shields";

switch (argument0)
{
    // Text:
    case 0:
        return "Shields:";

    // Value:
    case 1:
        return pick(game_get_config(config_key), "All", "Basic/Magnetic", "Basic");

    // Update:
    case 3:
        game_set_config(config_key, wrap(game_get_config(config_key) + menu_x_direction, 0, 2));
        return true;

    // Undefined:
    default:
        return undefined;
}
