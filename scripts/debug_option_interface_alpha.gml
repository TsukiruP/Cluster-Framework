/// debug_option_interface_alpha(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

var config_key; config_key = "interface_alpha";

switch (_index)
{
    // Text:
    case 0:
        return "Alpha:";

    // Value:
    case 1:
        return string(game_get_config(config_key));

    // Change:
    case 3:
        if (in_range(game_get_config(config_key) + menu_x_direction / 100, 0, 1))
        {
            if (_event) game_set_config(config_key, clamp(game_get_config(config_key) + menu_x_direction / 100, 0, 1));
            return true;
        }

        return false;

    // Undefined:
    default:
        return undefined;
}