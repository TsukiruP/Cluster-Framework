/// debug_option_misc_hud(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

var config_key; config_key = "misc_hud";

switch (_index)
{
    // Text:
    case 0:
        return "HUD:";

    // Value:
    case 1:
        return pick(game_get_config(config_key), "None", "Default", "S4E2");

    // Update:
    case 3:
        if (_event) game_set_config(config_key, wrap(game_get_config(config_key) + menu_x_direction, 0, 2));
        return true;

    // Undefined:
    default:
        return undefined;
}
