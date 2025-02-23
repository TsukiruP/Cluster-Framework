/// debug_option_save_read(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Read Save";

    // Confirm:
    case 2:
        save_menu_create(1);
        return true;

    // Undefined:
    default:
        return undefined;
}