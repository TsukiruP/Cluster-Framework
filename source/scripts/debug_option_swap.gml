/// debug_option_swap(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var save_key; save_key = "swap";

switch (_index)
{
    case OPTION_TEXT:
        return "Swap:";

    case OPTION_VALUE:
        return string_bool(save_get(save_key), true);
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Enables character swapping from Sonic Mania.",
        "If the partner character is offscreen, press " + string_input(INP_SWAP) + " to teleport them to you.",
        "Swapping and teleporting will not work if the partner character is not being CPU controlled.")
        return true;
    
    case OPTION_CHANGE:
        if (_execute) save_set(save_key, !save_get(save_key));
        return true;

    default:
        return undefined;
}