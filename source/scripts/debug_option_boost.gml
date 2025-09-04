/// debug_option_boost(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var save_key; save_key = "boost";

switch (_index)
{
    case OPTION_TEXT:
        return "Boost Mode:";

    case OPTION_VALUE:
        return string_bool(save_get(save_key), true);
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Toggles Boost Mode from Sonic Advance 2.",
        "Boost Mode will still take effect if triggered by Sonic Accelerator.");
        return true;
    
    case OPTION_CHANGE:
        if (_execute) save_set(save_key, !save_get(save_key));
        return true;

    default:
        return undefined;
}