/// debug_option_misc_reticle(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "misc_reticle";

switch (_index)
{
    case OPTION_TEXT:
        return "Reticle:";

    case OPTION_VALUE:
        return pick(config_get(config_key), "None", "Default", "Colors DS");
    
    case OPTION_SELECT:
        if (_execute)
        {
            text_set_body(pick(config_get(config_key),
            "The Homing Attack will not create a reticle when it finds a target.",
            "The Homing Attack will create the default reticle when it finds a target.",
            "The Homing Attack will create the reticle from Sonic Colors (DS) when it finds a target."));
        }
        
        return true;

    case OPTION_CHANGE:
        if (_execute) config_set(config_key, wrap(config_get(config_key) + menu_x_direction, 0, 2));
        return true;

    default:
        return undefined;
}