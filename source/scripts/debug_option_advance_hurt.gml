/// debug_option_advance_hurt(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "advance_hurt";

switch (_index)
{
    case OPTION_TEXT:
        return "Hurt:";

    case OPTION_VALUE:
        return pick(config_get(config_key), "Classic", "Advance");
    
    case OPTION_SELECT:
        if (_execute)
        {
            text_set_body(pick(config_get(config_key),
            "Landing after being hurt resets your speed, like in Sonic 1.",
            "Landing after being hurt keeps your speed, like in the Sonic Advance series."));
        }
        
        return true;

    case OPTION_CHANGE:
        if (_execute) config_set(config_key, !config_get(config_key));
        return true;

    default:
        return undefined;
}