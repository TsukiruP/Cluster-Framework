/// debug_option_credits(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Credits";
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Displays scrolling credits.",
        "Can be moved with " + string_input(INP_UP) + " and " + string_input(INP_DOWN) " or skippedS with " + string_input(INP_START) + " or " + string_input(INP_CANCEL) + ".");
        return true;

    case OPTION_CONFIRM:
        if (_execute) instance_create_single(0, 0, mnu_credits);
        return true;

    default:
        return undefined;
}