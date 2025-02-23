/// debug_option_interface_green(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var config_key; config_key = "interface_green";

switch (_return)
{
    // Text:
    case 0:
        return "Green:";

    // Value:
    case 1:
        return string(game_get_config(config_key));

    // Update:
    case 3:
        if (in_range(game_get_config(config_key) + menu_x_direction, 0, 255))
        {
            game_set_config(config_key, clamp(game_get_config(config_key) + menu_x_direction, 0, 255));
            return true;
        }

        return false;

    // Undefined:
    default:
        return undefined;
}