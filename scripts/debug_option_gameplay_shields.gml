/// debug_option_gameplay_shields(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var config_key; config_key = "gameplay_shields";

switch (_return)
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
