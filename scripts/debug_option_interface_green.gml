/// debug_option_interface_green(return)

var config_key;

// Config key:
config_key = "interface_green";

switch (argument0)
{
    // Text:
    case 0:
        return "Green:";

    // Value:
    case 1:
        return string(game_config_get(config_key));

    // Update:
    case 3:
        if (in_range(game_config_get(config_key) + menu_x_direction, 0, 255))
        {
            game_config_set(config_key, clamp(game_config_get(config_key) + menu_x_direction, 0, 255));
            return true;
        }

        return false;

    // Undefined:
    default:
        return undefined;
}
