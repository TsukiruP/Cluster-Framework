/// debug_option_misc_status(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var config_key; config_key = "misc_status";

switch (_return)
{
    // Text:
    case 0:
        return "Status:";

    // Value:
    case 1:
        return pick(game_get_config(config_key), "Off", "Active", "All");

    // Update:
    case 3:
        game_set_config(config_key, wrap(game_get_config(config_key) + menu_x_direction, 0, 2));
        return true;

    // Undefined:
    default:
        return undefined;
}
