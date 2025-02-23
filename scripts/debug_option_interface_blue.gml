/// debug_option_interface_blue(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var config_key; config_key = "interface_blue";

switch (_return)
{
    // Text:
    case 0:
        return "Blue:";

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