/// debug_option_gameplay_shields(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

var config_key; config_key = "gameplay_shields";

switch (_index)
{
    // Text:
    case 0:
        return "Shields:";

    // Value:
    case 1:
        return pick(game_get_config(config_key), "All", "Basic/Magnetic", "Basic");

    // Update:
    case 3:
        if (_event) game_set_config(config_key, wrap(game_get_config(config_key) + menu_x_direction, 0, 2));
        return true;

    // Undefined:
    default:
        return undefined;
}
