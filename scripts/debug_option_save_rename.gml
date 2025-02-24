/// debug_option_save_rename(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Rename Save";

    // Confirm:
    case 2:
        keyboard_string = game_get_save("name");
        rename_allow = true;
        rename_backup = keyboard_string;
        return true;

    // Undefined:
    default:
        return undefined;
}