/// debug_option_screen(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Screen";
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Allows you to customize the screen settings.");
        return true;

    case OPTION_CONFIRM:
        if (_execute) debug_set_next(debug_menu_screen);
        return true;

    default:
        return undefined;
}