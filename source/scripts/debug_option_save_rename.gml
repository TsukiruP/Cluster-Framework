/// debug_option_save_rename(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Rename Save";
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Opens a prompt to rename the current save name.");
        return true;

    case OPTION_CONFIRM:
        if (_execute)
        {
            keyboard_string = save_get("name");
            rename_allow = true;
            rename_backup = keyboard_string;
        }

        return true;

    default:
        return undefined;
}