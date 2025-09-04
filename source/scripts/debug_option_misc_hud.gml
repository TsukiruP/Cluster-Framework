/// debug_option_misc_hud(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "misc_hud";

switch (_index)
{
    case OPTION_TEXT:
        return "HUD:";

    case OPTION_VALUE:
        return pick(config_get(config_key), "None", "Default", "S4E2");

    case OPTION_CHANGE:
        if (_execute) config_set(config_key, wrap(config_get(config_key) + menu_x_direction, 0, 2));
        return true;

    default:
        return undefined;
}