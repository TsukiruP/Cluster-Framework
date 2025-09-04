/// debug_option_save_write(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Write Save";
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Opens the debug save menu and allows you to pick a save slot to store game data.",
        "Disclaimer: There is NO confirmation, so be careful about overriding a save.");
        return true;
    
    case OPTION_CONFIRM:
        if (_execute) debug_save_create(0);
        return true;

    default:
        return undefined;
}