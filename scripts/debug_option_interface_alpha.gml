/// debug_option_interface_alpha(return)

var config_key;

// Config key:
config_key = "interface_alpha";

switch (argument0)
{
    // Text:
    case 0:
        return "Alpha:";

    // Value:
    case 1:
        return game_config_get(config_key);

    // Update:
    case 3:
        if (in_range(game_config_get(config_key) + menu_x_direction / 10, 0, 1))
        {
            game_config_set(config_key, clamp(game_config_get(config_key) + menu_x_direction / 10, 0, 1));
            return true;
        }

        return false;

    // Undefined:
    default:
        return undefined;
}
