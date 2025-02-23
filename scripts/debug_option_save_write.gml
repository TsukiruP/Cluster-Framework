/// debug_option_save_write(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Write Save";

    // Confirm:
    case 2:
        save_menu_create(0);
        return true;

    // Undefined:
    default:
        return undefined;
}