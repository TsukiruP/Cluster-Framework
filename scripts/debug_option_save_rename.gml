/// debug_option_save_rename(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_return)
{
    // Text:
    case 0:
        return "Rename Save";

    // Confirm:
    case 2:
        if (_execute)
        {
            keyboard_string = game_get_save("name");
            rename_allow = true;
            rename_backup = keyboard_string;
        }
        
        return true;

    // Undefined:
    default:
        return undefined;
}