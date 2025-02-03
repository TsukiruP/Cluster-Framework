/// debug_option_interface_alpha(return)

var config_key;

config_key = "interface_alpha";

switch (argument0)
{
    // Text:
    case 0:
        return "Alpha:";

    // Value:
    case 1:
        return string(game_get_config(config_key));

    // Update:
    case 3:
        if (in_range(game_get_config(config_key) + menu_x_direction / 100, 0, 1))
        {
            game_set_config(config_key, clamp(game_get_config(config_key) + menu_x_direction / 100, 0, 1));
            return true;
        }

        return false;

    // Undefined:
    default:
        return undefined;
}
