/// debug_option_misc_status(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "misc_status";

switch (_index)
{
    case OPTION_TEXT:
        return "Status:";

    case OPTION_VALUE:
        return pick(config_get(config_key), "Off", "Active", "All");
    
    case OPTION_SELECT:
        if (_execute)
        {
            text_set_body(pick(config_get(config_key),
            "There will be no display of status effects.",
            "There will be a display of active status effects on the top right of the screen.",
            "All status icons will be on the top right of the screen, regardless if they're active or not."));
        }
        
        return true;

    case OPTION_CHANGE:
        if (_execute) config_set(config_key, wrap(config_get(config_key) + menu_x_direction, 0, 2));
        return true;

    default:
        return undefined;
}