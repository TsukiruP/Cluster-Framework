/// debug_option_misc_status(return)

var config_key;

// Config key:
config_key = "misc_status";

switch (argument0)
{
    // Text:
    case 0:
        return "Status:";

    // Value:
    case 1:
        return pick(game_config_get(config_key), "Off", "Active Only", "All");

    // Update:
    case 3:
        game_config_set(config_key, wrap(game_config_get(config_key) + menu_x_direction, 0, 2));
        return true;

    // Undefined:
    default:
        return undefined;
}
