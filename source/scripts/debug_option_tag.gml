/// debug_option_tag(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var save_key; save_key = "tag";

switch (_index)
{
    case OPTION_TEXT:
        return "Tag:";

    case OPTION_VALUE:
        return string_bool(save_get(save_key), true);
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Enables Tag Actions from Sonic Advance 3.",
        "You can cancel a Tag Action by pressing " + string_input(INP_SWAP) + ".");
        return true;
    
    case OPTION_CHANGE:
        if (_execute) save_set(save_key, !save_get(save_key));
        return true;

    default:
        return undefined;
}