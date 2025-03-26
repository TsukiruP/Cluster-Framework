/// debug_option_misc_hud(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "misc_hud";

switch (_return)
{
    // Text:
    case 0:
        return "HUD:";

    // Value:
    case 1:
        return pick(game_get_config(config_key), "None", "Default", "S4E2");

    // Update:
    case 3:
        if (_execute) game_set_config(config_key, wrap(game_get_config(config_key) + menu_x_direction, 0, 2));
        return true;

    // Undefined:
    default:
        return undefined;
}